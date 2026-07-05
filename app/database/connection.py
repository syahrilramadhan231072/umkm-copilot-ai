"""
Supabase Connection

Provides a singleton Supabase client for the application.
"""

from functools import lru_cache

from supabase import Client, create_client

from app.config.settings import get_settings
from app.utils.logger import logger

settings = get_settings()


@lru_cache(maxsize=1)
def get_supabase() -> Client:
    """
    Return singleton Supabase client.
    """

    if not settings.SUPABASE_URL:
        raise ValueError("SUPABASE_URL is missing.")

    if not settings.SUPABASE_KEY:
        raise ValueError("SUPABASE_KEY is missing.")

    client = create_client(
        settings.SUPABASE_URL,
        settings.SUPABASE_KEY,
    )

    logger.success("Supabase client initialized.")

    return client


def check_connection() -> bool:
    """
    Simple health check.

    Executes a lightweight query against the database.

    Returns
    -------
    bool
        True if connection works.
    """

    try:

        client = get_supabase()

        # replace with your first table
        client.table("businesses").select("*").limit(1).execute()

        logger.success("Supabase connection OK.")

        return True

    except Exception as e:

        logger.exception(e)

        return False