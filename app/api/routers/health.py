"""
Health Router
=============

Health check endpoint.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from fastapi import APIRouter

router = APIRouter(tags=["health"])


@router.get("/health")
def health_check() -> dict[str, Any]:
    """
    Return API health status.

    Returns:
        Health status response.
    """

    return {
        "success": True,
        "service": "umkm-copilot-ai-api",
        "status": "healthy",
        "error": None,
    }
