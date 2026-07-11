"""
Transaction Agent Tests
=======================

Pytest test suite for TransactionAgent.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.agents.transaction_agent import TransactionAgent


class FakeTransactionWorkflow:
    """Fake transaction workflow for agent tests."""

    def __init__(self, fail: bool = False) -> None:
        """Initialize fake workflow."""

        self.fail = fail

    def run_record_transaction(
        self,
        business_id: str,
        product_id: str,
        quantity: int,
        payment_method: str = "cash",
        status: str = "completed",
        notes: str | None = None,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return record transaction workflow response."""

        if self.fail:
            return {
                "success": False,
                "workflow": "run_record_transaction",
                "steps": [],
                "data": {},
                "error": {"type": "WorkflowStepError", "message": "Failed."},
            }

        return {
            "success": True,
            "workflow": "run_record_transaction",
            "steps": [],
            "data": {
                "transaction": {
                    "business_id": business_id,
                    "product_id": product_id,
                    "quantity": quantity,
                }
            },
            "error": None,
        }

    def run_record_transaction_from_payload(
        self,
        transaction_data: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Return record transaction from payload workflow response."""

        return {
            "success": True,
            "workflow": "run_record_transaction_from_payload",
            "steps": [],
            "data": {"transaction": dict(transaction_data)},
            "error": None,
        }

    def run_transaction_summary_refresh(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Return summary refresh workflow response."""

        return {
            "success": True,
            "workflow": "run_transaction_summary_refresh",
            "steps": [],
            "data": {"business_id": business_id, "limit": limit},
            "error": None,
        }


class FakeConversationMemory:
    """Fake conversation memory for agent tests."""

    def __init__(self) -> None:
        """Initialize fake memory."""

        self.saved: list[dict[str, Any]] = []

    def save_user_message(
        self,
        business_id: str,
        session_id: str,
        message: str,
        agent: str | None = None,
    ) -> dict[str, Any]:
        """Save fake user message."""

        record = {
            "business_id": business_id,
            "session_id": session_id,
            "message": message,
            "agent": agent,
        }
        self.saved.append(record)

        return record


def test_transaction_agent_records_transaction_successfully() -> None:
    """Assert TransactionAgent records transaction successfully."""

    agent = TransactionAgent(FakeTransactionWorkflow())  # type: ignore[arg-type]

    response = agent.record_transaction(
        {
            "business_id": "business-1",
            "product_id": "product-1",
            "quantity": 2,
        }
    )

    assert response["success"] is True
    assert response["agent"] == "TransactionAgent"
    assert response["intent"] == "record_transaction"
    assert response["data"]["transaction"]["quantity"] == 2


def test_transaction_agent_returns_failure_when_workflow_fails() -> None:
    """Assert TransactionAgent returns failure when workflow fails."""

    agent = TransactionAgent(FakeTransactionWorkflow(fail=True))  # type: ignore[arg-type]

    response = agent.record_transaction(
        {
            "business_id": "business-1",
            "product_id": "product-1",
            "quantity": 2,
        }
    )

    assert response["success"] is False
    assert response["error"]["type"] == "WorkflowStepError"


def test_transaction_agent_saves_optional_user_message() -> None:
    """Assert TransactionAgent saves optional user message."""

    memory = FakeConversationMemory()
    agent = TransactionAgent(
        FakeTransactionWorkflow(),  # type: ignore[arg-type]
        conversation_memory=memory,  # type: ignore[arg-type]
    )

    response = agent.record_transaction(
        {
            "business_id": "business-1",
            "product_id": "product-1",
            "quantity": 2,
            "session_id": "session-1",
            "user_message": "Catat penjualan 2 kopi.",
        }
    )

    assert response["success"] is True
    assert len(memory.saved) == 1
    assert memory.saved[0]["agent"] == "TransactionAgent"


def test_transaction_agent_rejects_invalid_payload() -> None:
    """Assert TransactionAgent rejects invalid payload."""

    agent = TransactionAgent(FakeTransactionWorkflow())  # type: ignore[arg-type]
    response = agent.handle_transaction("invalid")  # type: ignore[arg-type]

    assert response["success"] is False
    assert response["error"]["type"] == "ValueError"


def test_transaction_agent_refreshes_summary() -> None:
    """Assert TransactionAgent refreshes summary."""

    agent = TransactionAgent(FakeTransactionWorkflow())  # type: ignore[arg-type]
    response = agent.refresh_transaction_summary("business-1", limit=10)

    assert response["success"] is True
    assert response["workflow"]["workflow"] == "run_transaction_summary_refresh"
    assert response["data"]["limit"] == 10
