"""Tests for RouterAgent business intelligence query routing."""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.agents.router_agent import RouterAgent


class FakeDomainAgent:
    """Fake domain agent."""

    def handle_transaction(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "record_transaction",
    ) -> dict[str, Any]:
        """Return transaction response."""

        return {"success": True, "workflow": {}, "data": {}, "error": None}

    def handle_marketing(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "marketing_context",
    ) -> dict[str, Any]:
        """Return marketing response."""

        return {"success": True, "workflow": {}, "data": {}, "error": None}

    def handle_insight(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "insight_context",
    ) -> dict[str, Any]:
        """Return insight response."""

        return {"success": True, "workflow": {}, "data": {}, "error": None}

    def handle_export(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "export_dashboard",
    ) -> dict[str, Any]:
        """Return export response."""

        return {"success": True, "workflow": {}, "data": {}, "error": None}


class FakeBusinessWorkflow:
    """Fake business workflow."""

    def run_business_overview(
        self,
        business_id: str,
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return business overview."""

        return {"success": True, "workflow": "business", "data": {}, "error": None}

    def run_business_health_check(
        self,
        business_id: str,
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return business health."""

        return {"success": True, "workflow": "business", "data": {}, "error": None}


class FakeAIConversationWorkflow:
    """Fake AI conversation workflow."""

    def run_ai_conversation(
        self,
        *,
        user_input: str,
        business_id: str | None = None,
        session_id: str | None = None,
        business_profile: Mapping[str, Any] | None = None,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Return AI conversation response."""

        return {
            "success": True,
            "workflow": "run_ai_conversation",
            "data": {"answer": user_input},
            "error": None,
        }


def _build_router() -> RouterAgent:
    """Build router with fake dependencies."""

    return RouterAgent(
        transaction_agent=FakeDomainAgent(),  # type: ignore[arg-type]
        marketing_agent=FakeDomainAgent(),  # type: ignore[arg-type]
        insight_agent=FakeDomainAgent(),  # type: ignore[arg-type]
        export_agent=FakeDomainAgent(),  # type: ignore[arg-type]
        business_workflow=FakeBusinessWorkflow(),  # type: ignore[arg-type]
        ai_conversation_workflow=FakeAIConversationWorkflow(),  # type: ignore[arg-type]
    )


def test_product_sold_question_routes_to_conversation() -> None:
    """Assert product sales questions do not route to transaction creation."""

    router = _build_router()

    assert router.classify_intent("produk apa yang terjual") == "conversation"


def test_business_data_reading_prompt_routes_to_conversation() -> None:
    """Assert broad BI prompts do not route to transaction creation."""

    router = _build_router()

    assert (
        router.classify_intent(
            "bantu saya membaca data produk, transaksi, stok, margin, dan alert"
        )
        == "conversation"
    )


def test_record_transaction_prompt_still_routes_to_transaction() -> None:
    """Assert real transaction creation still routes to transaction agent."""

    router = _build_router()

    assert router.classify_intent("catat transaksi penjualan") == "transaction"
