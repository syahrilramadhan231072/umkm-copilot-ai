"""
Gemini Client Tests
===================

Pytest test suite for GeminiClient.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from app.llm.gemini_client import GeminiClient


class FakeGeminiResponse:
    """Fake Gemini response object."""

    def __init__(self, text: str) -> None:
        """Initialize fake response."""

        self.text = text


class FakeGeminiModel:
    """Fake Gemini model for tests."""

    def __init__(self, *, fail: bool = False) -> None:
        """Initialize fake model."""

        self.fail = fail
        self.received_prompt: str | list[Any] | None = None
        self.received_kwargs: dict[str, Any] = {}

    def generate_content(
        self,
        contents: str | list[Any],
        **kwargs: Any,
    ) -> FakeGeminiResponse:
        """Generate fake content."""

        if self.fail:
            raise RuntimeError("Generation failed.")

        self.received_prompt = contents
        self.received_kwargs = kwargs

        return FakeGeminiResponse("Generated response")


def test_gemini_client_generates_text_with_fake_model() -> None:
    """Assert GeminiClient generates text using fake model."""

    fake_model = FakeGeminiModel()
    client = GeminiClient(model=fake_model, model_name="fake-gemini")

    response = client.generate_text(
        "Hello",
        temperature=0.2,
        max_output_tokens=128,
    )

    assert response["success"] is True
    assert response["provider"] == "gemini"
    assert response["model"] == "fake-gemini"
    assert response["text"] == "Generated response"
    assert fake_model.received_prompt == "Hello"
    assert fake_model.received_kwargs["generation_config"]["temperature"] == 0.2
    assert fake_model.received_kwargs["generation_config"]["max_output_tokens"] == 128


def test_gemini_client_returns_error_response_on_generation_failure() -> None:
    """Assert GeminiClient returns structured error response."""

    client = GeminiClient(
        model=FakeGeminiModel(fail=True),
        model_name="fake-gemini",
    )

    response = client.generate_text("Hello")

    assert response["success"] is False
    assert response["provider"] == "gemini"
    assert response["text"] == ""
    assert response["error"]["type"] == "RuntimeError"


def test_gemini_client_rejects_empty_prompt() -> None:
    """Assert GeminiClient rejects empty prompt through error response."""

    client = GeminiClient(model=FakeGeminiModel(), model_name="fake-gemini")

    response = client.generate_text("")

    assert response["success"] is False
    assert response["error"]["type"] == "ValueError"


def test_gemini_client_accepts_dict_response_text() -> None:
    """Assert GeminiClient extracts text from dict response."""

    class DictModel:
        """Fake model returning dictionary response."""

        def generate_content(self, contents: str | list[Any], **kwargs: Any) -> Any:
            """Return dictionary response."""

            return {"text": "Dictionary response", "api_key": "hidden"}

    client = GeminiClient(model=DictModel(), model_name="fake-gemini")
    response = client.generate("Hello")

    assert response["success"] is True
    assert response["text"] == "Dictionary response"
    assert "api_key" not in response["raw"]
