from __future__ import annotations

from typing import Any, Mapping

from app.workflows.ai_conversation_workflow import AIConversationWorkflow


class CapturingAIGenerationService:
    def __init__(self) -> None:
        self.context: Mapping[str, Any] | None = None

    def generate_conversation_response(
        self,
        *,
        user_input: str,
        business_context: Mapping[str, Any] | None = None,
        conversation_history: list[Mapping[str, Any]] | None = None,
        temperature: float = 0.3,
        max_output_tokens: int = 1024,
    ) -> dict[str, Any]:
        self.context = business_context
        return {
            "success": True,
            "data": {"answer": "ok", "provider": "local-context", "model": "fake"},
            "error": None,
        }


class FakeAnalyticsTools:
    def build_dashboard_payload(self, business_id: str, limit: int = 1000) -> dict[str, Any]:
        return {
            "success": True,
            "data": {
                "top_products_by_quantity": [{"key": "Americano Large", "value": 64}],
                "top_products_by_revenue": [{"key": "Chicken Sandwich Promo", "value": 2214000}],
            },
            "error": None,
        }


class FakeProductTools:
    def list_active_products(self, business_id: str, limit: int = 100) -> dict[str, Any]:
        return {
            "success": True,
            "data": [
                {
                    "id": "p1",
                    "name": "Brownies Hot",
                    "selling_price": 28000,
                    "stock": 52,
                    "sku": "DCF-0033",
                }
            ],
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


def test_ai_conversation_workflow_adds_active_products_and_ranked_dashboard_context() -> None:
    ai_service = CapturingAIGenerationService()
    workflow = AIConversationWorkflow(
        ai_generation_service=ai_service,  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
        conversation_tools=FakeConversationTools(),  # type: ignore[arg-type]
        product_tools=FakeProductTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_ai_conversation(
        user_input="produk apa yang dijual?",
        business_id="business-1",
        session_id="session-1",
    )

    assert response["success"] is True
    assert ai_service.context is not None
    assert ai_service.context["products"][0]["name"] == "Brownies Hot"
    assert ai_service.context["dashboard"]["top_products_by_quantity"][0]["key"] == "Americano Large"
