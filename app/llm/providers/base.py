"""
Base LLM Provider
=================

Provider abstraction for vendor-neutral LLM generation.

This module contains no vendor-specific code. Every concrete provider must
implement BaseLLMProvider and return LLMProviderResponse.
"""

from __future__ import annotations

from abc import ABC, abstractmethod
from collections.abc import Mapping
from dataclasses import dataclass
from typing import Any


@dataclass(frozen=True)
class LLMProviderResponse:
    """Normalized provider response."""

    success: bool
    provider: str
    model: str
    text: str
    raw: Mapping[str, Any] | None = None
    error: Mapping[str, Any] | None = None

    def to_dict(self) -> dict[str, Any]:
        """Return dictionary representation compatible with ResponseFormatter."""

        return {
            "success": self.success,
            "provider": self.provider,
            "model": self.model,
            "text": self.text,
            "raw": dict(self.raw or {}),
            "error": dict(self.error or {}) if self.error else None,
        }


class BaseLLMProvider(ABC):
    """
    Abstract base class for all LLM providers.

    Business logic must never depend on concrete providers. ProviderManager
    depends only on this abstraction.
    """

    provider_name: str

    def __init__(
        self,
        *,
        model_name: str,
        timeout_seconds: float,
    ) -> None:
        """Initialize provider."""

        self._model_name = self._validate_model_name(model_name)
        self._timeout_seconds = self._validate_timeout(timeout_seconds)

    @classmethod
    @abstractmethod
    def from_env(cls, *, timeout_seconds: float) -> BaseLLMProvider:
        """Create provider from environment variables."""

    @property
    def name(self) -> str:
        """Return provider name."""

        return self.provider_name

    @property
    def model_name(self) -> str:
        """Return provider model name."""

        return self._model_name

    @abstractmethod
    def is_configured(self) -> bool:
        """Return whether provider has enough configuration to be used."""

    @abstractmethod
    def generate_text(
        self,
        prompt: str,
        *,
        temperature: float | None = None,
        max_output_tokens: int | None = None,
    ) -> LLMProviderResponse:
        """Generate text from prompt."""

    def _validate_prompt(self, prompt: str) -> str:
        """Validate and normalize prompt."""

        if not isinstance(prompt, str) or not prompt.strip():
            raise ValueError("prompt is required.")

        return prompt.strip()

    def _validate_model_name(self, model_name: str) -> str:
        """Validate model name."""

        if not isinstance(model_name, str) or not model_name.strip():
            raise ValueError("model_name is required.")

        clean_model_name = model_name.strip()
        if clean_model_name.startswith("models/"):
            clean_model_name = clean_model_name.replace("models/", "", 1)

        return clean_model_name

    def _validate_timeout(self, timeout_seconds: float) -> float:
        """Validate timeout."""

        if not isinstance(timeout_seconds, (int, float)) or timeout_seconds <= 0:
            raise ValueError("timeout_seconds must be a positive number.")

        return float(timeout_seconds)
