"""
Database Connection
===================

Centralized Supabase connection.
"""

from __future__ import annotations

from functools import lru_cache

from supabase import Client, create_client

from app.config.settings import get_settings
from app.utils.logger import logger

settings = get_settings()


@lru_cache(maxsize=1)
def get_supabase() -> Client:
    """
    Return singleton Supabase client.

    Repositories are responsible for database table access.
    """

    settings.validate_supabase()

    logger.info("Connecting to Supabase.")
    logger.info("SUPABASE_URL configured: {}", bool(settings.SUPABASE_URL.strip()))
    logger.info("SUPABASE_KEY configured: {}", settings.supabase_key_is_configured)

    client = create_client(
        supabase_url=settings.SUPABASE_URL,
        supabase_key=settings.supabase_key(),
    )

    logger.success("Supabase connection established.")

    return client


def health_check() -> bool:
    """Verify that the Supabase client can be initialized."""

    try:
        get_supabase()
        logger.success("Supabase health check passed.")
        return True
    except Exception as exc:
        logger.exception(exc)
        return False


__all__ = [
    "get_supabase",
    "health_check",
]
