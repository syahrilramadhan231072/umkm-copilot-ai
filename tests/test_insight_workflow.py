"""
Insight Workflow Tests
======================

Pytest test suite for InsightWorkflow.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.workflows.insight_workflow import InsightWorkflow


class FakeInsightTools:
    """Fake insight tools for workflow tests."""

    def __init__(self, fail_context: bool = False) -> None:
        """Initialize fake insight tools."""

        self.fail_context = fail_context

    def build_business_insight_context(
        self,
        business_id: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Return insight context response."""

        if self.fail_context:
            return {
                "success": False,
                "tool": "build_business_insight_context",
                "data": None,
                "error": {"type": "RuntimeError", "message": "Context failed."},
            }

        return {
            "success": True,
            "tool": "build_business_insight_context",
            "data": {"business_id": business_id, "products": [], "limit": limit},
            "error": None,
        }

    def create_insight_record(
        self,
        business_id: str,
        insight_data: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Return create insight response."""

        return {
            "success": True,
            "tool": "create_insight_record",
            "data": {"id": "insight-1", "business_id": business_id},
            "error": None,
        }

    def list_recent_insights(
        self,
        business_id: str,
        limit: int = 20,
    ) -> dict[str, Any]:
        """Return recent insights response."""

        return {
            "success": True,
            "tool": "list_recent_insights",
            "data": [{"id": "insight-1", "business_id": business_id}],
            "error": None,
        }

    def list_insights_by_category(
        self,
        business_id: str,
        insight_category: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Return insight category response."""

        return {
            "success": True,
            "tool": "list_insights_by_category",
            "data": [{"category": insight_category, "business_id": business_id}],
            "error": None,
        }

    def search_insight_titles(
        self,
        business_id: str,
        keyword: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Return search insight response."""

        return {
            "success": True,
            "tool": "search_insight_titles",
            "data": [{"title": keyword, "business_id": business_id}],
            "error": None,
        }


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
            "data": {"business_id": business_id, "kpi_cards": []},
            "error": None,
        }


class FakeConversationTools:
    """Fake conversation tools for workflow tests."""

    def save_message(
        self,
        business_id: str,
        session_id: str,
        role: str,
        message: str,
        agent: str | None = None,
    ) -> dict[str, Any]:
        """Return save message response."""

        return {
            "success": True,
            "tool": "save_message",
            "data": {"business_id": business_id, "session_id": session_id},
            "error": None,
        }


def test_insight_workflow_builds_context_successfully() -> None:
    """Assert insight context workflow succeeds."""

    workflow = InsightWorkflow(
        insight_tools=FakeInsightTools(),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_insight_context("business-1")

    assert response["success"] is True
    assert response["workflow"] == "run_insight_context"
    assert response["data"]["insight_context"]["business_id"] == "business-1"


def test_insight_workflow_stops_on_context_failure() -> None:
    """Assert insight context workflow stops on required failure."""

    workflow = InsightWorkflow(
        insight_tools=FakeInsightTools(fail_context=True),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_insight_context("business-1")

    assert response["success"] is False
    assert response["error"]["step"] == "build_business_insight_context"


def test_insight_workflow_records_optional_dashboard_warning() -> None:
    """Assert optional dashboard failure becomes warning."""

    workflow = InsightWorkflow(
        insight_tools=FakeInsightTools(),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(fail_dashboard=True),  # type: ignore[arg-type]
    )

    response = workflow.run_insight_context("business-1")

    assert response["success"] is True
    assert response["data"]["warnings"][0]["step"] == "build_dashboard_payload"


def test_insight_workflow_creates_insight_successfully() -> None:
    """Assert create insight workflow succeeds."""

    workflow = InsightWorkflow(
        insight_tools=FakeInsightTools(),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
        conversation_tools=FakeConversationTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_create_insight(
        business_id="business-1",
        insight_data={"title": "Insight"},
        session_id="session-1",
    )

    assert response["success"] is True
    assert response["data"]["insight"]["id"] == "insight-1"
