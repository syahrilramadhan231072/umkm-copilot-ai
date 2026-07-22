"""
API Response Helpers
====================

HTTP response helpers for UMKM Copilot AI API Layer.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from fastapi.responses import JSONResponse

from app.utils.logger import logger


def build_api_response(response: Mapping[str, Any]) -> dict[str, Any] | JSONResponse:
    """
    Convert agent or workflow response into HTTP response.

    Args:
        response: Agent or workflow response.

    Returns:
        Plain dictionary for success or JSONResponse with status 400 for failure.
    """

    if not isinstance(response, Mapping):
        return JSONResponse(
            status_code=500,
            content={
                "success": False,
                "data": {},
                "error": {
                    "type": "RuntimeError",
                    "message": "API dependency returned invalid response.",
                },
            },
        )

    if response.get("success") is True:
        return dict(response)

    return JSONResponse(
        status_code=400,
        content=dict(response),
    )


def build_exception_response(error: Exception) -> JSONResponse:
    """
    Build HTTP 500 response from unexpected exception.

    Args:
        error: Unexpected exception.

    Returns:
        JSONResponse with status 500.
    """

    logger.exception("Unexpected API error.")

    return JSONResponse(
        status_code=500,
        content={
            "success": False,
            "data": {},
            "error": {
                "type": error.__class__.__name__,
                "message": str(error),
            },
        },
    )
