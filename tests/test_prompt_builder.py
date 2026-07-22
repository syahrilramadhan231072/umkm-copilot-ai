"""
Prompt Builder Tests
====================

Pytest test suite for PromptBuilder.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

import pytest

from app.llm.prompt_builder import PromptBuilder


def test_prompt_builder_builds_prompt() -> None:
    """Assert PromptBuilder renders prompt variables."""

    builder = PromptBuilder()
    prompt = builder.build_prompt(
        "Halo {business_name}, revenue: {revenue}",
        {
            "business_name": "Demo UMKM",
            "revenue": 100000,
        },
    )

    assert prompt == "Halo Demo UMKM, revenue: 100000"


def test_prompt_builder_detects_required_variables() -> None:
    """Assert PromptBuilder detects required variables."""

    builder = PromptBuilder()
    variables = builder.get_required_variables("Halo {business_name}, context: {business_context}")

    assert variables == ["business_context", "business_name"]


def test_prompt_builder_rejects_missing_variables() -> None:
    """Assert PromptBuilder rejects missing variables."""

    builder = PromptBuilder()

    with pytest.raises(ValueError):
        builder.build_prompt(
            "Halo {business_name}, {missing}",
            {"business_name": "Demo"},
        )


def test_prompt_builder_builds_chat_prompt() -> None:
    """Assert PromptBuilder builds chat prompt."""

    builder = PromptBuilder()
    prompt = builder.build_chat_prompt(
        system_instruction="Anda adalah UMKM Copilot.",
        business_context={"business_name": "Demo UMKM"},
        conversation_history=[
            {
                "role": "user",
                "message": "Halo",
            }
        ],
        user_input="Bantu analisis penjualan.",
    )

    assert "# System Instruction" in prompt
    assert "# Business Context" in prompt
    assert "# Conversation History" in prompt
    assert "user: Halo" in prompt
    assert "# User Input" in prompt


def test_prompt_builder_builds_prompt_payload() -> None:
    """Assert PromptBuilder builds prompt payload."""

    builder = PromptBuilder()
    payload = builder.build_prompt_payload(
        "Prompt final",
        metadata={"intent": "insight"},
    )

    assert payload["prompt"] == "Prompt final"
    assert payload["metadata"]["intent"] == "insight"


def test_prompt_builder_rejects_empty_template() -> None:
    """Assert PromptBuilder rejects empty template."""

    builder = PromptBuilder()

    with pytest.raises(ValueError):
        builder.build_prompt("", {})
