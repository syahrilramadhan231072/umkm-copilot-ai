from __future__ import annotations

from app.llm.prompt_builder import PromptBuilder
from app.llm.response_formatter import ResponseFormatter
from app.services.ai_generation_service import AIGenerationService


class FailingProviderManager:
    def generate_text(self, prompt: str, **kwargs):
        return {
            "success": False,
            "provider": None,
            "model": None,
            "text": "",
            "raw": None,
            "error": {
                "type": "AIServiceUnavailable",
                "message": "The AI service is temporarily unavailable. Please try again shortly.",
            },
        }

    def health_snapshot(self):
        return []


def _service() -> AIGenerationService:
    return AIGenerationService(
        prompt_builder=PromptBuilder(),
        response_formatter=ResponseFormatter(),
        provider_manager=FailingProviderManager(),
    )


def test_product_query_does_not_treat_dashboard_kpi_cards_as_products() -> None:
    response = _service().generate_conversation_response(
        user_input="produk apa saja yang dijual?",
        business_context={
            "dashboard": {
                "kpi_cards": [
                    {"key": "total_revenue", "label": "Total Revenue", "value": 0},
                    {
                        "key": "transaction_count",
                        "label": "Completed Transactions",
                        "value": 0,
                    },
                    {"key": "active_products", "label": "Active Products", "value": 0},
                    {"key": "low_stock_count", "label": "Low Stock Items", "value": 0},
                ]
            }
        },
        conversation_history=[],
    )

    assert response["success"] is True
    assert "Total Revenue" not in response["data"]["answer"]
    assert "Completed Transactions" not in response["data"]["answer"]
    assert "belum menemukan daftar produk" in response["data"]["answer"]


def test_product_query_reads_explicit_active_product_context() -> None:
    response = _service().generate_conversation_response(
        user_input="produk apa saja yang dijual?",
        business_context={
            "products": [
                {
                    "name": "Americano",
                    "category": "Coffee",
                    "selling_price": 18000,
                    "stock": 20,
                    "sku": "AMR-001",
                },
                {
                    "name": "Latte",
                    "category": "Coffee",
                    "selling_price": 22000,
                    "stock": 15,
                },
            ]
        },
        conversation_history=[],
    )

    assert response["success"] is True
    assert "Americano" in response["data"]["answer"]
    assert "Latte" in response["data"]["answer"]
    assert "Total Revenue" not in response["data"]["answer"]
