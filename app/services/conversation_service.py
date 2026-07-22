"""
Conversation Service
====================

Service layer for AI conversation history use cases in UMKM Copilot AI.
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.repositories.conversation_repository import ConversationRepository
from app.services.base_service import BaseService
from app.utils.logger import logger


class ConversationService(BaseService):
    """Coordinate conversation persistence use cases through repository."""

    VALID_ROLES = {"user", "assistant", "system"}

    def __init__(self, conversation_repository: ConversationRepository) -> None:
        """Initialize service with injected conversation repository."""
        super().__init__()
        self._conversation_repository = conversation_repository
        self._logger = logger

    def create_conversation_message(
        self,
        business_id: str,
        session_id: str,
        role: str,
        message: str,
        agent: str | None = None,
    ) -> dict[str, Any]:
        """Create conversation message record."""
        self._required_text(business_id, "business_id")
        self._required_text(session_id, "session_id")
        self._validate_role(role)
        self._required_text(message, "message")

        created = self._conversation_repository.create(
            {
                "business_id": str(business_id),
                "session_id": str(session_id),
                "role": role,
                "agent": agent,
                "message": message,
            }
        )
        if not isinstance(created, dict):
            raise RuntimeError("Conversation creation failed.")
        return created

    def get_conversation(self, conversation_id: str) -> dict[str, Any]:
        """Return conversation record by ID."""
        self._required_text(conversation_id, "conversation_id")
        record = self._conversation_repository.get(conversation_id)
        if record is None:
            raise LookupError(f"Conversation not found: {conversation_id}.")
        return record

    def list_conversations(
        self,
        business_id: str | None = None,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return conversation records."""
        if business_id is not None:
            self._required_text(business_id, "business_id")
        self._validate_limit(limit)
        return self._conversation_repository.list(business_id=business_id, limit=limit)

    def list_session_messages(
        self,
        business_id: str,
        session_id: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return conversation records in a session."""
        self._required_text(business_id, "business_id")
        self._required_text(session_id, "session_id")
        self._validate_limit(limit)
        return self._conversation_repository.list_by_session(
            business_id,
            session_id,
            limit=limit,
        )

    def list_recent_conversations(
        self,
        business_id: str,
        limit: int = 20,
    ) -> list[dict[str, Any]]:
        """Return recent conversation records."""
        self._required_text(business_id, "business_id")
        self._validate_limit(limit)
        return self._conversation_repository.list_recent(business_id, limit=limit)

    def list_conversations_by_role(
        self,
        business_id: str,
        role: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return conversation records by role."""
        self._required_text(business_id, "business_id")
        self._validate_role(role)
        self._validate_limit(limit)
        return self._conversation_repository.list_by_role(
            business_id,
            role,
            limit=limit,
        )

    def list_conversations_by_agent(
        self,
        business_id: str,
        agent: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return conversation records by agent."""
        self._required_text(business_id, "business_id")
        self._required_text(agent, "agent")
        self._validate_limit(limit)
        return self._conversation_repository.list_by_agent(
            business_id,
            agent,
            limit=limit,
        )

    def update_conversation(
        self,
        conversation_id: str,
        values: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Update conversation record."""
        self._required_text(conversation_id, "conversation_id")
        update_values = self._to_dict(values, "values")
        if "role" in update_values:
            self._validate_role(str(update_values["role"]))
        if "message" in update_values:
            self._required_text(update_values["message"], "message")
        self.get_conversation(conversation_id)

        updated = self._conversation_repository.update(conversation_id, update_values)
        if not isinstance(updated, dict):
            raise RuntimeError("Conversation update failed.")
        return updated

    def delete_conversation(self, conversation_id: str) -> bool:
        """Delete conversation record by ID."""
        self._required_text(conversation_id, "conversation_id")
        self.get_conversation(conversation_id)
        self._conversation_repository.delete(conversation_id)
        return True

    def count_conversations(self, business_id: str | None = None) -> int:
        """Return conversation record count."""
        if business_id is not None:
            self._required_text(business_id, "business_id")
        total = self._conversation_repository.count(business_id=business_id)
        if not isinstance(total, int):
            raise RuntimeError("Conversation count operation failed.")
        return total

    def count_session_messages(self, business_id: str, session_id: str) -> int:
        """Return message count in a session."""
        self._required_text(business_id, "business_id")
        self._required_text(session_id, "session_id")
        total = self._conversation_repository.count_session_messages(
            business_id,
            session_id,
        )
        if not isinstance(total, int):
            raise RuntimeError("Session message count operation failed.")
        return total

    def build_session_history(
        self,
        business_id: str,
        session_id: str,
        limit: int = 100,
    ) -> list[dict[str, str]]:
        """Return session history for Memory Layer."""
        return [
            {
                "role": str(record["role"]),
                "message": str(record["message"]),
                "agent": "" if record.get("agent") is None else str(record["agent"]),
            }
            for record in self.list_session_messages(business_id, session_id, limit=limit)
        ]

    def _validate_role(self, role: str) -> None:
        """Validate conversation role."""
        if role not in self.VALID_ROLES:
            raise ValueError(f"role must be one of {sorted(self.VALID_ROLES)}.")

    def _to_dict(self, value: Mapping[str, Any], field_name: str) -> dict[str, Any]:
        """Convert mapping input into a non-empty dictionary."""
        if not isinstance(value, Mapping):
            raise ValueError(f"{field_name} must be a mapping.")
        result = dict(value)
        if not result:
            raise ValueError(f"{field_name} cannot be empty.")
        return result

    def _required_text(self, value: Any, field_name: str) -> str:
        """Validate and return required text value."""
        if value is None:
            raise ValueError(f"{field_name} is required.")
        text = str(value).strip()
        if not text:
            raise ValueError(f"{field_name} cannot be empty.")
        return text

    def _validate_limit(self, limit: int) -> None:
        """Validate list limit."""
        if not isinstance(limit, int) or limit <= 0:
            raise ValueError("limit must be a positive integer.")
