"""
Conversation Memory
===================

Conversation memory provider for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.services.conversation_service import ConversationService
from app.utils.logger import logger


class ConversationMemory:
    """
    Memory component for conversation history.

    ConversationMemory stores and reads conversation history through
    ConversationService only. It does not access repositories, Supabase, prompt
    files, LLM clients, workflow graphs, or UI components directly.
    """

    VALID_ROLES = {
        "user",
        "assistant",
        "system",
    }

    def __init__(self, conversation_service: ConversationService) -> None:
        """
        Initialize conversation memory.

        Args:
            conversation_service: Conversation service dependency.
        """

        self._conversation_service = conversation_service
        self._logger = logger

    def save_user_message(
        self,
        business_id: str,
        session_id: str,
        message: str,
        agent: str | None = None,
    ) -> dict[str, Any]:
        """
        Save user message.

        Args:
            business_id: Business identifier.
            session_id: Conversation session identifier.
            message: User message.
            agent: Optional agent name.

        Returns:
            Created conversation record.
        """

        return self.save_message(
            business_id=business_id,
            session_id=session_id,
            role="user",
            message=message,
            agent=agent,
        )

    def save_assistant_message(
        self,
        business_id: str,
        session_id: str,
        message: str,
        agent: str | None = None,
    ) -> dict[str, Any]:
        """
        Save assistant message.

        Args:
            business_id: Business identifier.
            session_id: Conversation session identifier.
            message: Assistant message.
            agent: Optional agent name.

        Returns:
            Created conversation record.
        """

        return self.save_message(
            business_id=business_id,
            session_id=session_id,
            role="assistant",
            message=message,
            agent=agent,
        )

    def save_system_message(
        self,
        business_id: str,
        session_id: str,
        message: str,
        agent: str | None = None,
    ) -> dict[str, Any]:
        """
        Save system message.

        Args:
            business_id: Business identifier.
            session_id: Conversation session identifier.
            message: System message.
            agent: Optional agent name.

        Returns:
            Created conversation record.
        """

        return self.save_message(
            business_id=business_id,
            session_id=session_id,
            role="system",
            message=message,
            agent=agent,
        )

    def save_message(
        self,
        business_id: str,
        session_id: str,
        role: str,
        message: str,
        agent: str | None = None,
    ) -> dict[str, Any]:
        """
        Save conversation message.

        Args:
            business_id: Business identifier.
            session_id: Conversation session identifier.
            role: Conversation role.
            message: Conversation message.
            agent: Optional agent name.

        Returns:
            Created conversation record.
        """

        self._validate_text(business_id, field_name="business_id")
        self._validate_text(session_id, field_name="session_id")
        self._validate_role(role)
        self._validate_text(message, field_name="message")

        self._logger.info(
            "Saving conversation memory for business_id=%s session_id=%s role=%s.",
            business_id,
            session_id,
            role,
        )

        return self._conversation_service.create_conversation_message(
            business_id=business_id,
            session_id=session_id,
            role=role,
            message=message,
            agent=agent,
        )

    def load_history(
        self,
        business_id: str,
        session_id: str,
        limit: int = 100,
    ) -> list[dict[str, str]]:
        """
        Load conversation history.

        Args:
            business_id: Business identifier.
            session_id: Conversation session identifier.
            limit: Maximum number of messages returned.

        Returns:
            Conversation history.
        """

        self._validate_text(business_id, field_name="business_id")
        self._validate_text(session_id, field_name="session_id")
        self._validate_positive_int(limit, field_name="limit")

        history = self._conversation_service.build_session_history(
            business_id=business_id,
            session_id=session_id,
            limit=limit,
        )

        return self._normalize_history(history, limit=limit)

    def build_memory_state(
        self,
        business_id: str,
        session_id: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """
        Build conversation memory state.

        Args:
            business_id: Business identifier.
            session_id: Conversation session identifier.
            limit: Maximum number of messages returned.

        Returns:
            Conversation memory state.
        """

        history = self.load_history(
            business_id=business_id,
            session_id=session_id,
            limit=limit,
        )
        message_count = self.count_session_messages(
            business_id=business_id,
            session_id=session_id,
        )

        return {
            "business_id": str(business_id),
            "session_id": str(session_id),
            "history": history,
            "message_count": message_count,
            "metadata": {
                "source": "ConversationMemory",
                "limit": limit,
            },
        }

    def append_memory_state(
        self,
        state: Mapping[str, Any],
        *,
        business_id: str,
        session_id: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """
        Append conversation memory to existing state.

        Args:
            state: Existing workflow or agent state.
            business_id: Business identifier.
            session_id: Conversation session identifier.
            limit: Maximum number of messages returned.

        Returns:
            New state containing conversation memory.
        """

        if not isinstance(state, Mapping):
            raise ValueError("state must be a mapping.")

        merged_state = dict(state)
        merged_state["conversation_memory"] = self.build_memory_state(
            business_id=business_id,
            session_id=session_id,
            limit=limit,
        )

        return merged_state

    def count_session_messages(self, business_id: str, session_id: str) -> int:
        """
        Count messages in a conversation session.

        Args:
            business_id: Business identifier.
            session_id: Conversation session identifier.

        Returns:
            Number of messages in the session.
        """

        self._validate_text(business_id, field_name="business_id")
        self._validate_text(session_id, field_name="session_id")

        count = self._conversation_service.count_session_messages(
            business_id=business_id,
            session_id=session_id,
        )

        if not isinstance(count, int):
            raise RuntimeError("Conversation message count must be an integer.")

        return count

    def clear_message(self, conversation_id: str) -> bool:
        """
        Delete a single conversation record.

        Args:
            conversation_id: Conversation identifier.

        Returns:
            True when delete operation completes.
        """

        self._validate_text(conversation_id, field_name="conversation_id")

        return bool(self._conversation_service.delete_conversation(conversation_id))

    def _normalize_history(
        self,
        history: list[dict[str, str]],
        *,
        limit: int,
    ) -> list[dict[str, str]]:
        """
        Normalize conversation history records.

        Args:
            history: Conversation history.
            limit: Maximum number of records returned.

        Returns:
            Normalized history.
        """

        if not isinstance(history, list):
            raise RuntimeError("history must be a list.")

        normalized: list[dict[str, str]] = []

        for record in history:
            if not isinstance(record, dict):
                raise RuntimeError("history must contain dictionaries.")

            role = str(record.get("role", "")).strip()
            message = str(record.get("message", "")).strip()
            agent = str(record.get("agent", "")).strip()

            self._validate_role(role)
            self._validate_text(message, field_name="message")

            normalized.append(
                {
                    "role": role,
                    "message": message,
                    "agent": agent,
                }
            )

        return normalized[-limit:]

    def _validate_role(self, role: str) -> None:
        """
        Validate conversation role.

        Args:
            role: Conversation role.
        """

        if role not in self.VALID_ROLES:
            raise ValueError(f"role must be one of {sorted(self.VALID_ROLES)}.")

    def _validate_text(self, value: Any, *, field_name: str) -> None:
        """
        Validate required text.

        Args:
            value: Value to validate.
            field_name: Field name used in error messages.
        """

        if value is None or not str(value).strip():
            raise ValueError(f"{field_name} is required.")

    def _validate_positive_int(self, value: Any, *, field_name: str) -> None:
        """
        Validate positive integer.

        Args:
            value: Value to validate.
            field_name: Field name used in error messages.
        """

        if not isinstance(value, int) or value <= 0:
            raise ValueError(f"{field_name} must be a positive integer.")
