"""
Health Router
=============

Health and readiness endpoints for the API.
"""

from __future__ import annotations

from typing import Any

from fastapi import APIRouter

from app.config.settings import get_settings

router = APIRouter(tags=["health"])


@router.get("/health")
def health_check() -> dict[str, Any]:
    """Return lightweight liveness status."""

    settings = get_settings()

    return {
        "success": True,
        "service": "go-umkm-ai-api",
        "status": "healthy",
        "environment": settings.APP_ENV,
        "version": settings.APP_VERSION,
        "error": None,
    }


@router.get("/ready")
def readiness_check() -> dict[str, Any]:
    """
    Return readiness status based on required production configuration.

    The check is intentionally lightweight and validates configuration presence
    without querying database tables.
    """

    settings = get_settings()
    missing: list[str] = []

    if not settings.SUPABASE_URL.strip():
        missing.append("SUPABASE_URL")

    if not settings.supabase_key_is_configured:
        missing.append("SUPABASE_KEY")

    return {
        "success": not missing,
        "service": "go-umkm-ai-api",
        "status": "ready" if not missing else "not_ready",
        "missing": missing,
        "error": None if not missing else {"message": "Missing required settings."},
    }
