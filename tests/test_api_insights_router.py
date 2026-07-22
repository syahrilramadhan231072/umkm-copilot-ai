"""
API Insights Router Tests
=========================

Pytest tests for insight endpoints.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from fastapi.testclient import TestClient

from app.api.dependencies import get_insight_agent
from app.api.main import create_app


class FakeInsightAgent:
    """Fake InsightAgent dependency."""

    def __init__(self, fail: bool = False) -> None:
        """Initialize fake insight agent."""

        self.fail = fail

    def build_insight_context(
        self,
        business_id: str,
        *,
        limit: int = 100,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return fake insight context response."""

        if self.fail:
            return self._failure("insight_context")

        return {
            "success": True,
            "agent": "InsightAgent",
            "intent": "insight_context",
            "workflow": {"workflow": "run_insight_context"},
            "data": {"insight_context": {"business_id": business_id, "limit": limit}},
            "error": None,
        }

    def create_insight(
        self,
        business_id: str,
        insight_data: Mapping[str, Any],
        *,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return fake create insight response."""

        return {
            "success": True,
            "agent": "InsightAgent",
            "intent": "create_insight",
            "workflow": {"workflow": "run_create_insight"},
            "data": {"insight": dict(insight_data)},
            "error": None,
        }

    def handle_insight(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "insight_context",
    ) -> dict[str, Any]:
        """Return fake insight review response."""

        return {
            "success": True,
            "agent": "InsightAgent",
            "intent": intent,
            "workflow": {"workflow": "run_insight_review"},
            "data": {"insights": [], "payload": dict(payload)},
            "error": None,
        }

    def _failure(self, intent: str) -> dict[str, Any]:
        """Build fake failure response."""

        return {
            "success": False,
            "agent": "InsightAgent",
            "intent": intent,
            "workflow": None,
            "data": {},
            "error": {"type": "ValueError", "message": "Failed."},
        }


def test_insight_context_endpoint_returns_success() -> None:
    """Assert insight context endpoint returns success."""

    app = create_app()
    app.dependency_overrides[get_insight_agent] = lambda: FakeInsightAgent()
    client = TestClient(app)

    response = client.post(
        "/api/v1/insights/context",
        json={"business_id": "business-1", "limit": 10},
    )

    app.dependency_overrides.clear()

    assert response.status_code == 200
    assert response.json()["data"]["insight_context"]["business_id"] == "business-1"


def test_insight_context_endpoint_returns_failure_status() -> None:
    """Assert insight context endpoint returns HTTP 400 on agent failure."""

    app = create_app()
    app.dependency_overrides[get_insight_agent] = lambda: FakeInsightAgent(fail=True)
    client = TestClient(app)

    response = client.post(
        "/api/v1/insights/context",
        json={"business_id": "business-1", "limit": 10},
    )

    app.dependency_overrides.clear()

    assert response.status_code == 400
    assert response.json()["success"] is False


def test_insight_review_endpoint_returns_success() -> None:
    """Assert insight review endpoint returns success."""

    app = create_app()
    app.dependency_overrides[get_insight_agent] = lambda: FakeInsightAgent()
    client = TestClient(app)

    response = client.get("/api/v1/insights/review/business-1?keyword=sales")

    app.dependency_overrides.clear()

    assert response.status_code == 200
    assert response.json()["intent"] == "insight_review"
