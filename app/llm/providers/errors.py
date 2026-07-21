"""
LLM Provider Errors
===================

Error utilities shared by all LLM providers.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Any


FRIENDLY_AI_UNAVAILABLE_MESSAGE = (
    "The AI service is temporarily unavailable. Please try again shortly."
)

RETRYABLE_STATUS_CODES = {429, 500, 502, 503}

RETRYABLE_MESSAGE_MARKERS = (
    "429",
    "quota exceeded",
    "rate limit",
    "resourceexhausted",
    "resource exhausted",
    "timeout",
    "timed out",
    "connection reset",
    "connection aborted",
    "temporarily unavailable",
    "temporary network",
    "server error",
    "bad gateway",
    "service unavailable",
    "internal error",
)

NON_RETRYABLE_STATUS_CODES = {400, 401, 403}


@dataclass
class LLMProviderError(Exception):
    """Provider error with retry metadata."""

    provider: str
    message: str
    retryable: bool
    status_code: int | None = None
    error_type: str = "LLMProviderError"
    raw: Any | None = None

    def __str__(self) -> str:
        """Return error message."""

        return self.message


def is_retryable_failure(
    *,
    message: str,
    status_code: int | None = None,
) -> bool:
    """Return whether a provider failure is retryable."""

    if status_code in NON_RETRYABLE_STATUS_CODES:
        return False

    if status_code in RETRYABLE_STATUS_CODES:
        return True

    lowered = str(message).lower()
    return any(marker in lowered for marker in RETRYABLE_MESSAGE_MARKERS)


def provider_error_from_exception(
    *,
    provider: str,
    error: Exception,
    status_code: int | None = None,
    error_type: str | None = None,
    raw: Any | None = None,
) -> LLMProviderError:
    """Create LLMProviderError from an exception."""

    message = str(error)
    resolved_type = error_type or error.__class__.__name__
    retryable = is_retryable_failure(message=message, status_code=status_code)

    return LLMProviderError(
        provider=provider,
        message=message,
        retryable=retryable,
        status_code=status_code,
        error_type=resolved_type,
        raw=raw,
    )
