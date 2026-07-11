"""
Business Workflow Tests
=======================

Pytest test suite for BusinessWorkflow.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from app.workflows.business_workflow import BusinessWorkflow


class FakeAnalyticsTools:
    """Fake analytics tools for workflow tests."""

    def __init__(self, fail_dashboard: bool = False) -> None:
        """Initialize fake analytics tools."""

        self.fail_dashboard = fail_dashboard

    def build_dashboard_payload(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Return dashboard payload response."""

        if self.fail_dashboard:
            return {
                "success": False,
                "tool": "build_dashboard_payload",
                "data": None,
                "error": {"type": "RuntimeError", "message": "Dashboard failed."},
            }

        return {
            "success": True,
            "tool": "build_dashboard_payload",
            "data": {"business_id": business_id, "limit": limit},
            "error": None,
        }

    def get_sales_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Return sales summary response."""

        return {
            "success": True,
            "tool": "get_sales_summary",
            "data": {"business_id": business_id, "total_revenue": 100000},
            "error": None,
        }

    def get_inventory_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Return inventory summary response."""

        return {
            "success": True,
            "tool": "get_inventory_summary",
            "data": {"business_id": business_id, "low_stock_count": 1},
            "error": None,
        }

    def build_dashboard_alerts(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Return dashboard alerts response."""

        return {
            "success": True,
            "tool": "build_dashboard_alerts",
            "data": [{"level": "warning", "business_id": business_id}],
            "error": None,
        }


class FakeInsightTools:
    """Fake insight tools for workflow tests."""

    def build_business_insight_context(
        self,
        business_id: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Return business insight context response."""

        return {
            "success": True,
            "tool": "build_business_insight_context",
            "data": {"business_id": business_id, "products": [], "limit": limit},
            "error": None,
        }


class FakeConversationTools:
    """Fake conversation tools for workflow tests."""

    def __init__(self, fail: bool = False) -> None:
        """Initialize fake conversation tools."""

        self.fail = fail

    def save_message(
        self,
        business_id: str,
        session_id: str,
        role: str,
        message: str,
        agent: str | None = None,
    ) -> dict[str, Any]:
        """Return save message response."""

        if self.fail:
            return {
                "success": False,
                "tool": "save_message",
                "data": None,
                "error": {"type": "RuntimeError", "message": "Log failed."},
            }

        return {
            "success": True,
            "tool": "save_message",
            "data": {"business_id": business_id, "session_id": session_id},
            "error": None,
        }


def test_business_workflow_runs_overview_successfully() -> None:
    """Assert business overview workflow succeeds."""

    workflow = BusinessWorkflow(
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
        insight_tools=FakeInsightTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_business_overview("business-1", limit=10)

    assert response["success"] is True
    assert response["workflow"] == "run_business_overview"
    assert response["data"]["dashboard"]["business_id"] == "business-1"
    assert len(response["steps"]) == 2


def test_business_workflow_stops_on_required_step_failure() -> None:
    """Assert business overview workflow stops on required step failure."""

    workflow = BusinessWorkflow(
        analytics_tools=FakeAnalyticsTools(fail_dashboard=True),  # type: ignore[arg-type]
        insight_tools=FakeInsightTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_business_overview("business-1")

    assert response["success"] is False
    assert response["error"]["step"] == "build_dashboard_payload"
    assert len(response["steps"]) == 1


def test_business_workflow_records_optional_warning() -> None:
    """Assert optional conversation failure becomes warning."""

    workflow = BusinessWorkflow(
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
        insight_tools=FakeInsightTools(),  # type: ignore[arg-type]
        conversation_tools=FakeConversationTools(fail=True),  # type: ignore[arg-type]
    )

    response = workflow.run_business_overview(
        business_id="business-1",
        session_id="session-1",
    )

    assert response["success"] is True
    assert response["data"]["warnings"][0]["step"] == "save_workflow_message"


def test_business_workflow_rejects_invalid_business_id() -> None:
    """Assert invalid business ID is rejected."""

    workflow = BusinessWorkflow(
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
        insight_tools=FakeInsightTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_business_overview("")

    assert response["success"] is False
    assert response["error"]["type"] == "ValueError"
