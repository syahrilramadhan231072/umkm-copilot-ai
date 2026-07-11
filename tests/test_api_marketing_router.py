"""
API Marketing Router Tests
==========================

Pytest tests for marketing endpoints.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from fastapi.testclient import TestClient

from app.api.dependencies import get_marketing_agent
from app.api.main import create_app


class FakeMarketingAgent:
    """Fake MarketingAgent dependency."""

    def __init__(self, fail: bool = False) -> None:
        """Initialize fake marketing agent."""

        self.fail = fail

    def build_marketing_context(
        self,
        product_id: str,
        *,
        business_id: str | None = None,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return fake marketing context response."""

        if self.fail:
            return self._failure("marketing_context")

        return {
            "success": True,
            "agent": "MarketingAgent",
            "intent": "marketing_context",
            "workflow": {"workflow": "run_product_marketing_context"},
            "data": {"product_marketing_context": {"product_id": product_id}},
            "error": None,
        }

    def create_marketing_record(
        self,
        business_id: str,
        marketing_data: Mapping[str, Any],
        *,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return fake create marketing response."""

        return {
            "success": True,
            "agent": "MarketingAgent",
            "intent": "create_marketing_record",
            "workflow": {"workflow": "run_create_marketing_record"},
            "data": {"marketing_record": dict(marketing_data)},
            "error": None,
        }

    def handle_marketing(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "marketing_context",
    ) -> dict[str, Any]:
        """Return fake marketing history response."""

        return {
            "success": True,
            "agent": "MarketingAgent",
            "intent": intent,
            "workflow": {"workflow": "run_marketing_history_review"},
            "data": {"marketing_records": [], "payload": dict(payload)},
            "error": None,
        }

    def _failure(self, intent: str) -> dict[str, Any]:
        """Build fake failure response."""

        return {
            "success": False,
            "agent": "MarketingAgent",
            "intent": intent,
            "workflow": None,
            "data": {},
            "error": {"type": "ValueError", "message": "Failed."},
        }


def test_marketing_context_endpoint_returns_success() -> None:
    """Assert marketing context endpoint returns success."""

    app = create_app()
    app.dependency_overrides[get_marketing_agent] = lambda: FakeMarketingAgent()
    client = TestClient(app)

    response = client.post(
        "/api/v1/marketing/context",
        json={"product_id": "product-1", "business_id": "business-1"},
    )

    app.dependency_overrides.clear()

    assert response.status_code == 200
    assert (
        response.json()["data"]["product_marketing_context"]["product_id"]
        == "product-1"
    )


def test_marketing_context_endpoint_returns_failure_status() -> None:
    """Assert marketing context endpoint returns HTTP 400 on agent failure."""

    app = create_app()
    app.dependency_overrides[get_marketing_agent] = lambda: FakeMarketingAgent(
        fail=True
    )
    client = TestClient(app)

    response = client.post(
        "/api/v1/marketing/context",
        json={"product_id": "product-1", "business_id": "business-1"},
    )

    app.dependency_overrides.clear()

    assert response.status_code == 400
    assert response.json()["success"] is False


def test_marketing_history_endpoint_returns_success() -> None:
    """Assert marketing history endpoint returns success."""

    app = create_app()
    app.dependency_overrides[get_marketing_agent] = lambda: FakeMarketingAgent()
    client = TestClient(app)

    response = client.get("/api/v1/marketing/history/business-1?keyword=promo")

    app.dependency_overrides.clear()

    assert response.status_code == 200
    assert response.json()["intent"] == "marketing_history"
