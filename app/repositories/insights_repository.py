"""
Insights Repository
===================

Repository for insights table.

Responsibilities
----------------
- CRUD operations
- Insight queries
- Database abstraction

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any
from uuid import UUID

from app.repositories.base_repository import BaseRepository
from app.utils.logger import logger


class InsightsRepository(BaseRepository):
    """
    Repository for insights.
    """

    TABLE_NAME = "insights"

    def create(
        self,
        data: dict[str, Any],
    ) -> dict[str, Any]:
        """
        Create an insight record.

        Args:
            data: Insight table values.

        Returns:
            Created insight record.

        Raises:
            ValueError: If the insight is not created.
        """

        try:

            result = self.table.insert(data).execute()

            if not result.data:
                raise ValueError("Insight was not created.")

            logger.success("Insight created.")

            return result.data[0]

        except Exception as exc:

            logger.exception(exc)

            raise

    def get(
        self,
        insight_id: UUID | str,
    ) -> dict[str, Any] | None:
        """
        Get an insight record by ID.

        Args:
            insight_id: Insight ID.

        Returns:
            Insight record if found, otherwise None.
        """

        try:

            result = self.table.select("*").eq("id", str(insight_id)).limit(1).execute()

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
    ) -> list[dict[str, Any]]:
        """
        List insight records.

        Args:
            business_id: Optional business ID filter.
            limit: Maximum number of records returned.

        Returns:
            List of insight records.
        """

        try:

            query = (
                self.table.select("*")
                .order(
                    "created_at",
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
        insight_id: UUID | str,
        values: dict[str, Any],
    ) -> dict[str, Any]:
        """
        Update an insight record.

        Args:
            insight_id: Insight ID.
            values: Insight table values to update.

        Returns:
            Updated insight record.

        Raises:
            ValueError: If the insight is not updated.
        """

        try:

            result = self.table.update(values).eq("id", str(insight_id)).execute()

            if not result.data:
                raise ValueError("Insight was not updated.")

            logger.success("Insight updated.")

            return result.data[0]

        except Exception as exc:

            logger.exception(exc)

            raise

    def delete(
        self,
        insight_id: UUID | str,
    ) -> None:
        """
        Delete an insight record.

        Args:
            insight_id: Insight ID.
        """

        try:

            (self.table.delete().eq("id", str(insight_id)).execute())

            logger.success("Insight deleted.")

        except Exception as exc:

            logger.exception(exc)

            raise

    def count(
        self,
        business_id: UUID | str | None = None,
    ) -> int:
        """
        Count insight records.

        Args:
            business_id: Optional business ID filter.

        Returns:
            Total number of insight records.
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
        insight_id: UUID | str,
    ) -> bool:
        """
        Check whether an insight record exists by ID.

        Args:
            insight_id: Insight ID.

        Returns:
            True if insight record exists, otherwise False.
        """

        try:

            result = (
                self.table.select("id").eq("id", str(insight_id)).limit(1).execute()
            )

            return bool(result.data)

        except Exception as exc:

            logger.exception(exc)

            raise

    def list_by_category(
        self,
        business_id: UUID | str,
        insight_category: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        List insight records by category.

        Args:
            business_id: Business ID.
            insight_category: Insight category.
            limit: Maximum number of records returned.

        Returns:
            List of insight records for the category.
        """

        try:

            result = (
                self.table.select("*")
                .eq("business_id", str(business_id))
                .eq("insight_category", insight_category)
                .order(
                    "created_at",
                    desc=True,
                )
                .limit(limit)
                .execute()
            )

            return result.data

        except Exception as exc:

            logger.exception(exc)

            raise

    def list_recent(
        self,
        business_id: UUID | str,
        limit: int = 20,
    ) -> list[dict[str, Any]]:
        """
        List recent insight records for a business.

        Args:
            business_id: Business ID.
            limit: Maximum number of records returned.

        Returns:
            List of recent insight records.
        """

        try:

            result = (
                self.table.select("*")
                .eq("business_id", str(business_id))
                .order(
                    "created_at",
                    desc=True,
                )
                .limit(limit)
                .execute()
            )

            return result.data

        except Exception as exc:

            logger.exception(exc)

            raise

    def search_title(
        self,
        business_id: UUID | str,
        keyword: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        Search insight records by title keyword.

        Args:
            business_id: Business ID.
            keyword: Title search keyword.
            limit: Maximum number of records returned.

        Returns:
            List of matching insight records.
        """

        try:

            keyword = keyword.strip()

            if not keyword:
                return []

            result = (
                self.table.select("*")
                .eq("business_id", str(business_id))
                .ilike("title", f"%{keyword}%")
                .order(
                    "created_at",
                    desc=True,
                )
                .limit(limit)
                .execute()
            )

            return result.data

        except Exception as exc:

            logger.exception(exc)

            raise
