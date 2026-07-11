"""
Conversation Repository
=======================

Repository for ai_conversations table.

Responsibilities
----------------
- CRUD operations
- Conversation queries
- Database abstraction

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any
from uuid import UUID

from app.repositories.base_repository import BaseRepository
from app.utils.logger import logger


class ConversationRepository(BaseRepository):
    """
    Repository for AI conversations.
    """

    TABLE_NAME = "ai_conversations"

    def create(
        self,
        data: dict[str, Any],
    ) -> dict[str, Any]:
        """
        Create an AI conversation record.

        Args:
            data: AI conversation table values.

        Returns:
            Created AI conversation record.

        Raises:
            ValueError: If the AI conversation record is not created.
        """

        try:

            result = self.table.insert(data).execute()

            if not result.data:
                raise ValueError("AI conversation was not created.")

            logger.success("AI conversation created.")

            return result.data[0]

        except Exception as exc:

            logger.exception(exc)

            raise

    def get(
        self,
        conversation_id: UUID | str,
    ) -> dict[str, Any] | None:
        """
        Get an AI conversation record by ID.

        Args:
            conversation_id: AI conversation ID.

        Returns:
            AI conversation record if found, otherwise None.
        """

        try:

            result = (
                self.table.select("*").eq("id", str(conversation_id)).limit(1).execute()
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
    ) -> list[dict[str, Any]]:
        """
        List AI conversation records.

        Args:
            business_id: Optional business ID filter.
            limit: Maximum number of records returned.

        Returns:
            List of AI conversation records.
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
        conversation_id: UUID | str,
        values: dict[str, Any],
    ) -> dict[str, Any]:
        """
        Update an AI conversation record.

        Args:
            conversation_id: AI conversation ID.
            values: AI conversation table values to update.

        Returns:
            Updated AI conversation record.

        Raises:
            ValueError: If the AI conversation record is not updated.
        """

        try:

            result = self.table.update(values).eq("id", str(conversation_id)).execute()

            if not result.data:
                raise ValueError("AI conversation was not updated.")

            logger.success("AI conversation updated.")

            return result.data[0]

        except Exception as exc:

            logger.exception(exc)

            raise

    def delete(
        self,
        conversation_id: UUID | str,
    ) -> None:
        """
        Delete an AI conversation record.

        Args:
            conversation_id: AI conversation ID.
        """

        try:

            (self.table.delete().eq("id", str(conversation_id)).execute())

            logger.success("AI conversation deleted.")

        except Exception as exc:

            logger.exception(exc)

            raise

    def count(
        self,
        business_id: UUID | str | None = None,
    ) -> int:
        """
        Count AI conversation records.

        Args:
            business_id: Optional business ID filter.

        Returns:
            Total number of AI conversation records.
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
        conversation_id: UUID | str,
    ) -> bool:
        """
        Check whether an AI conversation record exists by ID.

        Args:
            conversation_id: AI conversation ID.

        Returns:
            True if AI conversation record exists, otherwise False.
        """

        try:

            result = (
                self.table.select("id")
                .eq("id", str(conversation_id))
                .limit(1)
                .execute()
            )

            return bool(result.data)

        except Exception as exc:

            logger.exception(exc)

            raise

    def list_by_session(
        self,
        business_id: UUID | str,
        session_id: UUID | str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        List AI conversation records by session.

        Args:
            business_id: Business ID.
            session_id: Conversation session ID.
            limit: Maximum number of records returned.

        Returns:
            List of AI conversation records in the session.
        """

        try:

            result = (
                self.table.select("*")
                .eq("business_id", str(business_id))
                .eq("session_id", str(session_id))
                .order("created_at")
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
        List recent AI conversation records for a business.

        Args:
            business_id: Business ID.
            limit: Maximum number of records returned.

        Returns:
            List of recent AI conversation records.
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

    def list_by_role(
        self,
        business_id: UUID | str,
        role: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        List AI conversation records by role.

        Args:
            business_id: Business ID.
            role: Conversation role.
            limit: Maximum number of records returned.

        Returns:
            List of AI conversation records for the role.
        """

        try:

            result = (
                self.table.select("*")
                .eq("business_id", str(business_id))
                .eq("role", role)
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

    def list_by_agent(
        self,
        business_id: UUID | str,
        agent: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        List AI conversation records by agent.

        Args:
            business_id: Business ID.
            agent: Responsible AI agent.
            limit: Maximum number of records returned.

        Returns:
            List of AI conversation records for the agent.
        """

        try:

            result = (
                self.table.select("*")
                .eq("business_id", str(business_id))
                .eq("agent", agent)
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

    def count_session_messages(
        self,
        business_id: UUID | str,
        session_id: UUID | str,
    ) -> int:
        """
        Count AI conversation messages in a session.

        Args:
            business_id: Business ID.
            session_id: Conversation session ID.

        Returns:
            Total number of AI conversation records in the session.
        """

        try:

            result = (
                self.table.select("id", count="exact")
                .eq("business_id", str(business_id))
                .eq("session_id", str(session_id))
                .limit(1)
                .execute()
            )

            return int(result.count or 0)

        except Exception as exc:

            logger.exception(exc)

            raise
