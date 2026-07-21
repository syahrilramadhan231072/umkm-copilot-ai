"""
Default Provider Registry
=========================

Register built-in providers in one place.

Adding a future provider should only require:
1. Creating the provider class
2. Registering it in this file
"""

from __future__ import annotations

from app.llm.providers.gemini_provider import GeminiProvider
from app.llm.providers.huggingface_provider import HuggingFaceProvider
from app.llm.providers.ollama_provider import OllamaProvider
from app.llm.providers.openrouter_provider import OpenRouterProvider
from app.llm.providers.registry import ProviderRegistry


def build_default_provider_registry() -> ProviderRegistry:
    """Build registry with built-in providers."""

    registry = ProviderRegistry()
    registry.register(GeminiProvider.provider_name, GeminiProvider)
    registry.register(OpenRouterProvider.provider_name, OpenRouterProvider)
    registry.register(HuggingFaceProvider.provider_name, HuggingFaceProvider)
    registry.register(OllamaProvider.provider_name, OllamaProvider)

    return registry
