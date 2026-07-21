"""
AI Generation Service
=====================

Service layer adapter for provider-neutral AI generation.

This service owns prompt construction and response formatting for conversational
AI use cases. It does not access repositories, databases, FastAPI, or Streamlit.
Provider access is delegated to ProviderManager through the AI Provider layer.
"""

from __future__ import annotations

from typing import Any, Mapping

from app.llm.gemini_client import GeminiClient
from app.llm.prompt_builder import PromptBuilder
from app.llm.providers.provider_manager import (
    ProviderManager,
    get_default_provider_manager,
)
from app.llm.response_formatter import ResponseFormatter
from app.utils.logger import logger


class AIGenerationService:
    """
    Generate natural-language AI responses using the configured LLM providers.

    Public interface is intentionally backward-compatible. Existing callers may
    continue calling generate_conversation_response(...), generate_text(...), or
    await generate(...).
    """

    DEFAULT_SYSTEM_INSTRUCTION = """
You are UMKM Copilot AI, a practical business assistant for micro, small, and
medium enterprises.

Answer the user's question directly and naturally.

Rules:
- If the question is a general concept, answer generally and clearly.
- If the question is related to the user's business, use the business context
  when it is relevant.
- If the business context is not relevant, do not force it into the answer.
- Do not merely repeat dashboard metrics unless the user asks for business data.
- Keep answers actionable, concise, and easy to understand.
- Reply in the same language as the user's question when possible.
"""

    FRIENDLY_FALLBACK_TEXT = (
        "The AI service is temporarily unavailable. Please try again shortly."
    )

    def __init__(
        self,
        prompt_builder: PromptBuilder,
        response_formatter: ResponseFormatter,
        gemini_client: GeminiClient | None = None,
        provider_manager: ProviderManager | None = None,
    ) -> None:
        """Initialize AI generation service."""

        self._gemini_client = gemini_client
        self._provider_manager = provider_manager
        self._prompt_builder = prompt_builder
        self._response_formatter = response_formatter
        self._logger = logger

    def generate_conversation_response(
        self,
        *,
        user_input: str,
        business_context: Mapping[str, Any] | None = None,
        conversation_history: list[Mapping[str, Any]] | None = None,
        temperature: float = 0.3,
        max_output_tokens: int = 1024,
    ) -> dict[str, Any]:
        """
        Generate a conversational answer.

        Args:
            user_input: User prompt.
            business_context: Optional structured business context.
            conversation_history: Optional conversation history.
            temperature: LLM temperature.
            max_output_tokens: LLM output limit.

        Returns:
            Structured service response containing answer text and LLM metadata.
        """

        try:
            self._validate_user_input(user_input)

            prompt = self._prompt_builder.build_chat_prompt(
                system_instruction=self.DEFAULT_SYSTEM_INSTRUCTION,
                business_context=dict(business_context or {}),
                conversation_history=conversation_history or [],
                user_input=user_input,
            )

            llm_response = self.generate_text(
                prompt,
                temperature=temperature,
                max_output_tokens=max_output_tokens,
            )
            formatted_response = self._response_formatter.format_text_response(
                llm_response,
                fallback_text=self.FRIENDLY_FALLBACK_TEXT,
            )

            if not formatted_response.get("success"):
                return self._friendly_error_response()

            data = formatted_response.get("data")
            if not isinstance(data, Mapping):
                return self._friendly_error_response()

            answer = str(data.get("text") or "").strip()
            if not answer:
                return self._friendly_error_response()

            return {
                "success": True,
                "data": {
                    "answer": answer,
                    "text": answer,
                    "provider": data.get("provider"),
                    "model": data.get("model"),
                },
                "error": None,
            }

        except Exception as exc:
            self._logger.exception("AI generation failed.")
            return self._friendly_error_response(error_type=exc.__class__.__name__)

    def generate_text(
        self,
        prompt: str,
        *,
        temperature: float | None = None,
        max_output_tokens: int | None = None,
    ) -> dict[str, Any]:
        """
        Generate raw text from a prompt.

        This method preserves the old GeminiClient-compatible response shape:
        success/provider/model/text/raw/error.
        """

        self._validate_user_input(prompt)

        if self._gemini_client is not None:
            return self._gemini_client.generate_text(
                prompt,
                temperature=temperature,
                max_output_tokens=max_output_tokens,
            )

        return self._get_provider_manager().generate_text(
            prompt,
            temperature=temperature,
            max_output_tokens=max_output_tokens,
        )

    async def generate(
        self,
        prompt: str,
        *,
        temperature: float | None = None,
        max_output_tokens: int | None = None,
    ) -> dict[str, Any]:
        """
        Async-compatible generation method.

        Existing async callers using await ai_generation_service.generate(...)
        can continue working without modification.
        """

        return self.generate_text(
            prompt,
            temperature=temperature,
            max_output_tokens=max_output_tokens,
        )

    def provider_health(self) -> list[dict[str, Any]]:
        """Return provider health snapshot for developer diagnostics."""

        return self._get_provider_manager().health_snapshot()

    def _get_provider_manager(self) -> ProviderManager:
        """Return configured provider manager."""

        if self._provider_manager is None:
            self._provider_manager = get_default_provider_manager()

        return self._provider_manager

    def _validate_user_input(self, user_input: str) -> None:
        """Validate user input."""

        if not isinstance(user_input, str) or not user_input.strip():
            raise ValueError("user_input is required.")

    def _friendly_error_response(
        self,
        *,
        error_type: str = "AIServiceUnavailable",
    ) -> dict[str, Any]:
        """Build user-safe error response."""

        return {
            "success": False,
            "data": {},
            "error": {
                "type": error_type,
                "message": self.FRIENDLY_FALLBACK_TEXT,
            },
        }
