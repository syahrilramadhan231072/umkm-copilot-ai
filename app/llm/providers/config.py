"""
LLM Provider Configuration
==========================

Environment-backed configuration for ProviderManager and providers.
"""

from __future__ import annotations

from dataclasses import dataclass
import os


DEFAULT_PROVIDER_PRIORITY = "gemini,openrouter,huggingface,ollama"


@dataclass(frozen=True)
class ProviderManagerConfig:
    """ProviderManager configuration."""

    provider_priority: tuple[str, ...]
    retry_max_attempts: int
    retry_base_delay_seconds: float
    retry_max_delay_seconds: float
    provider_timeout_seconds: float
    circuit_breaker_failure_threshold: int
    circuit_breaker_cooldown_seconds: float

    @classmethod
    def from_env(cls) -> ProviderManagerConfig:
        """Build config from environment variables."""

        return cls(
            provider_priority=_parse_provider_priority(
                os.getenv("LLM_PROVIDER_PRIORITY", DEFAULT_PROVIDER_PRIORITY)
            ),
            retry_max_attempts=_env_int("LLM_RETRY_MAX_ATTEMPTS", 2),
            retry_base_delay_seconds=_env_float(
                "LLM_RETRY_BASE_DELAY_SECONDS",
                0.5,
            ),
            retry_max_delay_seconds=_env_float("LLM_RETRY_MAX_DELAY_SECONDS", 4.0),
            provider_timeout_seconds=_env_float("LLM_PROVIDER_TIMEOUT_SECONDS", 30.0),
            circuit_breaker_failure_threshold=_env_int(
                "LLM_CIRCUIT_BREAKER_FAILURE_THRESHOLD",
                3,
            ),
            circuit_breaker_cooldown_seconds=_env_float(
                "LLM_CIRCUIT_BREAKER_COOLDOWN_SECONDS",
                60.0,
            ),
        )


def _parse_provider_priority(raw_value: str) -> tuple[str, ...]:
    """Parse comma-separated provider priority."""

    values = tuple(
        value.strip().lower()
        for value in raw_value.split(",")
        if value.strip()
    )

    if not values:
        return tuple(
            value.strip()
            for value in DEFAULT_PROVIDER_PRIORITY.split(",")
        )

    return values


def _env_int(name: str, default: int) -> int:
    """Read positive int env variable."""

    raw_value = os.getenv(name)
    if raw_value is None or not raw_value.strip():
        return default

    try:
        value = int(raw_value)
    except ValueError:
        return default

    return value if value > 0 else default


def _env_float(name: str, default: float) -> float:
    """Read positive float env variable."""

    raw_value = os.getenv(name)
    if raw_value is None or not raw_value.strip():
        return default

    try:
        value = float(raw_value)
    except ValueError:
        return default

    return value if value > 0 else default
