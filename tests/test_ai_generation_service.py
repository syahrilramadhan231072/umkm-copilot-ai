"""Tests for AIGenerationService."""

from __future__ import annotations

from typing import Any

from app.llm.prompt_builder import PromptBuilder
from app.llm.response_formatter import ResponseFormatter
from app.services.ai_generation_service import AIGenerationService


class FakeGeminiClient:
    """Fake Gemini client."""

    def __init__(self) -> None:
        self.prompt = ""

    def generate_text(
        self,
        prompt: str,
        *,
        temperature: float | None = None,
        max_output_tokens: int | None = None,
    ) -> dict[str, Any]:
        self.prompt = prompt
        return {
            "success": True,
            "provider": "gemini",
            "model": "fake",
            "text": "LLM answer",
            "raw": {},
            "error": None,
        }


def test_ai_generation_service_generates_answer() -> None:
    service = AIGenerationService(
        gemini_client=FakeGeminiClient(),  # type: ignore[arg-type]
        prompt_builder=PromptBuilder(),
        response_formatter=ResponseFormatter(),
    )

    response = service.generate_conversation_response(user_input="Apa itu BEP?")

    assert response["success"] is True
    assert response["data"]["answer"] == "LLM answer"
    assert response["data"]["provider"] == "gemini"
