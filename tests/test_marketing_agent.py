"""
Marketing Agent Tests
=====================

Pytest test suite for MarketingAgent.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.agents.marketing_agent import MarketingAgent


class FakeMarketingWorkflow:
    """Fake marketing workflow for agent tests."""

    def __init__(self, fail: bool = False) -> None:
        """Initialize fake workflow."""

        self.fail = fail

    def run_product_marketing_context(
        self,
        product_id: str,
        business_id: str | None = None,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return product marketing context workflow response."""

        if self.fail:
            return {
                "success": False,
                "workflow": "run_product_marketing_context",
                "steps": [],
                "data": {},
                "error": {"type": "WorkflowStepError", "message": "Failed."},
            }

        return {
            "success": True,
            "workflow": "run_product_marketing_context",
            "steps": [],
            "data": {
                "product_marketing_context": {
                    "product_id": product_id,
                    "business_id": business_id,
                }
            },
            "error": None,
        }

    def run_create_marketing_record(
        self,
        business_id: str,
        marketing_data: Mapping[str, Any],
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return create marketing record workflow response."""

        return {
            "success": True,
            "workflow": "run_create_marketing_record",
            "steps": [],
            "data": {"marketing_record": {"business_id": business_id}},
            "error": None,
        }

    def run_marketing_history_review(
        self,
        business_id: str,
        keyword: str | None = None,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Return marketing history workflow response."""

        return {
            "success": True,
            "workflow": "run_marketing_history_review",
            "steps": [],
            "data": {"marketing_records": [], "keyword": keyword, "limit": limit},
            "error": None,
        }


def test_marketing_agent_builds_context_successfully() -> None:
    """Assert MarketingAgent builds marketing context."""

    agent = MarketingAgent(FakeMarketingWorkflow())  # type: ignore[arg-type]
    response = agent.build_marketing_context(
        product_id="product-1",
        business_id="business-1",
    )

    assert response["success"] is True
    assert response["agent"] == "MarketingAgent"
    assert response["data"]["product_marketing_context"]["product_id"] == "product-1"


def test_marketing_agent_returns_failure_when_workflow_fails() -> None:
    """Assert MarketingAgent returns failure when workflow fails."""

    agent = MarketingAgent(FakeMarketingWorkflow(fail=True))  # type: ignore[arg-type]
    response = agent.build_marketing_context("product-1")

    assert response["success"] is False
    assert response["error"]["type"] == "WorkflowStepError"


def test_marketing_agent_creates_record_successfully() -> None:
    """Assert MarketingAgent creates marketing record."""

    agent = MarketingAgent(FakeMarketingWorkflow())  # type: ignore[arg-type]
    response = agent.create_marketing_record(
        business_id="business-1",
        marketing_data={"caption": "Promo"},
    )

    assert response["success"] is True
    assert response["intent"] == "create_marketing_record"
    assert response["data"]["marketing_record"]["business_id"] == "business-1"


def test_marketing_agent_rejects_unsupported_intent() -> None:
    """Assert MarketingAgent rejects unsupported intent."""

    agent = MarketingAgent(FakeMarketingWorkflow())  # type: ignore[arg-type]
    response = agent.handle_marketing(
        {"business_id": "business-1"},
        intent="unknown",
    )

    assert response["success"] is False
    assert response["error"]["type"] == "ValueError"
