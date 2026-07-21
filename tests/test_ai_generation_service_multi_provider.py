from __future__ import annotations

from app.llm.prompt_builder import PromptBuilder
from app.llm.response_formatter import ResponseFormatter
from app.services.ai_generation_service import AIGenerationService


class FakeProviderManager:
    def generate_text(self, prompt: str, **kwargs):
        return {
            "success": True,
            "provider": "fake",
            "model": "fake-model",
            "text": "Ini jawaban dari provider cadangan.",
            "raw": {},
            "error": None,
        }

    def health_snapshot(self):
        return []


def test_ai_generation_service_uses_provider_manager_without_changing_interface() -> None:
    service = AIGenerationService(
        prompt_builder=PromptBuilder(),
        response_formatter=ResponseFormatter(),
        provider_manager=FakeProviderManager(),
    )

    response = service.generate_conversation_response(
        user_input="Apa itu break even point?",
        business_context={},
        conversation_history=[],
    )

    assert response["success"] is True
    assert response["data"]["provider"] == "fake"
    assert response["data"]["answer"] == "Ini jawaban dari provider cadangan."


def test_ai_generation_service_generate_text_compatibility() -> None:
    service = AIGenerationService(
        prompt_builder=PromptBuilder(),
        response_formatter=ResponseFormatter(),
        provider_manager=FakeProviderManager(),
    )

    response = service.generate_text("hello")

    assert response["success"] is True
    assert response["provider"] == "fake"
