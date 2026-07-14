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
from typing import Any, List
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
    ) -> dict[str, Any]:
        """
        Create a transaction record.

        Args:
            data: Transaction table values.

        Returns:
            Created transaction record.

        Raises:
            ValueError: If the transaction is not created.
        """

        try:

            result = self.table.insert(data).execute()

            if not result.data:
                raise ValueError("Transaction was not created.")

            logger.success("Transaction created.")

            return result.data[0]

        except Exception as exc:

            logger.exception(exc)

            raise

    def get(
        self,
        transaction_id: UUID | str,
    ) -> dict[str, Any] | None:
        """
        Get a transaction by transaction ID.

        Args:
            transaction_id: Transaction ID.

        Returns:
            Transaction record if found, otherwise None.
        """

        try:

            result = (
                self.table.select("*").eq("id", str(transaction_id)).limit(1).execute()
            )

            if result.data:
                return result.data[0]

            return None

        except Exception as exc:

            logger.exception(exc)

            raise

    def list(
        self,
        business_id: UUID | str | None = None,
        limit: int = 100,
    ) -> List[dict[str, Any]]:
        """
        List transactions.

        Args:
            business_id: Optional business ID filter.
            limit: Maximum number of records returned.

        Returns:
            List of transaction records.
        """

        try:

            query = (
                self.table.select("*")
                .order(
                    "transaction_date",
                    desc=True,
                )
                .limit(limit)
            )

            if business_id is not None:
                query = query.eq("business_id", str(business_id))

            result = query.execute()

            return result.data

        except Exception as exc:

            logger.exception(exc)

            raise

    def update(
        self,
        transaction_id: UUID | str,
        values: dict[str, Any],
    ) -> dict[str, Any]:
        """
        Update a transaction record.

        Args:
            transaction_id: Transaction ID.
            values: Transaction table values to update.

        Returns:
            Updated transaction record.

        Raises:
            ValueError: If the transaction is not updated.
        """

        try:

            result = self.table.update(values).eq("id", str(transaction_id)).execute()

            if not result.data:
                raise ValueError("Transaction was not updated.")

            logger.success("Transaction updated.")

            return result.data[0]

        except Exception as exc:

            logger.exception(exc)

            raise

    def delete(
        self,
        transaction_id: UUID | str,
    ) -> None:
        """
        Delete a transaction record.

        Args:
            transaction_id: Transaction ID.
        """

        try:

            (self.table.delete().eq("id", str(transaction_id)).execute())

            logger.success("Transaction deleted.")

        except Exception as exc:

            logger.exception(exc)

            raise

    def count(
        self,
        business_id: UUID | str | None = None,
    ) -> int:
        """
        Count transactions.

        Args:
            business_id: Optional business ID filter.

        Returns:
            Total number of transaction records.
        """

        try:

            query = self.table.select("id", count="exact").limit(1)

            if business_id is not None:
                query = query.eq("business_id", str(business_id))

            result = query.execute()

            return int(result.count or 0)

        except Exception as exc:

            logger.exception(exc)

            raise

    def exists(
        self,
        transaction_id: UUID | str,
    ) -> bool:
        """
        Check whether a transaction exists by transaction ID.

        Args:
            transaction_id: Transaction ID.

        Returns:
            True if transaction exists, otherwise False.
        """

        try:

            result = (
                self.table.select("id").eq("id", str(transaction_id)).limit(1).execute()
            )

            return bool(result.data)

        except Exception as exc:

            logger.exception(exc)

            raise

    def get_today(
        self,
        business_id: UUID | str | None = None,
    ) -> List[dict[str, Any]]:
        """
        List transactions from today.

        Args:
            business_id: Optional business ID filter.

        Returns:
            List of today's transaction records.
        """

        try:

            today = date.today().isoformat()

            query = (
                self.table.select("*")
                .gte(
                    "transaction_date",
                    today,
                )
                .order(
                    "transaction_date",
                    desc=True,
                )
            )

            if business_id is not None:
                query = query.eq("business_id", str(business_id))

            result = query.execute()

            return result.data

        except Exception as exc:

            logger.exception(exc)

            raise
