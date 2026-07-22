"""Tests for RouterAgent AI conversation routing."""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.agents.router_agent import RouterAgent


class FakeDomainAgent:
    def handle_transaction(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "record_transaction",
    ) -> dict[str, Any]:
        return {"success": True, "workflow": {}, "data": {}, "error": None}

    def handle_marketing(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "marketing_context",
    ) -> dict[str, Any]:
        return {"success": True, "workflow": {}, "data": {}, "error": None}

    def handle_insight(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "insight_context",
    ) -> dict[str, Any]:
        return {"success": True, "workflow": {}, "data": {}, "error": None}

    def handle_export(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "export_dashboard",
    ) -> dict[str, Any]:
        return {"success": True, "workflow": {}, "data": {}, "error": None}


class FakeBusinessWorkflow:
    def run_business_overview(
        self,
        business_id: str,
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        return {"success": True, "workflow": "business", "data": {}, "error": None}

    def run_business_health_check(
        self,
        business_id: str,
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        return {"success": True, "workflow": "business", "data": {}, "error": None}


class FakeAIConversationWorkflow:
    def run_ai_conversation(
        self,
        *,
        user_input: str,
        business_id: str | None = None,
        session_id: str | None = None,
        business_profile: Mapping[str, Any] | None = None,
        limit: int = 1000,
    ) -> dict[str, Any]:
        return {
            "success": True,
            "workflow": "run_ai_conversation",
            "data": {"answer": f"LLM: {user_input}"},
            "error": None,
        }


def test_router_agent_routes_general_question_to_ai_conversation() -> None:
    router = RouterAgent(
        transaction_agent=FakeDomainAgent(),  # type: ignore[arg-type]
        marketing_agent=FakeDomainAgent(),  # type: ignore[arg-type]
        insight_agent=FakeDomainAgent(),  # type: ignore[arg-type]
        export_agent=FakeDomainAgent(),  # type: ignore[arg-type]
        business_workflow=FakeBusinessWorkflow(),  # type: ignore[arg-type]
        ai_conversation_workflow=FakeAIConversationWorkflow(),  # type: ignore[arg-type]
    )

    response = router.route(
        user_input="Apa itu break even point?",
        payload={"business_id": "business-1"},
    )

    assert response["success"] is True
    assert response["data"]["route"] == "conversation"
    assert response["data"]["route_response"]["data"]["answer"] == "LLM: Apa itu break even point?"
