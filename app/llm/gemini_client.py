"""
Gemini Client
=============

Backward-compatible Gemini client wrapper.

New production AI generation should use ProviderManager through
AIGenerationService. This class remains available for tests and legacy callers
that expect GeminiClient.generate_text()/generate().
"""

from __future__ import annotations

import os
from typing import Any, Protocol

from app.llm.providers.gemini_provider import GeminiProvider
from app.llm.providers.provider_manager import ProviderManager
from app.llm.providers.registry import ProviderRegistry
from app.llm.providers.config import ProviderManagerConfig
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

    This class is kept for backward compatibility. Internally it delegates to
    GeminiProvider/ProviderManager, so retry and error normalization remain
    consistent with the Multi-LLM provider layer.
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
        """Initialize Gemini client."""

        self._logger = logger
        self._model_name = self._resolve_model_name(model_name)
        self._generation_config = generation_config or {}
        self._safety_settings = safety_settings

        provider = GeminiProvider(
            api_key=self._resolve_api_key(api_key),
            model_name=self._model_name,
            timeout_seconds=float(os.getenv("LLM_PROVIDER_TIMEOUT_SECONDS", "30")),
            model=model,
        )
        registry = ProviderRegistry()
        registry.register(GeminiProvider.provider_name, GeminiProvider)

        self._provider_manager = ProviderManager(
            registry=registry,
            config=ProviderManagerConfig(
                provider_priority=(GeminiProvider.provider_name,),
                retry_max_attempts=int(os.getenv("LLM_RETRY_MAX_ATTEMPTS", "2")),
                retry_base_delay_seconds=float(
                    os.getenv("LLM_RETRY_BASE_DELAY_SECONDS", "0.5")
                ),
                retry_max_delay_seconds=float(
                    os.getenv("LLM_RETRY_MAX_DELAY_SECONDS", "4.0")
                ),
                provider_timeout_seconds=float(
                    os.getenv("LLM_PROVIDER_TIMEOUT_SECONDS", "30")
                ),
                circuit_breaker_failure_threshold=int(
                    os.getenv("LLM_CIRCUIT_BREAKER_FAILURE_THRESHOLD", "3")
                ),
                circuit_breaker_cooldown_seconds=float(
                    os.getenv("LLM_CIRCUIT_BREAKER_COOLDOWN_SECONDS", "60")
                ),
            ),
            providers=[provider],
        )

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
        """Generate text from prompt."""

        return self._provider_manager.generate_text(
            prompt,
            temperature=temperature,
            max_output_tokens=max_output_tokens,
        )

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

    def _resolve_api_key(self, api_key: str | None) -> str | None:
        """Resolve API key without raising for injected-model tests."""

        return (
            api_key
            or os.getenv("GEMINI_API_KEY")
            or os.getenv("GOOGLE_API_KEY")
        )

    def _resolve_model_name(self, model_name: str | None) -> str:
        """Resolve Gemini model name from argument, env, or default."""

        resolved_model_name = (
            model_name
            or os.getenv("GEMINI_MODEL")
            or os.getenv("GEMINI_MODEL_NAME")
            or self.DEFAULT_MODEL_NAME
        )

        if not isinstance(resolved_model_name, str) or not resolved_model_name.strip():
            raise ValueError("model_name is required.")

        clean_model_name = resolved_model_name.strip()
        if clean_model_name.startswith("models/"):
            clean_model_name = clean_model_name.replace("models/", "", 1)

        return clean_model_name
