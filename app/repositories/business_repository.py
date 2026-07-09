"""
Business Repository
===================

Repository for business_profile table.

Responsibilities
----------------
- Business profile access
- Business profile updates
- Database abstraction

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from app.repositories.base_repository import BaseRepository
from app.utils.logger import logger


class BusinessRepository(BaseRepository):
    """
    Repository for business profile.

    The database stores a single business profile record.
    """

    TABLE_NAME = "business_profile"

    def create(
        self,
        data: dict[str, Any],
    ) -> dict[str, Any]:
        """
        Create a business profile record.

        Args:
            data: Business profile table values.

        Returns:
            Created business profile record.
        """

        result = (
            self.table
            .insert(data)
            .execute()
        )

        logger.success("Business profile created.")

        return result.data[0]

    def get(
        self,
    ) -> dict[str, Any] | None:
        """
        Get the business profile record.

        Returns:
            Business profile record if found, otherwise None.
        """

        result = (
            self.table
            .select("*")
            .limit(1)
            .execute()
        )

        if result.data:
            return result.data[0]

        return None

    def list(
        self,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        List business profile records.

        Args:
            limit: Maximum number of records returned.

        Returns:
            List of business profile records.
        """

        result = (
            self.table
            .select("*")
            .limit(limit)
            .execute()
        )

        return result.data

    def update(
        self,
        values: dict[str, Any],
    ) -> dict[str, Any]:
        """
        Update the business profile record.

        Args:
            values: Business profile table values to update.

        Returns:
            Updated business profile record.
        """

        profile = self.get_profile()

        if profile is None:
            raise ValueError("Business profile does not exist.")

        result = (
            self.table
            .update(values)
            .eq("id", str(profile["id"]))
            .execute()
        )

        logger.success("Business profile updated.")

        return result.data[0]

    def delete(
        self,
    ) -> None:
        """
        Delete the business profile record.
        """

        profile = self.get_profile()

        if profile is None:
            return

        (
            self.table
            .delete()
            .eq("id", str(profile["id"]))
            .execute()
        )

        logger.success("Business profile deleted.")

    def count(self) -> int:
        """
        Count business profile records.

        Returns:
            Total number of business profile records.
        """

        result = (
            self.table
            .select("id", count="exact")
            .limit(1)
            .execute()
        )

        return int(result.count or 0)

    def exists(self) -> bool:
        """
        Check whether the business profile record exists.

        Returns:
            True if the business profile exists, otherwise False.
        """

        result = (
            self.table
            .select("id")
            .limit(1)
            .execute()
        )

        return bool(result.data)

    def get_profile(self) -> dict[str, Any] | None:
        """
        Get the business profile record.

        Returns:
            Business profile record if found, otherwise None.
        """

        return self.get()

    def update_profile(
        self,
        values: dict[str, Any],
    ) -> dict[str, Any]:
        """
        Update the business profile record.

        Args:
            values: Business profile table values to update.

        Returns:
            Updated business profile record.
        """

        return self.update(values)
