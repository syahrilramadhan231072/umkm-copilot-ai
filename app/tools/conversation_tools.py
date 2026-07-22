"""
Conversation Tools
==================

Thin adapter tools for conversation use cases.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.services.conversation_service import ConversationService
from app.utils.logger import logger


class ConversationTools:
    """
    Tool adapter for ConversationService.

    ConversationTools saves and reads conversation records without performing AI
    reasoning, memory orchestration, prompt construction, or LLM calls.
    """

    def __init__(self, conversation_service: ConversationService) -> None:
        """Initialize conversation tools."""

        self._conversation_service = conversation_service
        self._logger = logger

    def save_message(
        self,
        business_id: str,
        session_id: str,
        role: str,
        message: str,
        agent: str | None = None,
    ) -> dict[str, Any]:
        """Save conversation message through ConversationService."""

        tool_name = "save_message"

        try:
            data = self._conversation_service.create_conversation_message(
                business_id=business_id,
                session_id=session_id,
                role=role,
                message=message,
                agent=agent,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def get_conversation(self, conversation_id: str) -> dict[str, Any]:
        """Get conversation record through ConversationService."""

        tool_name = "get_conversation"

        try:
            data = self._conversation_service.get_conversation(conversation_id)
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def list_session_messages(
        self,
        business_id: str,
        session_id: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """List session messages through ConversationService."""

        tool_name = "list_session_messages"

        try:
            data = self._conversation_service.list_session_messages(
                business_id=business_id,
                session_id=session_id,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def build_session_history(
        self,
        business_id: str,
        session_id: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Build session history through ConversationService."""

        tool_name = "build_session_history"

        try:
            data = self._conversation_service.build_session_history(
                business_id=business_id,
                session_id=session_id,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def count_session_messages(
        self,
        business_id: str,
        session_id: str,
    ) -> dict[str, Any]:
        """Count session messages through ConversationService."""

        tool_name = "count_session_messages"

        try:
            data = self._conversation_service.count_session_messages(
                business_id=business_id,
                session_id=session_id,
            )
            return self._success(tool_name, {"count": data})
        except Exception as exc:
            return self._failure(tool_name, exc)

    def update_conversation(
        self,
        conversation_id: str,
        values: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Update conversation record through ConversationService."""

        tool_name = "update_conversation"

        try:
            data = self._conversation_service.update_conversation(
                conversation_id=conversation_id,
                values=values,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def delete_conversation(self, conversation_id: str) -> dict[str, Any]:
        """Delete conversation record through ConversationService."""

        tool_name = "delete_conversation"

        try:
            data = self._conversation_service.delete_conversation(
                conversation_id,
            )
            return self._success(tool_name, {"deleted": data})
        except Exception as exc:
            return self._failure(tool_name, exc)

    def _success(self, tool_name: str, data: Any) -> dict[str, Any]:
        """Build successful tool response."""

        return {
            "success": True,
            "tool": tool_name,
            "data": data,
            "error": None,
        }

    def _failure(self, tool_name: str, error: Exception) -> dict[str, Any]:
        """Build failed tool response."""

        self._logger.exception("Conversation tool failed: %s", tool_name)

        return {
            "success": False,
            "tool": tool_name,
            "data": None,
            "error": {
                "type": error.__class__.__name__,
                "message": str(error),
            },
        }
