"""
Database Connection
===================

Centralized Supabase connection.

Responsibilities
----------------
- Create Supabase client
- Validate configuration
- Singleton connection
- Health check

This module MUST NOT know anything about database tables.
Repositories are responsible for interacting with tables.

Author:
    UMKM Copilot AI
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

    Returns
    -------
    Client
        Configured Supabase client.

    Raises
    ------
    RuntimeError
        If Supabase configuration is invalid.
    """

    settings.validate_supabase()

    logger.info("Connecting to Supabase...")

    logger.info(f"SUPABASE_URL = {settings.SUPABASE_URL}")
    logger.info(f"SUPABASE_KEY prefix = {settings.supabase_key()[:20]}")

    client = create_client(
        supabase_url=settings.SUPABASE_URL,
        supabase_key=settings.supabase_key(),
    )

    logger.success("Supabase connection established.")

    return client


def health_check() -> bool:
    """
    Verify that the Supabase client can be initialized.

    This function intentionally does NOT query any tables.
    Repository classes are responsible for database operations.

    Returns
    -------
    bool
        True if the client is initialized successfully.
    """

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
