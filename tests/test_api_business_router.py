"""
API Business Router Tests
=========================

Pytest tests for business workflow endpoints.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from fastapi.testclient import TestClient

from app.api.dependencies import get_business_workflow
from app.api.main import create_app


class FakeBusinessWorkflow:
    """Fake BusinessWorkflow dependency."""

    def __init__(self, fail: bool = False) -> None:
        """Initialize fake business workflow."""

        self.fail = fail

    def run_business_overview(
        self,
        business_id: str,
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return fake business overview response."""

        return self._response("run_business_overview", business_id, limit)

    def run_business_health_check(
        self,
        business_id: str,
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return fake business health response."""

        return self._response("run_business_health_check", business_id, limit)

    def _response(
        self,
        workflow: str,
        business_id: str,
        limit: int,
    ) -> dict[str, Any]:
        """Build fake workflow response."""

        if self.fail:
            return {
                "success": False,
                "workflow": workflow,
                "steps": [],
                "data": {},
                "error": {"type": "WorkflowStepError", "message": "Failed."},
            }

        return {
            "success": True,
            "workflow": workflow,
            "steps": [],
            "data": {"business_id": business_id, "limit": limit},
            "error": None,
        }


def test_business_overview_endpoint_returns_success() -> None:
    """Assert business overview endpoint returns success."""

    app = create_app()
    app.dependency_overrides[get_business_workflow] = lambda: FakeBusinessWorkflow()
    client = TestClient(app)

    response = client.post(
        "/api/v1/business/overview",
        json={"business_id": "business-1", "limit": 10},
    )

    app.dependency_overrides.clear()

    assert response.status_code == 200
    assert response.json()["workflow"] == "run_business_overview"


def test_business_health_endpoint_returns_failure_status() -> None:
    """Assert business health endpoint returns HTTP 400 on workflow failure."""

    app = create_app()
    app.dependency_overrides[get_business_workflow] = lambda: FakeBusinessWorkflow(fail=True)
    client = TestClient(app)

    response = client.post(
        "/api/v1/business/health-check",
        json={"business_id": "business-1", "limit": 10},
    )

    app.dependency_overrides.clear()

    assert response.status_code == 400
    assert response.json()["success"] is False
