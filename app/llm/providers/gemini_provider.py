"""
Gemini Provider
===============

Google Gemini implementation of BaseLLMProvider.
"""

from __future__ import annotations

import os
from typing import Any

from app.llm.providers.base import BaseLLMProvider, LLMProviderResponse
from app.llm.providers.errors import LLMProviderError, provider_error_from_exception


class GeminiProvider(BaseLLMProvider):
    """Google Gemini provider."""

    provider_name = "gemini"
    DEFAULT_MODEL_NAME = "gemini-2.0-flash-lite"

    def __init__(
        self,
        *,
        api_key: str | None,
        model_name: str,
        timeout_seconds: float,
        model: Any | None = None,
    ) -> None:
        """Initialize Gemini provider."""

        super().__init__(model_name=model_name, timeout_seconds=timeout_seconds)
        self._api_key = api_key.strip() if isinstance(api_key, str) else None
        self._model = model

    @classmethod
    def from_env(cls, *, timeout_seconds: float) -> GeminiProvider:
        """Create Gemini provider from environment."""

        model_name = (
            os.getenv("GEMINI_MODEL")
            or os.getenv("GEMINI_MODEL_NAME")
            or cls.DEFAULT_MODEL_NAME
        )

        return cls(
            api_key=os.getenv("GEMINI_API_KEY") or os.getenv("GOOGLE_API_KEY"),
            model_name=model_name,
            timeout_seconds=timeout_seconds,
        )

    def is_configured(self) -> bool:
        """Return whether Gemini API key is configured."""

        return bool(self._api_key)

    def generate_text(
        self,
        prompt: str,
        *,
        temperature: float | None = None,
        max_output_tokens: int | None = None,
    ) -> LLMProviderResponse:
        """Generate text with Gemini."""

        clean_prompt = self._validate_prompt(prompt)

        if not self.is_configured():
            raise LLMProviderError(
                provider=self.name,
                message="Gemini API key is not configured.",
                retryable=False,
                status_code=401,
                error_type="ConfigurationError",
            )

        try:
            model = self._get_model()
            kwargs: dict[str, Any] = {}
            generation_config: dict[str, Any] = {}

            if temperature is not None:
                generation_config["temperature"] = temperature
            if max_output_tokens is not None:
                generation_config["max_output_tokens"] = max_output_tokens
            if generation_config:
                kwargs["generation_config"] = generation_config

            response = model.generate_content(clean_prompt, **kwargs)
            text = self._extract_text(response)

            return LLMProviderResponse(
                success=True,
                provider=self.name,
                model=self.model_name,
                text=text,
                raw={"response_type": response.__class__.__name__},
                error=None,
            )
        except LLMProviderError:
            raise
        except Exception as exc:
            raise provider_error_from_exception(
                provider=self.name,
                error=exc,
            ) from exc

    def _get_model(self) -> Any:
        """Return lazy Gemini model."""

        if self._model is not None:
            return self._model

        try:
            import google.generativeai as genai
        except ImportError as exc:
            raise LLMProviderError(
                provider=self.name,
                message="google-generativeai package is required for Gemini.",
                retryable=False,
                error_type="MissingDependency",
            ) from exc

        genai.configure(api_key=self._api_key)
        self._model = genai.GenerativeModel(self.model_name)

        return self._model

    def _extract_text(self, response: Any) -> str:
        """Extract text from Gemini response."""

        text = getattr(response, "text", None)
        if isinstance(text, str) and text.strip():
            return text.strip()

        candidates = getattr(response, "candidates", None)
        if isinstance(candidates, list):
            parts_text: list[str] = []
            for candidate in candidates:
                content = getattr(candidate, "content", None)
                parts = getattr(content, "parts", None)
                if not isinstance(parts, list):
                    continue
                for part in parts:
                    part_text = getattr(part, "text", None)
                    if isinstance(part_text, str) and part_text.strip():
                        parts_text.append(part_text.strip())

            joined = "\n".join(parts_text).strip()
            if joined:
                return joined

        raise LLMProviderError(
            provider=self.name,
            message="Gemini response text is unavailable.",
            retryable=False,
            error_type="InvalidProviderResponse",
        )
