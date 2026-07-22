"""
Gemini Client
=============

Backward-compatible Gemini client wrapper.

New production AI generation uses ProviderManager through AIGenerationService.
This class remains available for tests and legacy callers that expect the old
GeminiClient.generate_text()/generate() behaviour.
"""

from __future__ import annotations

import os
from typing import Any, Protocol

from app.utils.logger import logger


class GeminiModelProtocol(Protocol):
    """
    Protocol for Gemini-compatible model objects.

    The protocol allows tests to inject fake models without making network
    requests or requiring a real Gemini API key.
    """

    def generate_content(
        self,
        contents: str | list[Any],
        **kwargs: Any,
    ) -> Any:
        """Generate content from prompt."""


class GeminiClient:
    """
    Client wrapper for Gemini text generation.

    This class is intentionally backward-compatible with the original LLM layer
    tests. It is not the production Multi-LLM failover entrypoint; production
    AI generation is handled by AIGenerationService -> ProviderManager.
    """

    DEFAULT_MODEL_NAME = "gemini-2.0-flash-lite"

    def __init__(
        self,
        api_key: str | None = None,
        model_name: str | None = None,
        model: GeminiModelProtocol | None = None,
        generation_config: dict[str, Any] | None = None,
        safety_settings: list[dict[str, Any]] | None = None,
    ) -> None:
        """
        Initialize Gemini client.

        Args:
            api_key: Gemini API key. If omitted, GEMINI_API_KEY or
                GOOGLE_API_KEY is read from environment when a real model is
                required.
            model_name: Gemini model name. If omitted, GEMINI_MODEL or
                GEMINI_MODEL_NAME is read from environment.
            model: Optional injected model used for tests or custom transport.
            generation_config: Optional generation configuration.
            safety_settings: Optional safety settings.
        """

        self._logger = logger
        self._model_name = self._resolve_model_name(model_name)
        self._generation_config = generation_config or {}
        self._safety_settings = safety_settings
        self._model = model

        if self._model is None:
            resolved_api_key = self._resolve_api_key(api_key)
            self._model = self._create_real_model(resolved_api_key)

    @property
    def model_name(self) -> str:
        """Return configured model name."""

        return self._model_name

    def generate_text(
        self,
        prompt: str,
        *,
        temperature: float | None = None,
        max_output_tokens: int | None = None,
    ) -> dict[str, Any]:
        """
        Generate text from prompt.

        The response shape is preserved for existing tests and callers:
        success/provider/model/text/raw/error.
        """

        try:
            self._validate_prompt(prompt)
            generation_config = dict(self._generation_config)

            if temperature is not None:
                generation_config["temperature"] = temperature

            if max_output_tokens is not None:
                generation_config["max_output_tokens"] = max_output_tokens

            kwargs: dict[str, Any] = {}

            if generation_config:
                kwargs["generation_config"] = generation_config

            if self._safety_settings is not None:
                kwargs["safety_settings"] = self._safety_settings

            self._logger.info(
                "Generating Gemini response with model=%s.",
                self._model_name,
            )

            response = self._model.generate_content(prompt, **kwargs)
            text = self._extract_text(response)

            return {
                "success": True,
                "provider": "gemini",
                "model": self._model_name,
                "text": text,
                "raw": self._safe_raw_response(response),
                "error": None,
            }

        except Exception as exc:
            return self._error_response(exc)

    def generate(
        self,
        prompt: str,
        *,
        temperature: float | None = None,
        max_output_tokens: int | None = None,
    ) -> dict[str, Any]:
        """Generate text from prompt."""

        return self.generate_text(
            prompt,
            temperature=temperature,
            max_output_tokens=max_output_tokens,
        )

    def _resolve_api_key(self, api_key: str | None) -> str:
        """Resolve Gemini API key from argument or environment."""

        resolved_api_key = api_key or os.getenv("GEMINI_API_KEY") or os.getenv("GOOGLE_API_KEY")

        if resolved_api_key is None or not resolved_api_key.strip():
            raise RuntimeError("Gemini API key is required when no model is injected.")

        return resolved_api_key.strip()

    def _resolve_model_name(self, model_name: str | None) -> str:
        """Resolve Gemini model name from argument, environment, or default."""

        resolved_model_name = (
            model_name
            or os.getenv("GEMINI_MODEL")
            or os.getenv("GEMINI_MODEL_NAME")
            or self.DEFAULT_MODEL_NAME
        )

        return self._validate_model_name(resolved_model_name)

    def _create_real_model(self, api_key: str) -> GeminiModelProtocol:
        """Create real Gemini model from SDK."""

        try:
            import google.generativeai as genai
        except ImportError as exc:
            raise RuntimeError(
                "google-generativeai package is required for real Gemini calls."
            ) from exc

        genai.configure(api_key=api_key)

        return genai.GenerativeModel(self._model_name)

    def _extract_text(self, response: Any) -> str:
        """Extract text from provider response."""

        text = getattr(response, "text", None)

        if isinstance(text, str) and text.strip():
            return text.strip()

        if isinstance(response, str) and response.strip():
            return response.strip()

        if isinstance(response, dict):
            candidate_text = response.get("text")
            if isinstance(candidate_text, str) and candidate_text.strip():
                return candidate_text.strip()

        candidates = getattr(response, "candidates", None)
        if isinstance(candidates, list):
            extracted = self._extract_text_from_candidates(candidates)
            if extracted:
                return extracted

        raise RuntimeError("Gemini response text is unavailable.")

    def _extract_text_from_candidates(self, candidates: list[Any]) -> str:
        """Extract text from Gemini candidates."""

        parts_text: list[str] = []

        for candidate in candidates:
            content = getattr(candidate, "content", None)
            parts = getattr(content, "parts", None)

            if not isinstance(parts, list):
                continue

            for part in parts:
                text = getattr(part, "text", None)
                if isinstance(text, str) and text.strip():
                    parts_text.append(text.strip())

        return "\n".join(parts_text).strip()

    def _safe_raw_response(self, response: Any) -> dict[str, Any]:
        """Build safe raw response metadata."""

        if isinstance(response, dict):
            return {
                key: value
                for key, value in response.items()
                if key not in {"api_key", "credential", "credentials"}
            }

        return {
            "response_type": response.__class__.__name__,
        }

    def _error_response(self, error: Exception) -> dict[str, Any]:
        """Build error response."""

        self._logger.exception(
            "Gemini generation failed with model=%s.",
            self._model_name,
        )

        return {
            "success": False,
            "provider": "gemini",
            "model": self._model_name,
            "text": "",
            "raw": None,
            "error": {
                "type": error.__class__.__name__,
                "message": str(error),
            },
        }

    def _validate_prompt(self, prompt: str) -> None:
        """Validate prompt."""

        if not isinstance(prompt, str) or not prompt.strip():
            raise ValueError("prompt is required.")

    def _validate_model_name(self, model_name: str) -> str:
        """Validate model name."""

        if not isinstance(model_name, str) or not model_name.strip():
            raise ValueError("model_name is required.")

        clean_model_name = model_name.strip()
        if clean_model_name.startswith("models/"):
            clean_model_name = clean_model_name.replace("models/", "", 1)

        return clean_model_name
