"""
OpenRouter Provider
===================

OpenRouter implementation of BaseLLMProvider.
"""

from __future__ import annotations

import os
from typing import Any, Mapping

from app.llm.providers.base import BaseLLMProvider, LLMProviderResponse
from app.llm.providers.errors import LLMProviderError
from app.llm.providers.http_utils import post_json


class OpenRouterProvider(BaseLLMProvider):
    """OpenRouter provider."""

    provider_name = "openrouter"
    DEFAULT_MODEL_NAME = "google/gemini-2.0-flash-exp:free"
    DEFAULT_BASE_URL = "https://openrouter.ai/api/v1"

    def __init__(
        self,
        *,
        api_key: str | None,
        model_name: str,
        base_url: str,
        timeout_seconds: float,
    ) -> None:
        """Initialize provider."""

        super().__init__(model_name=model_name, timeout_seconds=timeout_seconds)
        self._api_key = api_key.strip() if isinstance(api_key, str) else None
        self._base_url = base_url.strip().rstrip("/")

    @classmethod
    def from_env(cls, *, timeout_seconds: float) -> OpenRouterProvider:
        """Create provider from environment."""

        return cls(
            api_key=os.getenv("OPENROUTER_API_KEY"),
            model_name=os.getenv("OPENROUTER_MODEL") or cls.DEFAULT_MODEL_NAME,
            base_url=os.getenv("OPENROUTER_BASE_URL") or cls.DEFAULT_BASE_URL,
            timeout_seconds=timeout_seconds,
        )

    def is_configured(self) -> bool:
        """Return whether OpenRouter API key is configured."""

        return bool(self._api_key)

    def generate_text(
        self,
        prompt: str,
        *,
        temperature: float | None = None,
        max_output_tokens: int | None = None,
    ) -> LLMProviderResponse:
        """Generate text with OpenRouter."""

        clean_prompt = self._validate_prompt(prompt)

        if not self.is_configured():
            raise LLMProviderError(
                provider=self.name,
                message="OpenRouter API key is not configured.",
                retryable=False,
                status_code=401,
                error_type="ConfigurationError",
            )

        payload: dict[str, Any] = {
            "model": self.model_name,
            "messages": [{"role": "user", "content": clean_prompt}],
        }

        if temperature is not None:
            payload["temperature"] = temperature
        if max_output_tokens is not None:
            payload["max_tokens"] = max_output_tokens

        _, data = post_json(
            provider=self.name,
            url=f"{self._base_url}/chat/completions",
            headers={
                "Authorization": f"Bearer {self._api_key}",
                "HTTP-Referer": os.getenv("OPENROUTER_SITE_URL", "http://localhost"),
                "X-Title": os.getenv("OPENROUTER_APP_NAME", "UMKM Copilot AI"),
            },
            payload=payload,
            timeout_seconds=self._timeout_seconds,
        )

        text = self._extract_text(data)
        return LLMProviderResponse(
            success=True,
            provider=self.name,
            model=self.model_name,
            text=text,
            raw=self._safe_raw(data),
            error=None,
        )

    def _extract_text(self, data: Mapping[str, Any]) -> str:
        """Extract text from OpenRouter response."""

        choices = data.get("choices")
        if isinstance(choices, list) and choices:
            first_choice = choices[0]
            if isinstance(first_choice, Mapping):
                message = first_choice.get("message")
                if isinstance(message, Mapping):
                    content = message.get("content")
                    if isinstance(content, str) and content.strip():
                        return content.strip()

                text = first_choice.get("text")
                if isinstance(text, str) and text.strip():
                    return text.strip()

        raise LLMProviderError(
            provider=self.name,
            message="OpenRouter response text is unavailable.",
            retryable=False,
            error_type="InvalidProviderResponse",
            raw=data,
        )

    def _safe_raw(self, data: Mapping[str, Any]) -> dict[str, Any]:
        """Build safe raw metadata."""

        return {
            "id": data.get("id"),
            "object": data.get("object"),
            "created": data.get("created"),
        }
