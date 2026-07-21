"""
Provider Manager
================

Automatic retry, failover, health tracking, and circuit breaking for LLM
providers.
"""

from __future__ import annotations

from dataclasses import dataclass
import time
from typing import Any

from app.llm.providers.base import BaseLLMProvider
from app.llm.providers.config import ProviderManagerConfig
from app.llm.providers.default_registry import build_default_provider_registry
from app.llm.providers.errors import (
    FRIENDLY_AI_UNAVAILABLE_MESSAGE,
    LLMProviderError,
)
from app.llm.providers.registry import ProviderRegistry
from app.utils.logger import logger


@dataclass
class ProviderHealth:
    """Runtime health state for one provider."""

    provider_name: str
    available: bool = True
    last_success: float | None = None
    last_failure: float | None = None
    average_latency_seconds: float | None = None
    consecutive_failures: int = 0
    unavailable_until: float | None = None

    def is_available_now(self, now: float) -> bool:
        """Return whether provider can be attempted."""

        if self.unavailable_until is None:
            return self.available

        if now >= self.unavailable_until:
            self.available = True
            self.unavailable_until = None
            return True

        return False

    def to_dict(self) -> dict[str, Any]:
        """Return safe health snapshot."""

        return {
            "provider_name": self.provider_name,
            "available": self.available,
            "last_success": self.last_success,
            "last_failure": self.last_failure,
            "average_latency_seconds": self.average_latency_seconds,
            "consecutive_failures": self.consecutive_failures,
            "unavailable_until": self.unavailable_until,
        }


class ProviderManager:
    """Manage provider priority, retry, failover, health, and circuit breaking."""

    def __init__(
        self,
        *,
        registry: ProviderRegistry,
        config: ProviderManagerConfig,
        providers: list[BaseLLMProvider] | None = None,
    ) -> None:
        """Initialize manager."""

        self._registry = registry
        self._config = config
        self._logger = logger
        self._providers = providers or self._build_providers()
        self._health: dict[str, ProviderHealth] = {
            provider.name: ProviderHealth(provider_name=provider.name)
            for provider in self._providers
        }

    def generate_text(
        self,
        prompt: str,
        *,
        temperature: float | None = None,
        max_output_tokens: int | None = None,
    ) -> dict[str, Any]:
        """
        Generate text using the first healthy provider that succeeds.

        Returns a GeminiClient-compatible response dictionary.
        """

        if not isinstance(prompt, str) or not prompt.strip():
            return self._failure_response("InvalidPrompt", "prompt is required.")

        last_error: LLMProviderError | None = None

        for provider in self._providers:
            if not provider.is_configured():
                self._logger.info(
                    "%s skipped because it is not configured.",
                    provider.__class__.__name__,
                )
                continue

            if not self._is_provider_available(provider):
                self._logger.warning(
                    "%s skipped because circuit breaker is open.",
                    provider.__class__.__name__,
                )
                continue

            provider_response, provider_error = self._try_provider(
                provider,
                prompt,
                temperature=temperature,
                max_output_tokens=max_output_tokens,
            )

            if provider_response is not None:
                return provider_response

            if provider_error is not None:
                last_error = provider_error
                self._logger.warning(
                    "%s failed. Switching to next provider if available.",
                    provider.__class__.__name__,
                )

        if last_error is not None:
            self._logger.error(
                "All LLM providers failed. Last provider=%s, status=%s, retryable=%s.",
                last_error.provider,
                last_error.status_code,
                last_error.retryable,
            )

        return self._failure_response(
            "AIServiceUnavailable",
            FRIENDLY_AI_UNAVAILABLE_MESSAGE,
        )

    def health_snapshot(self) -> list[dict[str, Any]]:
        """Return provider health snapshot for diagnostics."""

        return [health.to_dict() for health in self._health.values()]

    def _build_providers(self) -> list[BaseLLMProvider]:
        """Build providers from configured priority list."""

        providers: list[BaseLLMProvider] = []

        for provider_name in self._config.provider_priority:
            try:
                providers.append(
                    self._registry.create(
                        provider_name,
                        timeout_seconds=self._config.provider_timeout_seconds,
                    )
                )
            except Exception as exc:
                self._logger.warning(
                    "LLM provider '%s' could not be initialized: %s.",
                    provider_name,
                    exc,
                )

        return providers

    def _try_provider(
        self,
        provider: BaseLLMProvider,
        prompt: str,
        *,
        temperature: float | None,
        max_output_tokens: int | None,
    ) -> tuple[dict[str, Any] | None, LLMProviderError | None]:
        """Try one provider with retry policy."""

        last_error: LLMProviderError | None = None

        for attempt_number in range(1, self._config.retry_max_attempts + 1):
            start_time = time.monotonic()

            try:
                self._logger.info(
                    "%s attempt %s/%s with model=%s.",
                    provider.__class__.__name__,
                    attempt_number,
                    self._config.retry_max_attempts,
                    provider.model_name,
                )
                response = provider.generate_text(
                    prompt,
                    temperature=temperature,
                    max_output_tokens=max_output_tokens,
                )
                elapsed = time.monotonic() - start_time
                self._record_success(provider, elapsed)
                self._logger.info("%s succeeded.", provider.__class__.__name__)
                return response.to_dict(), None

            except LLMProviderError as exc:
                elapsed = time.monotonic() - start_time
                last_error = exc
                self._record_failure(provider, elapsed)

                self._logger.warning(
                    "%s failed: status=%s retryable=%s error_type=%s message=%s.",
                    provider.__class__.__name__,
                    exc.status_code,
                    exc.retryable,
                    exc.error_type,
                    exc.message,
                )

                if not exc.retryable:
                    break

                if attempt_number >= self._config.retry_max_attempts:
                    break

                self._sleep_before_retry(attempt_number)

        return None, last_error

    def _is_provider_available(self, provider: BaseLLMProvider) -> bool:
        """Return whether provider can currently be used."""

        health = self._health.setdefault(
            provider.name,
            ProviderHealth(provider_name=provider.name),
        )

        return health.is_available_now(time.monotonic())

    def _record_success(self, provider: BaseLLMProvider, elapsed: float) -> None:
        """Record successful provider call."""

        health = self._health.setdefault(
            provider.name,
            ProviderHealth(provider_name=provider.name),
        )

        now = time.monotonic()
        health.available = True
        health.last_success = now
        health.consecutive_failures = 0
        health.unavailable_until = None

        if health.average_latency_seconds is None:
            health.average_latency_seconds = elapsed
        else:
            health.average_latency_seconds = (
                health.average_latency_seconds * 0.8 + elapsed * 0.2
            )

    def _record_failure(self, provider: BaseLLMProvider, elapsed: float) -> None:
        """Record failed provider call and update circuit breaker."""

        health = self._health.setdefault(
            provider.name,
            ProviderHealth(provider_name=provider.name),
        )

        now = time.monotonic()
        health.last_failure = now
        health.consecutive_failures += 1

        if health.average_latency_seconds is None:
            health.average_latency_seconds = elapsed
        else:
            health.average_latency_seconds = (
                health.average_latency_seconds * 0.8 + elapsed * 0.2
            )

        if (
            health.consecutive_failures
            >= self._config.circuit_breaker_failure_threshold
        ):
            health.available = False
            health.unavailable_until = (
                now + self._config.circuit_breaker_cooldown_seconds
            )

    def _sleep_before_retry(self, attempt_number: int) -> None:
        """Sleep with exponential backoff."""

        delay = min(
            self._config.retry_base_delay_seconds * (2 ** (attempt_number - 1)),
            self._config.retry_max_delay_seconds,
        )
        time.sleep(delay)

    def _failure_response(self, error_type: str, message: str) -> dict[str, Any]:
        """Build user-safe failure response."""

        return {
            "success": False,
            "provider": None,
            "model": None,
            "text": "",
            "raw": None,
            "error": {
                "type": error_type,
                "message": message,
            },
        }


_DEFAULT_PROVIDER_MANAGER: ProviderManager | None = None


def get_default_provider_manager() -> ProviderManager:
    """Return process-wide default provider manager."""

    global _DEFAULT_PROVIDER_MANAGER

    if _DEFAULT_PROVIDER_MANAGER is None:
        _DEFAULT_PROVIDER_MANAGER = ProviderManager(
            registry=build_default_provider_registry(),
            config=ProviderManagerConfig.from_env(),
        )

    return _DEFAULT_PROVIDER_MANAGER


def reset_default_provider_manager() -> None:
    """Reset process-wide manager, primarily for tests."""

    global _DEFAULT_PROVIDER_MANAGER
    _DEFAULT_PROVIDER_MANAGER = None
