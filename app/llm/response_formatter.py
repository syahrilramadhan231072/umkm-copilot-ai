"""
Response Formatter
==================

LLM response formatter for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

import json
import re
from typing import Any, Mapping

from app.utils.logger import logger


class ResponseFormatter:
    """
    Formatter for LLM responses.

    ResponseFormatter normalizes model outputs, extracts JSON, and builds
    structured responses. It never calls LLM providers, accesses databases,
    calls repositories, or renders UI components.
    """

    def __init__(self) -> None:
        """Initialize response formatter."""

        self._logger = logger

    def clean_text(self, text: str) -> str:
        """
        Clean text output.

        Args:
            text: Raw text.

        Returns:
            Cleaned text.
        """

        if not isinstance(text, str):
            raise ValueError("text must be a string.")

        cleaned = text.strip()
        cleaned = re.sub(r"\n{3,}", "\n\n", cleaned)

        return cleaned

    def format_text_response(
        self,
        llm_response: Mapping[str, Any],
        *,
        fallback_text: str = "",
    ) -> dict[str, Any]:
        """
        Format GeminiClient text response.

        Args:
            llm_response: GeminiClient response.
            fallback_text: Text used when response text is empty.

        Returns:
            Formatted response.
        """

        if not isinstance(llm_response, Mapping):
            raise ValueError("llm_response must be a mapping.")

        if not llm_response.get("success"):
            return self.error_response(
                error_type=str(
                    llm_response.get("error", {}).get("type", "LLMError")
                    if isinstance(llm_response.get("error"), Mapping)
                    else "LLMError"
                ),
                message=str(
                    llm_response.get("error", {}).get("message", "LLM call failed.")
                    if isinstance(llm_response.get("error"), Mapping)
                    else "LLM call failed."
                ),
            )

        text = self.clean_text(str(llm_response.get("text", "")))

        if not text:
            text = fallback_text

        return self.success_response(
            data={
                "text": text,
                "provider": llm_response.get("provider"),
                "model": llm_response.get("model"),
            }
        )

    def extract_json(self, text: str) -> dict[str, Any] | list[Any]:
        """
        Extract JSON object or array from text.

        Args:
            text: Text containing JSON.

        Returns:
            Parsed JSON object or array.

        Raises:
            ValueError: If JSON cannot be found or parsed.
        """

        cleaned = self.clean_text(text)

        try:
            parsed = json.loads(cleaned)
            if isinstance(parsed, (dict, list)):
                return parsed
        except json.JSONDecodeError:
            pass

        fenced_match = re.search(
            r"```(?:json)?\s*(.*?)\s*```",
            cleaned,
            flags=re.DOTALL | re.IGNORECASE,
        )

        if fenced_match:
            return self._parse_json_text(fenced_match.group(1))

        array_candidate = self._extract_balanced_json(cleaned, "[", "]")
        if array_candidate is not None:
            return self._parse_json_text(array_candidate)

        object_candidate = self._extract_balanced_json(cleaned, "{", "}")
        if object_candidate is not None:
            return self._parse_json_text(object_candidate)

        raise ValueError("No valid JSON object or array found in text.")

    def format_json_response(
        self,
        llm_response: Mapping[str, Any],
    ) -> dict[str, Any]:
        """
        Format GeminiClient response as parsed JSON.

        Args:
            llm_response: GeminiClient response.

        Returns:
            Structured response containing parsed JSON.
        """

        text_response = self.format_text_response(llm_response)

        if not text_response["success"]:
            return text_response

        try:
            parsed_json = self.extract_json(text_response["data"]["text"])
            return self.success_response(
                data={
                    "json": parsed_json,
                    "provider": text_response["data"].get("provider"),
                    "model": text_response["data"].get("model"),
                }
            )
        except Exception as exc:
            return self.error_response(
                error_type=exc.__class__.__name__,
                message=str(exc),
            )

    def success_response(self, data: Any) -> dict[str, Any]:
        """
        Build formatter success response.

        Args:
            data: Response data.

        Returns:
            Structured success response.
        """

        return {
            "success": True,
            "data": data,
            "error": None,
        }

    def error_response(self, error_type: str, message: str) -> dict[str, Any]:
        """
        Build formatter error response.

        Args:
            error_type: Error type.
            message: Error message.

        Returns:
            Structured error response.
        """

        return {
            "success": False,
            "data": None,
            "error": {
                "type": error_type,
                "message": message,
            },
        }

    def to_markdown(self, title: str, body: str) -> str:
        """
        Convert title and body to markdown text.

        Args:
            title: Markdown title.
            body: Markdown body.

        Returns:
            Markdown text.
        """

        if not isinstance(title, str) or not title.strip():
            raise ValueError("title is required.")

        if not isinstance(body, str) or not body.strip():
            raise ValueError("body is required.")

        return f"## {title.strip()}\n\n{self.clean_text(body)}"

    def _parse_json_text(self, json_text: str) -> dict[str, Any] | list[Any]:
        """
        Parse JSON text.

        Args:
            json_text: JSON text.

        Returns:
            Parsed JSON.
        """

        try:
            parsed = json.loads(json_text.strip())
        except json.JSONDecodeError as exc:
            raise ValueError(f"Invalid JSON: {exc.msg}.") from exc

        if not isinstance(parsed, (dict, list)):
            raise ValueError("Parsed JSON must be an object or array.")

        return parsed

    def _extract_balanced_json(
        self,
        text: str,
        opening: str,
        closing: str,
    ) -> str | None:
        """
        Extract first balanced JSON-like segment.

        Args:
            text: Source text.
            opening: Opening character.
            closing: Closing character.

        Returns:
            Extracted segment or None.
        """

        start = text.find(opening)

        if start == -1:
            return None

        depth = 0
        in_string = False
        escape = False

        for index in range(start, len(text)):
            char = text[index]

            if escape:
                escape = False
                continue

            if char == "\\":
                escape = True
                continue

            if char == '"':
                in_string = not in_string
                continue

            if in_string:
                continue

            if char == opening:
                depth += 1
            elif char == closing:
                depth -= 1

                if depth == 0:
                    return text[start : index + 1]

        return None
