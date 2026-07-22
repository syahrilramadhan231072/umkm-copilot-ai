"""
Provider Registry
=================

Registry pattern for LLM providers.
"""

from __future__ import annotations

from app.llm.providers.base import BaseLLMProvider


class ProviderRegistry:
    """Registry of available LLM providers."""

    def __init__(self) -> None:
        """Initialize registry."""

        self._providers: dict[str, type[BaseLLMProvider]] = {}

    def register(
        self,
        name: str,
        provider_class: type[BaseLLMProvider],
    ) -> None:
        """Register provider class."""

        clean_name = self._normalize_name(name)
        self._providers[clean_name] = provider_class

    def create(
        self,
        name: str,
        *,
        timeout_seconds: float,
    ) -> BaseLLMProvider:
        """Create provider instance from environment variables."""

        clean_name = self._normalize_name(name)
        provider_class = self._providers.get(clean_name)

        if provider_class is None:
            raise ValueError(f"LLM provider is not registered: {clean_name}.")

        return provider_class.from_env(timeout_seconds=timeout_seconds)

    def names(self) -> tuple[str, ...]:
        """Return registered provider names."""

        return tuple(self._providers.keys())

    def _normalize_name(self, name: str) -> str:
        """Normalize provider name."""

        if not isinstance(name, str) or not name.strip():
            raise ValueError("provider name is required.")

        return name.strip().lower()
