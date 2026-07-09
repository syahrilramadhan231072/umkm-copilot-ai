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
        """

        result = (
            self.table
            .insert(data)
            .execute()
        )

        logger.success("Insight created.")

        return result.data[0]

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

        result = (
            self.table
            .select("*")
            .eq("id", str(insight_id))
            .limit(1)
            .execute()
        )

        if result.data:
            return result.data[0]

        return None

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

        query = (
            self.table
            .select("*")
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
        """

        result = (
            self.table
            .update(values)
            .eq("id", str(insight_id))
            .execute()
        )

        logger.success("Insight updated.")

        return result.data[0]

    def delete(
        self,
        insight_id: UUID | str,
    ) -> None:
        """
        Delete an insight record.

        Args:
            insight_id: Insight ID.
        """

        (
            self.table
            .delete()
            .eq("id", str(insight_id))
            .execute()
        )

        logger.success("Insight deleted.")

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

        query = (
            self.table
            .select("id", count="exact")
            .limit(1)
        )

        if business_id is not None:
            query = query.eq("business_id", str(business_id))

        result = query.execute()

        return int(result.count or 0)

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

        result = (
            self.table
            .select("id")
            .eq("id", str(insight_id))
            .limit(1)
            .execute()
        )

        return bool(result.data)

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

        result = (
            self.table
            .select("*")
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

        result = (
            self.table
            .select("*")
            .eq("business_id", str(business_id))
            .order(
                "created_at",
                desc=True,
            )
            .limit(limit)
            .execute()
        )

        return result.data

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

        keyword = keyword.strip()

        if not keyword:
            return []

        result = (
            self.table
            .select("*")
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
