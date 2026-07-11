"""
API Transactions Router Tests
=============================

Pytest tests for transaction endpoints.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from fastapi.testclient import TestClient

from app.api.dependencies import get_transaction_agent
from app.api.main import create_app


class FakeTransactionAgent:
    """Fake TransactionAgent dependency."""

    def __init__(self, fail: bool = False) -> None:
        """Initialize fake transaction agent."""

        self.fail = fail

    def record_transaction(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Return fake record transaction response."""

        if self.fail:
            return self._failure("record_transaction")

        return {
            "success": True,
            "agent": "TransactionAgent",
            "intent": "record_transaction",
            "workflow": {"workflow": "run_record_transaction"},
            "data": {"transaction": dict(payload)},
            "error": None,
        }

    def handle_transaction(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "record_transaction",
    ) -> dict[str, Any]:
        """Return fake handle transaction response."""

        return {
            "success": True,
            "agent": "TransactionAgent",
            "intent": intent,
            "workflow": {"workflow": "run_record_transaction_from_payload"},
            "data": {"transaction": dict(payload)},
            "error": None,
        }

    def refresh_transaction_summary(
        self,
        business_id: str,
        *,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Return fake summary response."""

        return {
            "success": True,
            "agent": "TransactionAgent",
            "intent": "transaction_summary",
            "workflow": {"workflow": "run_transaction_summary_refresh"},
            "data": {"business_id": business_id, "limit": limit},
            "error": None,
        }

    def _failure(self, intent: str) -> dict[str, Any]:
        """Build fake failure response."""

        return {
            "success": False,
            "agent": "TransactionAgent",
            "intent": intent,
            "workflow": None,
            "data": {},
            "error": {"type": "ValueError", "message": "Failed."},
        }


def test_record_transaction_endpoint_returns_success() -> None:
    """Assert record transaction endpoint returns success."""

    app = create_app()
    app.dependency_overrides[get_transaction_agent] = lambda: FakeTransactionAgent()
    client = TestClient(app)

    response = client.post(
        "/api/v1/transactions/record",
        json={
            "business_id": "business-1",
            "product_id": "product-1",
            "quantity": 2,
        },
    )

    app.dependency_overrides.clear()

    assert response.status_code == 200
    assert response.json()["data"]["transaction"]["quantity"] == 2


def test_record_transaction_endpoint_returns_failure_status() -> None:
    """Assert record transaction endpoint returns HTTP 400 on agent failure."""

    app = create_app()
    app.dependency_overrides[get_transaction_agent] = lambda: FakeTransactionAgent(
        fail=True
    )
    client = TestClient(app)

    response = client.post(
        "/api/v1/transactions/record",
        json={
            "business_id": "business-1",
            "product_id": "product-1",
            "quantity": 2,
        },
    )

    app.dependency_overrides.clear()

    assert response.status_code == 400
    assert response.json()["success"] is False


def test_transaction_summary_endpoint_returns_success() -> None:
    """Assert transaction summary endpoint returns success."""

    app = create_app()
    app.dependency_overrides[get_transaction_agent] = lambda: FakeTransactionAgent()
    client = TestClient(app)

    response = client.get("/api/v1/transactions/summary/business-1?limit=10")

    app.dependency_overrides.clear()

    assert response.status_code == 200
    assert response.json()["data"]["business_id"] == "business-1"
    assert response.json()["data"]["limit"] == 10
