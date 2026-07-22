"""
API Router Agent Tests
======================

Pytest tests for router agent endpoint.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from fastapi.testclient import TestClient

from app.api.dependencies import get_router_agent
from app.api.main import create_app


class FakeRouterAgent:
    """Fake RouterAgent dependency."""

    def __init__(self, fail: bool = False) -> None:
        """Initialize fake router agent."""

        self.fail = fail

    def route(
        self,
        user_input: str,
        payload: Mapping[str, Any],
        *,
        explicit_route: str | None = None,
    ) -> dict[str, Any]:
        """Return fake route response."""

        if self.fail:
            return {
                "success": False,
                "agent": "RouterAgent",
                "intent": "route",
                "workflow": None,
                "data": {},
                "error": {"type": "ValueError", "message": "Failed."},
            }

        return {
            "success": True,
            "agent": "RouterAgent",
            "intent": "route",
            "workflow": {"workflow": "fake"},
            "data": {"route": explicit_route or "business", "payload": dict(payload)},
            "error": None,
        }


def test_router_endpoint_returns_success() -> None:
    """Assert router endpoint returns success."""

    app = create_app()
    app.dependency_overrides[get_router_agent] = lambda: FakeRouterAgent()
    client = TestClient(app)

    response = client.post(
        "/api/v1/router/route",
        json={
            "user_input": "lihat dashboard",
            "payload": {"business_id": "business-1"},
            "explicit_route": "business",
        },
    )

    app.dependency_overrides.clear()

    assert response.status_code == 200
    payload = response.json()
    assert payload["success"] is True
    assert payload["data"]["route"] == "business"


def test_router_endpoint_returns_failure_status() -> None:
    """Assert router endpoint converts agent failure to HTTP 400."""

    app = create_app()
    app.dependency_overrides[get_router_agent] = lambda: FakeRouterAgent(fail=True)
    client = TestClient(app)

    response = client.post(
        "/api/v1/router/route",
        json={
            "user_input": "lihat dashboard",
            "payload": {"business_id": "business-1"},
        },
    )

    app.dependency_overrides.clear()

    assert response.status_code == 400
    assert response.json()["success"] is False
