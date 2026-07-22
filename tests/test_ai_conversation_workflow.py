"""Tests for AIConversationWorkflow."""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.workflows.ai_conversation_workflow import AIConversationWorkflow


class FakeAIGenerationService:
    def generate_conversation_response(
        self,
        *,
        user_input: str,
        business_context: Mapping[str, Any] | None = None,
        conversation_history: list[Mapping[str, Any]] | None = None,
        temperature: float = 0.3,
        max_output_tokens: int = 1024,
    ) -> dict[str, Any]:
        return {
            "success": True,
            "data": {
                "answer": f"Answer for {user_input}",
                "provider": "gemini",
                "model": "fake",
            },
            "error": None,
        }


class FakeAnalyticsTools:
    def build_dashboard_payload(self, business_id: str, limit: int = 1000) -> dict[str, Any]:
        return {
            "success": True,
            "data": {"sales_summary": {"total_revenue": 100}},
            "error": None,
        }


class FakeConversationTools:
    def build_session_history(
        self,
        business_id: str,
        session_id: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        return {"success": True, "data": [], "error": None}

    def save_message(
        self,
        business_id: str,
        session_id: str,
        role: str,
        message: str,
        agent: str | None = None,
    ) -> dict[str, Any]:
        return {"success": True, "data": {"message": message}, "error": None}


def test_ai_conversation_workflow_returns_answer() -> None:
    workflow = AIConversationWorkflow(
        ai_generation_service=FakeAIGenerationService(),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
        conversation_tools=FakeConversationTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_ai_conversation(
        user_input="What is SWOT?",
        business_id="business-1",
        session_id="session-1",
    )

    assert response["success"] is True
    assert response["data"]["answer"] == "Answer for What is SWOT?"
    assert response["data"]["provider"] == "gemini"
