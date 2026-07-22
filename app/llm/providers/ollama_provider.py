"""
Ollama Provider
===============

Local Ollama implementation of BaseLLMProvider.
"""

from __future__ import annotations

import os
from collections.abc import Mapping
from typing import Any

from app.llm.providers.base import BaseLLMProvider, LLMProviderResponse
from app.llm.providers.errors import LLMProviderError
from app.llm.providers.http_utils import post_json


class OllamaProvider(BaseLLMProvider):
    """Ollama local provider."""

    provider_name = "ollama"
    DEFAULT_MODEL_NAME = "llama3.2"
    DEFAULT_BASE_URL = "http://localhost:11434"

    def __init__(
        self,
        *,
        model_name: str,
        base_url: str,
        timeout_seconds: float,
    ) -> None:
        """Initialize provider."""

        super().__init__(model_name=model_name, timeout_seconds=timeout_seconds)
        self._base_url = base_url.strip().rstrip("/")

    @classmethod
    def from_env(cls, *, timeout_seconds: float) -> OllamaProvider:
        """Create provider from environment."""

        return cls(
            model_name=os.getenv("OLLAMA_MODEL") or cls.DEFAULT_MODEL_NAME,
            base_url=os.getenv("OLLAMA_BASE_URL") or cls.DEFAULT_BASE_URL,
            timeout_seconds=timeout_seconds,
        )

    def is_configured(self) -> bool:
        """Return whether Ollama should be attempted."""

        return bool(self._base_url and self.model_name)

    def generate_text(
        self,
        prompt: str,
        *,
        temperature: float | None = None,
        max_output_tokens: int | None = None,
    ) -> LLMProviderResponse:
        """Generate text with local Ollama."""

        clean_prompt = self._validate_prompt(prompt)

        options: dict[str, Any] = {}
        if temperature is not None:
            options["temperature"] = temperature
        if max_output_tokens is not None:
            options["num_predict"] = max_output_tokens

        payload: dict[str, Any] = {
            "model": self.model_name,
            "prompt": clean_prompt,
            "stream": False,
        }
        if options:
            payload["options"] = options

        _, data = post_json(
            provider=self.name,
            url=f"{self._base_url}/api/generate",
            headers={},
            payload=payload,
            timeout_seconds=self._timeout_seconds,
        )

        text = self._extract_text(data)
        return LLMProviderResponse(
            success=True,
            provider=self.name,
            model=self.model_name,
            text=text,
            raw={"done": data.get("done")},
            error=None,
        )

    def _extract_text(self, data: Mapping[str, Any]) -> str:
        """Extract text from Ollama response."""

        response = data.get("response")
        if isinstance(response, str) and response.strip():
            return response.strip()

        raise LLMProviderError(
            provider=self.name,
            message="Ollama response text is unavailable.",
            retryable=False,
            error_type="InvalidProviderResponse",
            raw=data,
        )
