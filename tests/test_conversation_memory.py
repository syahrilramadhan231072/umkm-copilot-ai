"""
Conversation Memory Tests
=========================

Pytest test suite for ConversationMemory.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

import pytest

from app.memory.conversation_memory import ConversationMemory


class FakeConversationService:
    """Fake ConversationService for memory tests."""

    def __init__(self) -> None:
        """Initialize fake conversation service."""

        self.records: list[dict[str, Any]] = []

    def create_conversation_message(
        self,
        business_id: str,
        session_id: str,
        role: str,
        message: str,
        agent: str | None = None,
    ) -> dict[str, Any]:
        """Create fake conversation message."""

        record = {
            "id": f"conversation-{len(self.records) + 1}",
            "business_id": business_id,
            "session_id": session_id,
            "role": role,
            "message": message,
            "agent": agent,
        }
        self.records.append(record)

        return record

    def build_session_history(
        self,
        business_id: str,
        session_id: str,
        limit: int = 100,
    ) -> list[dict[str, str]]:
        """Return fake session history."""

        return [
            {
                "role": str(record["role"]),
                "message": str(record["message"]),
                "agent": "" if record.get("agent") is None else str(record["agent"]),
            }
            for record in self.records
            if record["business_id"] == business_id and record["session_id"] == session_id
        ][-limit:]

    def count_session_messages(self, business_id: str, session_id: str) -> int:
        """Count fake session messages."""

        return len(
            [
                record
                for record in self.records
                if record["business_id"] == business_id and record["session_id"] == session_id
            ]
        )

    def delete_conversation(self, conversation_id: str) -> bool:
        """Delete fake conversation message."""

        before_count = len(self.records)
        self.records = [record for record in self.records if record["id"] != conversation_id]

        return len(self.records) < before_count


def test_conversation_memory_saves_user_message() -> None:
    """Assert ConversationMemory saves user message."""

    service = FakeConversationService()
    memory = ConversationMemory(service)  # type: ignore[arg-type]

    record = memory.save_user_message(
        business_id="business-1",
        session_id="session-1",
        message="Halo",
        agent="router",
    )

    assert record["id"] == "conversation-1"
    assert record["role"] == "user"
    assert record["message"] == "Halo"
    assert len(service.records) == 1


def test_conversation_memory_saves_assistant_and_system_messages() -> None:
    """Assert ConversationMemory saves assistant and system messages."""

    service = FakeConversationService()
    memory = ConversationMemory(service)  # type: ignore[arg-type]

    assistant = memory.save_assistant_message(
        business_id="business-1",
        session_id="session-1",
        message="Halo juga",
        agent="router",
    )
    system = memory.save_system_message(
        business_id="business-1",
        session_id="session-1",
        message="System note",
        agent="workflow",
    )

    assert assistant["role"] == "assistant"
    assert system["role"] == "system"
    assert len(service.records) == 2


def test_conversation_memory_loads_history() -> None:
    """Assert ConversationMemory loads normalized history."""

    service = FakeConversationService()
    memory = ConversationMemory(service)  # type: ignore[arg-type]

    memory.save_user_message("business-1", "session-1", "Halo", "router")
    memory.save_assistant_message("business-1", "session-1", "Halo juga", "router")

    history = memory.load_history(
        business_id="business-1",
        session_id="session-1",
        limit=10,
    )

    assert len(history) == 2
    assert history[0]["role"] == "user"
    assert history[1]["role"] == "assistant"


def test_conversation_memory_builds_memory_state() -> None:
    """Assert ConversationMemory builds memory state."""

    service = FakeConversationService()
    memory = ConversationMemory(service)  # type: ignore[arg-type]

    memory.save_user_message("business-1", "session-1", "Halo", "router")
    state = memory.build_memory_state(
        business_id="business-1",
        session_id="session-1",
        limit=10,
    )

    assert state["business_id"] == "business-1"
    assert state["session_id"] == "session-1"
    assert state["message_count"] == 1
    assert state["history"][0]["message"] == "Halo"
    assert state["metadata"]["source"] == "ConversationMemory"


def test_conversation_memory_appends_memory_state() -> None:
    """Assert ConversationMemory appends memory state into existing state."""

    service = FakeConversationService()
    memory = ConversationMemory(service)  # type: ignore[arg-type]

    memory.save_user_message("business-1", "session-1", "Halo", "router")
    state = memory.append_memory_state(
        {"business_id": "business-1", "input": "question"},
        business_id="business-1",
        session_id="session-1",
    )

    assert state["input"] == "question"
    assert state["conversation_memory"]["message_count"] == 1


def test_conversation_memory_deletes_single_message() -> None:
    """Assert ConversationMemory can clear a single message."""

    service = FakeConversationService()
    memory = ConversationMemory(service)  # type: ignore[arg-type]

    record = memory.save_user_message("business-1", "session-1", "Halo")
    deleted = memory.clear_message(str(record["id"]))

    assert deleted is True
    assert service.count_session_messages("business-1", "session-1") == 0


def test_conversation_memory_rejects_invalid_role() -> None:
    """Assert ConversationMemory rejects invalid role."""

    memory = ConversationMemory(FakeConversationService())  # type: ignore[arg-type]

    with pytest.raises(ValueError):
        memory.save_message(
            business_id="business-1",
            session_id="session-1",
            role="invalid",
            message="Halo",
        )


def test_conversation_memory_rejects_empty_message() -> None:
    """Assert ConversationMemory rejects empty message."""

    memory = ConversationMemory(FakeConversationService())  # type: ignore[arg-type]

    with pytest.raises(ValueError):
        memory.save_user_message(
            business_id="business-1",
            session_id="session-1",
            message="",
        )


def test_conversation_memory_rejects_invalid_limit() -> None:
    """Assert ConversationMemory rejects invalid limit."""

    memory = ConversationMemory(FakeConversationService())  # type: ignore[arg-type]

    with pytest.raises(ValueError):
        memory.load_history(
            business_id="business-1",
            session_id="session-1",
            limit=0,
        )
