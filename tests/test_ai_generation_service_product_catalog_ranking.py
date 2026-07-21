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


def _context() -> dict[str, object]:
    return {
        "dashboard": {
            "top_products_by_revenue": [
                {"key": "Chicken Sandwich Promo", "value": 2214000},
                {"key": "Croissant Special", "value": 1877500},
            ],
            "top_products_by_quantity": [
                {"key": "Americano Large", "value": 64},
                {"key": "Donut Special", "value": 58},
            ],
        },
        "products": [
            {"name": "Brownies Hot", "selling_price": 28000, "stock": 52, "sku": "DCF-0033"},
            {"name": "Brownies Promo", "selling_price": 28000, "stock": 23, "sku": "DCF-0009"},
        ],
    }


def test_product_catalog_query_uses_active_products_not_ranked_analytics() -> None:
    response = _service().generate_conversation_response(
        user_input="produk apa yang dijual?",
        business_context=_context(),
        conversation_history=[],
    )

    assert response["success"] is True
    answer = response["data"]["answer"]
    assert "Brownies Hot" in answer
    assert "Brownies Promo" in answer
    assert "Chicken Sandwich Promo" not in answer
    assert "Americano Large" not in answer


def test_best_selling_query_uses_quantity_ranking_without_provider() -> None:
    response = _service().generate_conversation_response(
        user_input="yang paling laku",
        business_context=_context(),
        conversation_history=[],
    )

    assert response["success"] is True
    answer = response["data"]["answer"]
    assert "Americano Large" in answer
    assert "terjual 64 unit" in answer
    assert "Chicken Sandwich Promo" not in answer


def test_revenue_ranking_query_uses_revenue_ranking_without_provider() -> None:
    response = _service().generate_conversation_response(
        user_input="produk dengan omzet tertinggi",
        business_context=_context(),
        conversation_history=[],
    )

    assert response["success"] is True
    answer = response["data"]["answer"]
    assert "Chicken Sandwich Promo" in answer
    assert "omzet Rp2.214.000" in answer
