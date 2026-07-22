"""
Insight Agent Tests
===================

Pytest test suite for InsightAgent.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.agents.insight_agent import InsightAgent


class FakeInsightWorkflow:
    """Fake insight workflow for agent tests."""

    def __init__(self, fail: bool = False) -> None:
        """Initialize fake workflow."""

        self.fail = fail

    def run_insight_context(
        self,
        business_id: str,
        limit: int = 100,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return insight context workflow response."""

        if self.fail:
            return {
                "success": False,
                "workflow": "run_insight_context",
                "steps": [],
                "data": {},
                "error": {"type": "WorkflowStepError", "message": "Failed."},
            }

        return {
            "success": True,
            "workflow": "run_insight_context",
            "steps": [],
            "data": {"insight_context": {"business_id": business_id, "limit": limit}},
            "error": None,
        }

    def run_create_insight(
        self,
        business_id: str,
        insight_data: Mapping[str, Any],
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return create insight workflow response."""

        return {
            "success": True,
            "workflow": "run_create_insight",
            "steps": [],
            "data": {"insight": {"business_id": business_id, **dict(insight_data)}},
            "error": None,
        }

    def run_insight_review(
        self,
        business_id: str,
        insight_category: str | None = None,
        keyword: str | None = None,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Return insight review workflow response."""

        return {
            "success": True,
            "workflow": "run_insight_review",
            "steps": [],
            "data": {"insights": [], "keyword": keyword, "limit": limit},
            "error": None,
        }


def test_insight_agent_builds_context_successfully() -> None:
    """Assert InsightAgent builds insight context."""

    agent = InsightAgent(FakeInsightWorkflow())  # type: ignore[arg-type]
    response = agent.build_insight_context("business-1", limit=10)

    assert response["success"] is True
    assert response["agent"] == "InsightAgent"
    assert response["data"]["insight_context"]["business_id"] == "business-1"
    assert response["data"]["insight_context"]["limit"] == 10


def test_insight_agent_returns_failure_when_workflow_fails() -> None:
    """Assert InsightAgent returns failure when workflow fails."""

    agent = InsightAgent(FakeInsightWorkflow(fail=True))  # type: ignore[arg-type]
    response = agent.build_insight_context("business-1")

    assert response["success"] is False
    assert response["error"]["type"] == "WorkflowStepError"


def test_insight_agent_creates_insight_successfully() -> None:
    """Assert InsightAgent creates insight."""

    agent = InsightAgent(FakeInsightWorkflow())  # type: ignore[arg-type]
    response = agent.create_insight(
        business_id="business-1",
        insight_data={"title": "Insight"},
    )

    assert response["success"] is True
    assert response["intent"] == "create_insight"
    assert response["data"]["insight"]["title"] == "Insight"


def test_insight_agent_rejects_invalid_payload() -> None:
    """Assert InsightAgent rejects invalid payload."""

    agent = InsightAgent(FakeInsightWorkflow())  # type: ignore[arg-type]
    response = agent.handle_insight("invalid")  # type: ignore[arg-type]

    assert response["success"] is False
    assert response["error"]["type"] == "ValueError"
