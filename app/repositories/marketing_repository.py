"""
Marketing Repository
====================

Repository for marketing_history table.

Responsibilities
----------------
- CRUD operations
- Marketing history queries
- Database abstraction

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any
from uuid import UUID

from app.repositories.base_repository import BaseRepository
from app.utils.logger import logger


class MarketingRepository(BaseRepository):
    """
    Repository for marketing history.
    """

    TABLE_NAME = "marketing_history"

    def create(
        self,
        data: dict[str, Any],
    ) -> dict[str, Any]:
        """
        Create a marketing history record.

        Args:
            data: Marketing history table values.

        Returns:
            Created marketing history record.
        """

        result = (
            self.table
            .insert(data)
            .execute()
        )

        logger.success("Marketing history created.")

        return result.data[0]

    def get(
        self,
        marketing_id: UUID | str,
    ) -> dict[str, Any] | None:
        """
        Get a marketing history record by ID.

        Args:
            marketing_id: Marketing history ID.

        Returns:
            Marketing history record if found, otherwise None.
        """

        result = (
            self.table
            .select("*")
            .eq("id", str(marketing_id))
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
        List marketing history records.

        Args:
            business_id: Optional business ID filter.
            limit: Maximum number of records returned.

        Returns:
            List of marketing history records.
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
        marketing_id: UUID | str,
        values: dict[str, Any],
    ) -> dict[str, Any]:
        """
        Update a marketing history record.

        Args:
            marketing_id: Marketing history ID.
            values: Marketing history table values to update.

        Returns:
            Updated marketing history record.
        """

        result = (
            self.table
            .update(values)
            .eq("id", str(marketing_id))
            .execute()
        )

        logger.success("Marketing history updated.")

        return result.data[0]

    def delete(
        self,
        marketing_id: UUID | str,
    ) -> None:
        """
        Delete a marketing history record.

        Args:
            marketing_id: Marketing history ID.
        """

        (
            self.table
            .delete()
            .eq("id", str(marketing_id))
            .execute()
        )

        logger.success("Marketing history deleted.")

    def count(
        self,
        business_id: UUID | str | None = None,
    ) -> int:
        """
        Count marketing history records.

        Args:
            business_id: Optional business ID filter.

        Returns:
            Total number of marketing history records.
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
        marketing_id: UUID | str,
    ) -> bool:
        """
        Check whether a marketing history record exists by ID.

        Args:
            marketing_id: Marketing history ID.

        Returns:
            True if marketing history record exists, otherwise False.
        """

        result = (
            self.table
            .select("id")
            .eq("id", str(marketing_id))
            .limit(1)
            .execute()
        )

        return bool(result.data)

    def list_by_platform(
        self,
        business_id: UUID | str,
        platform: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        List marketing history records by platform.

        Args:
            business_id: Business ID.
            platform: Marketing platform.
            limit: Maximum number of records returned.

        Returns:
            List of marketing history records for the platform.
        """

        result = (
            self.table
            .select("*")
            .eq("business_id", str(business_id))
            .eq("platform", platform)
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
        List recent marketing history records for a business.

        Args:
            business_id: Business ID.
            limit: Maximum number of records returned.

        Returns:
            List of recent marketing history records.
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

    def list_by_product(
        self,
        business_id: UUID | str,
        product_id: UUID | str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        List marketing history records by product.

        Args:
            business_id: Business ID.
            product_id: Product ID.
            limit: Maximum number of records returned.

        Returns:
            List of marketing history records for the product.
        """

        result = (
            self.table
            .select("*")
            .eq("business_id", str(business_id))
            .eq("product_id", str(product_id))
            .order(
                "created_at",
                desc=True,
            )
            .limit(limit)
            .execute()
        )

        return result.data

    def search_caption(
        self,
        business_id: UUID | str,
        keyword: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        Search marketing history records by caption keyword.

        Args:
            business_id: Business ID.
            keyword: Caption search keyword.
            limit: Maximum number of records returned.

        Returns:
            List of matching marketing history records.
        """

        keyword = keyword.strip()

        if not keyword:
            return []

        result = (
            self.table
            .select("*")
            .eq("business_id", str(business_id))
            .ilike("caption", f"%{keyword}%")
            .order(
                "created_at",
                desc=True,
            )
            .limit(limit)
            .execute()
        )

        return result.data

    def count_by_platform(
        self,
        business_id: UUID | str,
        platform: str,
    ) -> int:
        """
        Count marketing history records by platform.

        Args:
            business_id: Business ID.
            platform: Marketing platform.

        Returns:
            Total number of marketing history records for the platform.
        """

        result = (
            self.table
            .select("id", count="exact")
            .eq("business_id", str(business_id))
            .eq("platform", platform)
            .limit(1)
            .execute()
        )

        return int(result.count or 0)
