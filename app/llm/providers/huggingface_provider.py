"""
Hugging Face Provider
=====================

Hugging Face Inference API implementation of BaseLLMProvider.
"""

from __future__ import annotations

import os
from typing import Any, Mapping

from app.llm.providers.base import BaseLLMProvider, LLMProviderResponse
from app.llm.providers.errors import LLMProviderError
from app.llm.providers.http_utils import post_json


class HuggingFaceProvider(BaseLLMProvider):
    """Hugging Face Inference API provider."""

    provider_name = "huggingface"
    DEFAULT_MODEL_NAME = "HuggingFaceH4/zephyr-7b-beta"
    DEFAULT_BASE_URL = "https://api-inference.huggingface.co/models"

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
    def from_env(cls, *, timeout_seconds: float) -> HuggingFaceProvider:
        """Create provider from environment."""

        return cls(
            api_key=os.getenv("HUGGINGFACE_API_KEY") or os.getenv("HF_TOKEN"),
            model_name=os.getenv("HUGGINGFACE_MODEL") or cls.DEFAULT_MODEL_NAME,
            base_url=os.getenv("HUGGINGFACE_BASE_URL") or cls.DEFAULT_BASE_URL,
            timeout_seconds=timeout_seconds,
        )

    def is_configured(self) -> bool:
        """Return whether Hugging Face API key is configured."""

        return bool(self._api_key)

    def generate_text(
        self,
        prompt: str,
        *,
        temperature: float | None = None,
        max_output_tokens: int | None = None,
    ) -> LLMProviderResponse:
        """Generate text with Hugging Face Inference API."""

        clean_prompt = self._validate_prompt(prompt)

        if not self.is_configured():
            raise LLMProviderError(
                provider=self.name,
                message="Hugging Face API key is not configured.",
                retryable=False,
                status_code=401,
                error_type="ConfigurationError",
            )

        parameters: dict[str, Any] = {
            "return_full_text": False,
        }
        if temperature is not None:
            parameters["temperature"] = temperature
        if max_output_tokens is not None:
            parameters["max_new_tokens"] = max_output_tokens

        payload = {
            "inputs": clean_prompt,
            "parameters": parameters,
        }

        _, data = post_json(
            provider=self.name,
            url=f"{self._base_url}/{self.model_name}",
            headers={"Authorization": f"Bearer {self._api_key}"},
            payload=payload,
            timeout_seconds=self._timeout_seconds,
        )

        text = self._extract_text(data, clean_prompt)
        return LLMProviderResponse(
            success=True,
            provider=self.name,
            model=self.model_name,
            text=text,
            raw={"response_type": data.__class__.__name__},
            error=None,
        )

    def _extract_text(self, data: Mapping[str, Any], prompt: str) -> str:
        """Extract text from Hugging Face response."""

        raw_data = data.get("data")
        if isinstance(raw_data, list) and raw_data:
            first_item = raw_data[0]
            if isinstance(first_item, Mapping):
                generated = first_item.get("generated_text")
                if isinstance(generated, str) and generated.strip():
                    return self._strip_prompt(generated, prompt)

        generated = data.get("generated_text")
        if isinstance(generated, str) and generated.strip():
            return self._strip_prompt(generated, prompt)

        raise LLMProviderError(
            provider=self.name,
            message="Hugging Face response text is unavailable.",
            retryable=False,
            error_type="InvalidProviderResponse",
            raw=data,
        )

    def _strip_prompt(self, generated_text: str, prompt: str) -> str:
        """Remove prompt prefix when provider returns full text."""

        clean_generated = generated_text.strip()
        clean_prompt = prompt.strip()

        if clean_generated.startswith(clean_prompt):
            return clean_generated[len(clean_prompt):].strip()

        return clean_generated
