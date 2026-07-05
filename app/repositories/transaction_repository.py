"""
Transaction Repository
======================

Repository for transactions table.

Responsibilities
----------------
- CRUD operations
- Sales queries
- Database abstraction

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from datetime import date
from typing import Any
from uuid import UUID

from app.repositories.base_repository import BaseRepository
from app.utils.logger import logger


class TransactionRepository(BaseRepository):
    """
    Repository for transactions.
    """

    TABLE_NAME = "transactions"

    def create(
        self,
        data: dict[str, Any],
    ) -> dict:

        result = (
            self.table
            .insert(data)
            .execute()
        )

        logger.success("Transaction created.")

        return result.data[0]

    def get(
        self,
        transaction_id: UUID | str,
    ) -> dict | None:

        result = (
            self.table
            .select("*")
            .eq("id", str(transaction_id))
            .limit(1)
            .execute()
        )

        if result.data:
            return result.data[0]

        return None

    def list(
        self,
        limit: int = 100,
    ) -> list[dict]:

        result = (
            self.table
            .select("*")
            .order(
                "transaction_date",
                desc=True,
            )
            .limit(limit)
            .execute()
        )

        return result.data

    def update(
        self,
        transaction_id: UUID | str,
        values: dict[str, Any],
    ) -> dict:

        result = (
            self.table
            .update(values)
            .eq("id", str(transaction_id))
            .execute()
        )

        logger.success("Transaction updated.")

        return result.data[0]

    def delete(
        self,
        transaction_id: UUID | str,
    ) -> None:

        (
            self.table
            .delete()
            .eq("id", str(transaction_id))
            .execute()
        )

        logger.success("Transaction deleted.")

    def get_today(self) -> list[dict]:

        today = date.today().isoformat()

        result = (
            self.table
            .select("*")
            .gte(
                "transaction_date",
                today,
            )
            .execute()
        )

        return result.data
