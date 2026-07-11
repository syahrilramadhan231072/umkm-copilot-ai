"""
API Analytics Router Tests
==========================

Pytest tests for analytics endpoints.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from fastapi.testclient import TestClient

from app.api.dependencies import get_analytics_tools
from app.api.main import create_app


class FakeAnalyticsTools:
    """Fake AnalyticsTools dependency."""

    def __init__(self, fail: bool = False) -> None:
        """Initialize fake analytics tools."""

        self.fail = fail

    def build_dashboard_payload(
        self, business_id: str, limit: int = 1000
    ) -> dict[str, Any]:
        """Return dashboard response."""

        return self._response("build_dashboard_payload", business_id, limit)

    def get_sales_summary(self, business_id: str, limit: int = 1000) -> dict[str, Any]:
        """Return sales response."""

        return self._response("get_sales_summary", business_id, limit)

    def get_inventory_summary(
        self, business_id: str, limit: int = 1000
    ) -> dict[str, Any]:
        """Return inventory response."""

        return self._response("get_inventory_summary", business_id, limit)

    def get_product_summary(
        self, business_id: str, limit: int = 1000
    ) -> dict[str, Any]:
        """Return product response."""

        return self._response("get_product_summary", business_id, limit)

    def get_customer_summary(
        self, business_id: str, limit: int = 1000
    ) -> dict[str, Any]:
        """Return customer response."""

        return self._response("get_customer_summary", business_id, limit)

    def _response(self, tool: str, business_id: str, limit: int) -> dict[str, Any]:
        """Build fake analytics response."""

        if self.fail:
            return {
                "success": False,
                "tool": tool,
                "data": None,
                "error": {"type": "RuntimeError", "message": "Analytics failed."},
            }

        return {
            "success": True,
            "tool": tool,
            "data": {"business_id": business_id, "limit": limit},
            "error": None,
        }


def test_analytics_dashboard_endpoint_returns_success() -> None:
    """Assert analytics dashboard endpoint returns success."""

    app = create_app()
    app.dependency_overrides[get_analytics_tools] = lambda: FakeAnalyticsTools()
    client = TestClient(app)

    response = client.get("/api/v1/analytics/dashboard/business-1?limit=10")

    app.dependency_overrides.clear()

    assert response.status_code == 200
    assert response.json()["tool"] == "build_dashboard_payload"
    assert response.json()["data"]["limit"] == 10


def test_analytics_sales_endpoint_returns_failure_status() -> None:
    """Assert analytics sales endpoint returns HTTP 400 on tool failure."""

    app = create_app()
    app.dependency_overrides[get_analytics_tools] = lambda: FakeAnalyticsTools(
        fail=True
    )
    client = TestClient(app)

    response = client.get("/api/v1/analytics/sales/business-1")

    app.dependency_overrides.clear()

    assert response.status_code == 400
    assert response.json()["success"] is False


def test_analytics_product_endpoint_returns_success() -> None:
    """Assert analytics product endpoint returns success."""

    app = create_app()
    app.dependency_overrides[get_analytics_tools] = lambda: FakeAnalyticsTools()
    client = TestClient(app)

    response = client.get("/api/v1/analytics/products/business-1")

    app.dependency_overrides.clear()

    assert response.status_code == 200
    assert response.json()["tool"] == "get_product_summary"
