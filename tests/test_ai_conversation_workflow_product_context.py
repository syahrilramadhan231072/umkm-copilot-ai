from __future__ import annotations

from typing import Any, Mapping

from app.workflows.ai_conversation_workflow import AIConversationWorkflow


class CapturingAIGenerationService:
    def __init__(self) -> None:
        self.business_context: Mapping[str, Any] | None = None

    def generate_conversation_response(
        self,
        *,
        user_input: str,
        business_context: Mapping[str, Any] | None = None,
        conversation_history: list[Mapping[str, Any]] | None = None,
        temperature: float = 0.3,
        max_output_tokens: int = 1024,
    ) -> dict[str, Any]:
        self.business_context = business_context
        return {
            "success": True,
            "data": {
                "answer": "Produk: Americano dan Latte",
                "provider": "local-context",
                "model": "deterministic-fallback",
            },
            "error": None,
        }


class FakeAnalyticsTools:
    def build_dashboard_payload(self, business_id: str, limit: int = 1000) -> dict[str, Any]:
        return {
            "success": True,
            "data": {"kpi_cards": [{"label": "Total Revenue", "value": 0}]},
            "error": None,
        }


class FakeConversationTools:
    def build_session_history(self, business_id: str, session_id: str, limit: int = 100) -> dict[str, Any]:
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


class FakeProductTools:
    def list_active_products(self, business_id: str, limit: int = 100) -> dict[str, Any]:
        return {
            "success": True,
            "data": [
                {
                    "id": "p1",
                    "business_id": business_id,
                    "name": "Americano",
                    "selling_price": 18000,
                    "stock": 20,
                    "is_active": True,
                },
                {
                    "id": "p2",
                    "business_id": business_id,
                    "name": "Latte",
                    "selling_price": 22000,
                    "stock": 15,
                    "is_active": True,
                },
            ],
            "error": None,
        }


def test_ai_conversation_workflow_adds_active_products_to_context() -> None:
    ai_service = CapturingAIGenerationService()
    workflow = AIConversationWorkflow(
        ai_generation_service=ai_service,  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
        conversation_tools=FakeConversationTools(),  # type: ignore[arg-type]
        product_tools=FakeProductTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_ai_conversation(
        user_input="produk apa saja yang dijual?",
        business_id="business-1",
        session_id="session-1",
    )

    assert response["success"] is True
    assert ai_service.business_context is not None
    products = ai_service.business_context["products"]
    assert products[0]["name"] == "Americano"
    assert products[1]["name"] == "Latte"
