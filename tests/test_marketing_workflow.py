"""
Marketing Workflow Tests
========================

Pytest test suite for MarketingWorkflow.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.workflows.marketing_workflow import MarketingWorkflow


class FakeMarketingTools:
    """Fake marketing tools for workflow tests."""

    def __init__(self, fail_context: bool = False) -> None:
        """Initialize fake marketing tools."""

        self.fail_context = fail_context

    def build_product_marketing_context(
        self,
        product_id: str,
    ) -> dict[str, Any]:
        """Return product marketing context response."""

        if self.fail_context:
            return {
                "success": False,
                "tool": "build_product_marketing_context",
                "data": None,
                "error": {"type": "LookupError", "message": "Product missing."},
            }

        return {
            "success": True,
            "tool": "build_product_marketing_context",
            "data": {"product_id": product_id, "business_id": "business-1"},
            "error": None,
        }

    def create_marketing_record(
        self,
        business_id: str,
        marketing_data: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Return create marketing record response."""

        return {
            "success": True,
            "tool": "create_marketing_record",
            "data": {"id": "marketing-1", "business_id": business_id},
            "error": None,
        }

    def list_marketing_history(
        self,
        business_id: str | None = None,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Return marketing history response."""

        return {
            "success": True,
            "tool": "list_marketing_history",
            "data": [{"id": "marketing-1", "business_id": business_id}],
            "error": None,
        }

    def search_marketing_captions(
        self,
        business_id: str,
        keyword: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Return marketing search response."""

        return {
            "success": True,
            "tool": "search_marketing_captions",
            "data": [{"caption": keyword, "business_id": business_id}],
            "error": None,
        }


class FakeAnalyticsTools:
    """Fake analytics tools for workflow tests."""

    def __init__(self, fail_product_summary: bool = False) -> None:
        """Initialize fake analytics tools."""

        self.fail_product_summary = fail_product_summary

    def get_product_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Return product summary response."""

        if self.fail_product_summary:
            return {
                "success": False,
                "tool": "get_product_summary",
                "data": None,
                "error": {"type": "RuntimeError", "message": "Summary failed."},
            }

        return {
            "success": True,
            "tool": "get_product_summary",
            "data": {"business_id": business_id, "active_products": 5},
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


def test_marketing_workflow_builds_context_successfully() -> None:
    """Assert marketing context workflow succeeds."""

    workflow = MarketingWorkflow(
        marketing_tools=FakeMarketingTools(),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_product_marketing_context("product-1")

    assert response["success"] is True
    assert response["workflow"] == "run_product_marketing_context"
    assert response["data"]["product_marketing_context"]["product_id"] == "product-1"


def test_marketing_workflow_stops_on_context_failure() -> None:
    """Assert marketing context workflow stops on context failure."""

    workflow = MarketingWorkflow(
        marketing_tools=FakeMarketingTools(fail_context=True),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_product_marketing_context("product-1")

    assert response["success"] is False
    assert response["error"]["step"] == "build_product_marketing_context"


def test_marketing_workflow_records_optional_summary_warning() -> None:
    """Assert optional analytics failure becomes warning."""

    workflow = MarketingWorkflow(
        marketing_tools=FakeMarketingTools(),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(fail_product_summary=True),  # type: ignore[arg-type]
    )

    response = workflow.run_product_marketing_context("product-1")

    assert response["success"] is True
    assert response["data"]["warnings"][0]["step"] == "get_product_summary"


def test_marketing_workflow_creates_record_successfully() -> None:
    """Assert create marketing record workflow succeeds."""

    workflow = MarketingWorkflow(
        marketing_tools=FakeMarketingTools(),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
        conversation_tools=FakeConversationTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_create_marketing_record(
        business_id="business-1",
        marketing_data={"caption": "Promo"},
        session_id="session-1",
    )

    assert response["success"] is True
    assert response["data"]["marketing_record"]["id"] == "marketing-1"
