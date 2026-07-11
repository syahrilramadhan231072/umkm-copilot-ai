"""
Response Formatter Tests
========================

Pytest test suite for ResponseFormatter.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

import pytest

from app.llm.response_formatter import ResponseFormatter


def test_response_formatter_cleans_text() -> None:
    """Assert ResponseFormatter cleans excessive blank lines."""

    formatter = ResponseFormatter()
    cleaned = formatter.clean_text("  Halo\n\n\nDunia  ")

    assert cleaned == "Halo\n\nDunia"


def test_response_formatter_formats_text_response() -> None:
    """Assert ResponseFormatter formats successful LLM text response."""

    formatter = ResponseFormatter()
    response = formatter.format_text_response(
        {
            "success": True,
            "provider": "gemini",
            "model": "fake",
            "text": "  Output text  ",
            "raw": {},
            "error": None,
        }
    )

    assert response["success"] is True
    assert response["data"]["text"] == "Output text"
    assert response["data"]["provider"] == "gemini"


def test_response_formatter_formats_error_response() -> None:
    """Assert ResponseFormatter formats failed LLM response."""

    formatter = ResponseFormatter()
    response = formatter.format_text_response(
        {
            "success": False,
            "provider": "gemini",
            "model": "fake",
            "text": "",
            "raw": None,
            "error": {
                "type": "RuntimeError",
                "message": "Failed.",
            },
        }
    )

    assert response["success"] is False
    assert response["error"]["type"] == "RuntimeError"


def test_response_formatter_extracts_plain_json_object() -> None:
    """Assert ResponseFormatter extracts plain JSON object."""

    formatter = ResponseFormatter()
    parsed = formatter.extract_json('{"title": "Insight", "score": 10}')

    assert parsed == {"title": "Insight", "score": 10}


def test_response_formatter_extracts_fenced_json() -> None:
    """Assert ResponseFormatter extracts fenced JSON."""

    formatter = ResponseFormatter()
    parsed = formatter.extract_json("""
        Berikut hasilnya:
        ```json
        {"caption": "Promo hari ini"}
        ```
        """)

    assert parsed == {"caption": "Promo hari ini"}


def test_response_formatter_extracts_json_array() -> None:
    """Assert ResponseFormatter extracts JSON array."""

    formatter = ResponseFormatter()
    parsed = formatter.extract_json('Output: [{"name": "Coffee"}] selesai.')

    assert parsed == [{"name": "Coffee"}]


def test_response_formatter_rejects_invalid_json() -> None:
    """Assert ResponseFormatter rejects text without JSON."""

    formatter = ResponseFormatter()

    with pytest.raises(ValueError):
        formatter.extract_json("Tidak ada JSON di sini.")


def test_response_formatter_formats_json_response() -> None:
    """Assert ResponseFormatter formats LLM JSON response."""

    formatter = ResponseFormatter()
    response = formatter.format_json_response(
        {
            "success": True,
            "provider": "gemini",
            "model": "fake",
            "text": '{"answer": "ok"}',
            "raw": {},
            "error": None,
        }
    )

    assert response["success"] is True
    assert response["data"]["json"] == {"answer": "ok"}


def test_response_formatter_builds_markdown() -> None:
    """Assert ResponseFormatter builds markdown text."""

    formatter = ResponseFormatter()
    markdown = formatter.to_markdown("Judul", "Isi")

    assert markdown == "## Judul\n\nIsi"
