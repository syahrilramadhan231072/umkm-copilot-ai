from __future__ import annotations

from app.llm.providers.base import BaseLLMProvider, LLMProviderResponse
from app.llm.providers.config import ProviderManagerConfig
from app.llm.providers.errors import LLMProviderError
from app.llm.providers.provider_manager import ProviderManager
from app.llm.providers.registry import ProviderRegistry


class FailingProvider(BaseLLMProvider):
    provider_name = "failing"

    @classmethod
    def from_env(cls, *, timeout_seconds: float) -> FailingProvider:
        return cls(model_name="fake", timeout_seconds=timeout_seconds)

    def is_configured(self) -> bool:
        return True

    def generate_text(self, prompt: str, **kwargs):
        raise LLMProviderError(
            provider=self.name,
            message="HTTP 429 quota exceeded",
            retryable=True,
            status_code=429,
        )


class UnauthorizedProvider(BaseLLMProvider):
    provider_name = "unauthorized"
    attempts = 0

    @classmethod
    def from_env(cls, *, timeout_seconds: float) -> UnauthorizedProvider:
        return cls(model_name="fake", timeout_seconds=timeout_seconds)

    def is_configured(self) -> bool:
        return True

    def generate_text(self, prompt: str, **kwargs):
        self.__class__.attempts += 1
        raise LLMProviderError(
            provider=self.name,
            message="HTTP 401",
            retryable=False,
            status_code=401,
        )


class SuccessProvider(BaseLLMProvider):
    provider_name = "success"

    @classmethod
    def from_env(cls, *, timeout_seconds: float) -> SuccessProvider:
        return cls(model_name="fake", timeout_seconds=timeout_seconds)

    def is_configured(self) -> bool:
        return True

    def generate_text(self, prompt: str, **kwargs):
        return LLMProviderResponse(
            success=True,
            provider=self.name,
            model=self.model_name,
            text="fallback success",
        )


def _config(priority: tuple[str, ...]) -> ProviderManagerConfig:
    return ProviderManagerConfig(
        provider_priority=priority,
        retry_max_attempts=2,
        retry_base_delay_seconds=0.001,
        retry_max_delay_seconds=0.001,
        provider_timeout_seconds=1,
        circuit_breaker_failure_threshold=2,
        circuit_breaker_cooldown_seconds=0.1,
    )


def test_provider_manager_fails_over_to_next_provider() -> None:
    registry = ProviderRegistry()
    registry.register("failing", FailingProvider)
    registry.register("success", SuccessProvider)

    manager = ProviderManager(registry=registry, config=_config(("failing", "success")))
    response = manager.generate_text("hello")

    assert response["success"] is True
    assert response["provider"] == "success"
    assert response["text"] == "fallback success"


def test_provider_manager_does_not_retry_non_retryable_failure() -> None:
    UnauthorizedProvider.attempts = 0
    registry = ProviderRegistry()
    registry.register("unauthorized", UnauthorizedProvider)

    manager = ProviderManager(registry=registry, config=_config(("unauthorized",)))
    response = manager.generate_text("hello")

    assert response["success"] is False
    assert response["error"]["type"] == "AIServiceUnavailable"
    assert UnauthorizedProvider.attempts == 1


def test_provider_manager_returns_friendly_error_when_all_fail() -> None:
    registry = ProviderRegistry()
    registry.register("failing", FailingProvider)

    manager = ProviderManager(registry=registry, config=_config(("failing",)))
    response = manager.generate_text("hello")

    assert response["success"] is False
    assert response["error"]["type"] == "AIServiceUnavailable"
    assert "temporarily unavailable" in response["error"]["message"]
