"""
Base Repository
===============

Base class for all repositories.

Responsibilities
----------------
- Provide shared Supabase client
- Shared helper methods
- Common logging

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from supabase import Client

from app.database.connection import get_supabase
from app.utils.logger import logger


class BaseRepository:
    """
    Base repository.

    Every repository inherits this class.
    """

    TABLE_NAME: str = ""

    def __init__(self) -> None:
        self.client: Client = get_supabase()

    @property
    def table(self):
        """
        Return Supabase table object.
        """

        if not self.TABLE_NAME:
            raise ValueError(
                "TABLE_NAME is not defined."
            )

        return self.client.table(self.TABLE_NAME)

    def ping(self) -> bool:
        """
        Test repository accessibility.
        """

        try:

            self.table.select("*").limit(1).execute()

            logger.success(
                f"{self.TABLE_NAME} repository OK."
            )

            return True

        except Exception as exc:

            logger.exception(exc)

            return False
