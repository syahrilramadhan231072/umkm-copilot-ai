"""
API Exports Router Tests
========================

Pytest tests for export endpoints.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from fastapi.testclient import TestClient

from app.api.dependencies import get_export_agent
from app.api.main import create_app


class FakeExportAgent:
    """Fake ExportAgent dependency."""

    def __init__(self, fail: bool = False) -> None:
        """Initialize fake export agent."""

        self.fail = fail

    def export_dashboard(
        self,
        business_id: str,
        *,
        export_format: str = "json",
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return fake dashboard export response."""

        return self._response("export_dashboard", f"dashboard.{export_format}")

    def export_sales_summary(
        self,
        business_id: str,
        *,
        export_format: str = "json",
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return fake sales export response."""

        return self._response("export_sales_summary", f"sales_summary.{export_format}")

    def handle_export(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "export_dashboard",
    ) -> dict[str, Any]:
        """Return fake export response."""

        filename_prefix = str(payload.get("filename_prefix", intent))
        export_format = str(payload.get("export_format", "json"))

        return self._response(intent, f"{filename_prefix}.{export_format}")

    def _response(self, intent: str, filename: str) -> dict[str, Any]:
        """Build fake export response."""

        if self.fail:
            return {
                "success": False,
                "agent": "ExportAgent",
                "intent": intent,
                "workflow": None,
                "data": {},
                "error": {"type": "ValueError", "message": "Failed."},
            }

        return {
            "success": True,
            "agent": "ExportAgent",
            "intent": intent,
            "workflow": {"workflow": intent},
            "data": {"export": {"filename": filename}},
            "error": None,
        }


def test_export_dashboard_endpoint_returns_success() -> None:
    """Assert export dashboard endpoint returns success."""

    app = create_app()
    app.dependency_overrides[get_export_agent] = lambda: FakeExportAgent()
    client = TestClient(app)

    response = client.post(
        "/api/v1/exports/dashboard",
        json={"business_id": "business-1", "export_format": "json"},
    )

    app.dependency_overrides.clear()

    assert response.status_code == 200
    assert response.json()["data"]["export"]["filename"] == "dashboard.json"


def test_export_dashboard_endpoint_returns_failure_status() -> None:
    """Assert export dashboard endpoint returns HTTP 400 on agent failure."""

    app = create_app()
    app.dependency_overrides[get_export_agent] = lambda: FakeExportAgent(fail=True)
    client = TestClient(app)

    response = client.post(
        "/api/v1/exports/dashboard",
        json={"business_id": "business-1", "export_format": "json"},
    )

    app.dependency_overrides.clear()

    assert response.status_code == 400
    assert response.json()["success"] is False


def test_export_structured_endpoint_returns_success() -> None:
    """Assert export structured endpoint returns success."""

    app = create_app()
    app.dependency_overrides[get_export_agent] = lambda: FakeExportAgent()
    client = TestClient(app)

    response = client.post(
        "/api/v1/exports/structured",
        json={
            "data_to_export": [{"name": "Coffee"}],
            "export_format": "csv",
            "filename_prefix": "products",
        },
    )

    app.dependency_overrides.clear()

    assert response.status_code == 200
    assert response.json()["data"]["export"]["filename"] == "products.csv"
