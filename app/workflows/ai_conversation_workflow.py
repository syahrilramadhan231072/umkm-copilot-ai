"""
AI Conversation Workflow
========================

Workflow for Gemini-backed AI conversation.

The workflow may collect business context from tools, then delegates natural
language generation to AIGenerationService. It never calls Gemini directly.
"""

from __future__ import annotations

from typing import Any, Mapping

from app.services.ai_generation_service import AIGenerationService
from app.tools.analytics_tools import AnalyticsTools
from app.tools.conversation_tools import ConversationTools
from app.tools.product_tools import ProductTools
from app.utils.logger import logger


class AIConversationWorkflow:
    """Workflow for conversational AI responses."""

    def __init__(
        self,
        ai_generation_service: AIGenerationService,
        analytics_tools: AnalyticsTools,
        conversation_tools: ConversationTools,
        product_tools: ProductTools | None = None,
    ) -> None:
        """Initialize workflow."""

        self._ai_generation_service = ai_generation_service
        self._analytics_tools = analytics_tools
        self._conversation_tools = conversation_tools
        self._product_tools = product_tools
        self._logger = logger

    def run_ai_conversation(
        self,
        *,
        user_input: str,
        business_id: str | None = None,
        session_id: str | None = None,
        business_profile: Mapping[str, Any] | None = None,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """
        Generate AI response for user input.

        Args:
            user_input: User prompt.
            business_id: Optional active business id.
            session_id: Optional conversation session id.
            business_profile: Optional frontend business profile context.
            limit: Dashboard context limit.

        Returns:
            Workflow response.
        """

        workflow_name = "run_ai_conversation"
        steps: list[dict[str, Any]] = []

        try:
            context = self._build_business_context(
                business_id=business_id,
                business_profile=business_profile,
                limit=limit,
                steps=steps,
            )
            history = self._build_history(
                business_id=business_id,
                session_id=session_id,
                steps=steps,
            )

            generation_response = self._ai_generation_service.generate_conversation_response(
                user_input=user_input,
                business_context=context,
                conversation_history=history,
            )
            steps.append(
                {
                    "name": "generate_gemini_answer",
                    "success": bool(generation_response.get("success")),
                    "service": "AIGenerationService",
                }
            )

            if not generation_response.get("success"):
                return self._failure(
                    workflow_name,
                    steps,
                    generation_response.get("error"),
                )

            data = generation_response.get("data")
            if not isinstance(data, Mapping):
                raise ValueError("AI generation data is invalid.")

            answer = str(data.get("answer") or data.get("text") or "").strip()
            self._save_assistant_message(
                business_id=business_id,
                session_id=session_id,
                answer=answer,
                steps=steps,
            )

            return {
                "success": True,
                "workflow": workflow_name,
                "steps": steps,
                "data": {
                    "answer": answer,
                    "text": answer,
                    "provider": data.get("provider"),
                    "model": data.get("model"),
                    "business_context_used": bool(context),
                },
                "error": None,
            }

        except Exception as exc:
            self._logger.exception("AI conversation workflow failed.")
            return self._failure(
                workflow_name,
                steps,
                {"type": exc.__class__.__name__, "message": str(exc)},
            )

    def _build_business_context(
        self,
        *,
        business_id: str | None,
        business_profile: Mapping[str, Any] | None,
        limit: int,
        steps: list[dict[str, Any]],
    ) -> dict[str, Any]:
        """Build optional business context."""

        context: dict[str, Any] = {}

        if business_profile:
            context["business_profile"] = dict(business_profile)

        if not business_id:
            return context

        dashboard_response = self._analytics_tools.build_dashboard_payload(
            business_id=business_id,
            limit=limit,
        )
        steps.append(
            {
                "name": "build_dashboard_context",
                "success": bool(dashboard_response.get("success")),
                "tool": "build_dashboard_payload",
            }
        )

        if dashboard_response.get("success"):
            dashboard_data = dashboard_response.get("data")
            if isinstance(dashboard_data, Mapping):
                context["dashboard"] = self._compact_dashboard_context(dashboard_data)

        product_context = self._build_product_context(
            business_id=business_id,
            limit=limit,
            steps=steps,
        )
        if product_context:
            context["products"] = product_context

        return context

    def _build_product_context(
        self,
        *,
        business_id: str,
        limit: int,
        steps: list[dict[str, Any]],
    ) -> list[dict[str, Any]]:
        """Build active product context using ProductTools when available."""

        if self._product_tools is None:
            return []

        safe_limit = min(max(limit, 1), 100)
        product_response = self._product_tools.list_active_products(
            business_id=business_id,
            limit=safe_limit,
        )
        steps.append(
            {
                "name": "build_active_product_context",
                "success": bool(product_response.get("success")),
                "tool": "list_active_products",
            }
        )

        if not product_response.get("success"):
            return []

        product_data = product_response.get("data")
        if not isinstance(product_data, list):
            return []

        return self._compact_products(product_data)

    def _compact_products(
        self,
        products: list[Any],
    ) -> list[dict[str, Any]]:
        """Keep only useful product fields for prompt/local context."""

        allowed_keys = (
            "id",
            "name",
            "category",
            "selling_price",
            "cost_price",
            "stock",
            "minimum_stock",
            "unit",
            "sku",
            "barcode",
            "is_active",
        )
        compacted: list[dict[str, Any]] = []

        for product in products:
            if not isinstance(product, Mapping):
                continue

            compacted.append(
                {
                    key: product.get(key)
                    for key in allowed_keys
                    if key in product
                }
            )

        return compacted

    def _build_history(
        self,
        *,
        business_id: str | None,
        session_id: str | None,
        steps: list[dict[str, Any]],
    ) -> list[Mapping[str, Any]]:
        """Build optional conversation history."""

        if not business_id or not session_id:
            return []

        history_response = self._conversation_tools.build_session_history(
            business_id=business_id,
            session_id=session_id,
            limit=12,
        )
        steps.append(
            {
                "name": "build_session_history",
                "success": bool(history_response.get("success")),
                "tool": "build_session_history",
            }
        )

        if not history_response.get("success"):
            return []

        data = history_response.get("data")
        if isinstance(data, list):
            return [item for item in data if isinstance(item, Mapping)]
        if isinstance(data, Mapping):
            history = data.get("history") or data.get("messages") or data.get("items")
            if isinstance(history, list):
                return [item for item in history if isinstance(item, Mapping)]

        return []

    def _save_assistant_message(
        self,
        *,
        business_id: str | None,
        session_id: str | None,
        answer: str,
        steps: list[dict[str, Any]],
    ) -> None:
        """Save assistant answer when context identifiers are available."""

        if not business_id or not session_id or not answer:
            return

        save_response = self._conversation_tools.save_message(
            business_id=business_id,
            session_id=session_id,
            role="assistant",
            message=answer,
            agent="AIConversationWorkflow",
        )
        steps.append(
            {
                "name": "save_assistant_message",
                "success": bool(save_response.get("success")),
                "tool": "save_message",
            }
        )

    def _compact_dashboard_context(
        self,
        dashboard_data: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Keep only useful dashboard sections for prompt context."""

        allowed_keys = (
            "business_id",
            "kpi_cards",
            "sales_summary",
            "inventory_summary",
            "product_summary",
            "customer_summary",
            "alerts",
            "top_products_by_revenue",
            "top_products_by_quantity",
        )

        return {
            key: dashboard_data.get(key)
            for key in allowed_keys
            if key in dashboard_data
        }

    def _failure(
        self,
        workflow_name: str,
        steps: list[dict[str, Any]],
        error: Any,
    ) -> dict[str, Any]:
        """Build failure response."""

        if isinstance(error, Mapping):
            error_payload = dict(error)
        else:
            error_payload = {
                "type": "AIConversationError",
                "message": str(error or "AI conversation failed."),
            }

        return {
            "success": False,
            "workflow": workflow_name,
            "steps": steps,
            "data": {},
            "error": error_payload,
        }
