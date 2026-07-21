"""
Provider HTTP Utilities
=======================

Small standard-library HTTP helper for providers that call REST APIs.
"""

from __future__ import annotations

import json
from typing import Any, Mapping
from urllib.error import HTTPError, URLError
from urllib.request import Request, urlopen

from app.llm.providers.errors import LLMProviderError, is_retryable_failure


def post_json(
    *,
    provider: str,
    url: str,
    headers: Mapping[str, str],
    payload: Mapping[str, Any],
    timeout_seconds: float,
) -> tuple[int, dict[str, Any]]:
    """POST JSON and return parsed JSON response."""

    body = json.dumps(payload, ensure_ascii=False).encode("utf-8")
    request = Request(
        url=url,
        data=body,
        headers={**dict(headers), "Content-Type": "application/json"},
        method="POST",
    )

    try:
        with urlopen(request, timeout=timeout_seconds) as response:
            status_code = int(response.status)
            text = response.read().decode("utf-8")
            return status_code, _parse_json(text)
    except HTTPError as exc:
        response_text = exc.read().decode("utf-8")
        parsed = _parse_json(response_text)
        message = _extract_error_message(parsed) or f"HTTP {exc.code}"
        raise LLMProviderError(
            provider=provider,
            message=message,
            retryable=is_retryable_failure(
                message=message,
                status_code=int(exc.code),
            ),
            status_code=int(exc.code),
            error_type="HTTPError",
            raw=parsed,
        ) from exc
    except URLError as exc:
        message = str(getattr(exc, "reason", exc))
        raise LLMProviderError(
            provider=provider,
            message=message,
            retryable=is_retryable_failure(message=message),
            error_type="NetworkError",
        ) from exc
    except TimeoutError as exc:
        raise LLMProviderError(
            provider=provider,
            message="Request timed out.",
            retryable=True,
            error_type="TimeoutError",
        ) from exc


def _parse_json(text: str) -> dict[str, Any]:
    """Parse JSON object safely."""

    if not text.strip():
        return {}

    parsed = json.loads(text)
    if isinstance(parsed, dict):
        return parsed

    return {"data": parsed}


def _extract_error_message(data: Mapping[str, Any]) -> str:
    """Extract provider error message."""

    error = data.get("error")
    if isinstance(error, Mapping):
        message = error.get("message") or error.get("error")
        if isinstance(message, str):
            return message

    message = data.get("message") or data.get("detail")
    if isinstance(message, str):
        return message

    return ""
