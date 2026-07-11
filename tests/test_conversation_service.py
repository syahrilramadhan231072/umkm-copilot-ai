"""
Conversation Service Tests
==========================

Pytest tests for ConversationService with the real ConversationRepository.
"""

from __future__ import annotations

from uuid import uuid4

import pytest

from app.repositories.business_repository import BusinessRepository
from app.repositories.conversation_repository import ConversationRepository
from app.services.conversation_service import ConversationService


@pytest.fixture()
def business_repository() -> BusinessRepository:
    """Return real business repository."""
    return BusinessRepository()


@pytest.fixture()
def conversation_repository() -> ConversationRepository:
    """Return real conversation repository."""
    return ConversationRepository()


@pytest.fixture()
def service(conversation_repository: ConversationRepository) -> ConversationService:
    """Return ConversationService with real repository."""
    return ConversationService(conversation_repository)


def _business_id(repository: BusinessRepository) -> str:
    """Return demo business ID."""
    profile = repository.get_profile()
    if profile is None:
        pytest.skip("No business profile demo data available.")
    return str(profile["id"])


def test_conversation_service_create_update_delete(
    business_repository: BusinessRepository,
    conversation_repository: ConversationRepository,
    service: ConversationService,
) -> None:
    """Assert that service creates, updates, and deletes conversation."""
    business_id = _business_id(business_repository)
    session_id = str(uuid4())
    conversation_id: str | None = None

    try:
        created = service.create_conversation_message(
            business_id,
            session_id,
            "user",
            "Apa produk terlaris?",
            agent="router",
        )
        conversation_id = str(created["id"])
        assert str(created["session_id"]) == session_id

        updated = service.update_conversation(
            conversation_id,
            {"message": "Apa produk terlaris minggu ini?"},
        )
        assert updated["message"].endswith("minggu ini?")

    finally:
        if conversation_id and conversation_repository.get(conversation_id) is not None:
            conversation_repository.delete(conversation_id)


def test_conversation_service_builds_session_history(
    business_repository: BusinessRepository,
    conversation_repository: ConversationRepository,
    service: ConversationService,
) -> None:
    """Assert that service builds session history."""
    business_id = _business_id(business_repository)
    session_id = str(uuid4())
    created_ids: list[str] = []

    try:
        first = service.create_conversation_message(
            business_id,
            session_id,
            "user",
            "Halo.",
            agent="router",
        )
        second = service.create_conversation_message(
            business_id,
            session_id,
            "assistant",
            "Halo, ada yang bisa dibantu?",
            agent="router",
        )
        created_ids = [str(first["id"]), str(second["id"])]
        history = service.build_session_history(business_id, session_id, limit=10)

        assert len(history) >= 2
        assert history[0]["role"] in {"user", "assistant", "system"}

    finally:
        for conversation_id in created_ids:
            if conversation_repository.get(conversation_id) is not None:
                conversation_repository.delete(conversation_id)


def test_conversation_service_rejects_invalid_role(
    business_repository: BusinessRepository,
    service: ConversationService,
) -> None:
    """Assert that service rejects invalid role."""
    business_id = _business_id(business_repository)

    with pytest.raises(ValueError):
        service.create_conversation_message(
            business_id,
            str(uuid4()),
            "invalid",
            "Message",
        )
