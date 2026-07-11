"""
Router Agent Tests
==================

Pytest test suite for RouterAgent.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.agents.router_agent import RouterAgent


class FakeDomainAgent:
    """Fake domain agent for router tests."""

    def __init__(self, domain: str, fail: bool = False) -> None:
        """Initialize fake domain agent."""

        self.domain = domain
        self.fail = fail

    def handle_transaction(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "record_transaction",
    ) -> dict[str, Any]:
        """Return transaction agent response."""

        return self._response(intent)

    def handle_marketing(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "marketing_context",
    ) -> dict[str, Any]:
        """Return marketing agent response."""

        return self._response(intent)

    def handle_insight(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "insight_context",
    ) -> dict[str, Any]:
        """Return insight agent response."""

        return self._response(intent)

    def handle_export(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "export_dashboard",
    ) -> dict[str, Any]:
        """Return export agent response."""

        return self._response(intent)

    def _response(self, intent: str) -> dict[str, Any]:
        """Build fake agent response."""

        if self.fail:
            return {
                "success": False,
                "agent": self.domain,
                "intent": intent,
                "workflow": {
                    "success": False,
                    "workflow": f"{self.domain}_workflow",
                },
                "data": {},
                "error": {"type": "WorkflowStepError", "message": "Failed."},
            }

        return {
            "success": True,
            "agent": self.domain,
            "intent": intent,
            "workflow": {
                "success": True,
                "workflow": f"{self.domain}_workflow",
            },
            "data": {"domain": self.domain, "intent": intent},
            "error": None,
        }


class FakeBusinessWorkflow:
    """Fake business workflow for router tests."""

    def run_business_overview(
        self,
        business_id: str,
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return business overview workflow response."""

        return {
            "success": True,
            "workflow": "run_business_overview",
            "steps": [],
            "data": {"business_id": business_id, "limit": limit},
            "error": None,
        }

    def run_business_health_check(
        self,
        business_id: str,
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return business health workflow response."""

        return {
            "success": True,
            "workflow": "run_business_health_check",
            "steps": [],
            "data": {"business_id": business_id, "health": "ok"},
            "error": None,
        }


class FakeConversationMemory:
    """Fake conversation memory for router tests."""

    def __init__(self) -> None:
        """Initialize fake memory."""

        self.saved: list[dict[str, Any]] = []

    def save_user_message(
        self,
        business_id: str,
        session_id: str,
        message: str,
        agent: str | None = None,
    ) -> dict[str, Any]:
        """Save fake user message."""

        record = {
            "business_id": business_id,
            "session_id": session_id,
            "message": message,
            "agent": agent,
        }
        self.saved.append(record)

        return record


def _build_router(
    *,
    transaction_fail: bool = False,
    memory: FakeConversationMemory | None = None,
) -> RouterAgent:
    """Build RouterAgent with fake dependencies."""

    return RouterAgent(
        transaction_agent=FakeDomainAgent("transaction", fail=transaction_fail),  # type: ignore[arg-type]
        marketing_agent=FakeDomainAgent("marketing"),  # type: ignore[arg-type]
        insight_agent=FakeDomainAgent("insight"),  # type: ignore[arg-type]
        export_agent=FakeDomainAgent("export"),  # type: ignore[arg-type]
        business_workflow=FakeBusinessWorkflow(),  # type: ignore[arg-type]
        conversation_memory=memory,  # type: ignore[arg-type]
    )


def test_router_agent_classifies_transaction_intent() -> None:
    """Assert RouterAgent classifies transaction intent."""

    router = _build_router()

    assert router.classify_intent("catat transaksi penjualan") == "transaction"


def test_router_agent_routes_to_marketing_agent() -> None:
    """Assert RouterAgent routes marketing request."""

    router = _build_router()
    response = router.route(
        user_input="buat caption promosi",
        payload={"business_id": "business-1", "product_id": "product-1"},
    )

    assert response["success"] is True
    assert response["data"]["route"] == "marketing"
    assert response["data"]["route_response"]["agent"] == "marketing"


def test_router_agent_routes_to_business_workflow() -> None:
    """Assert RouterAgent routes business dashboard request."""

    router = _build_router()
    response = router.route(
        user_input="lihat dashboard bisnis",
        payload={"business_id": "business-1", "business_intent": "business_overview"},
    )

    assert response["success"] is True
    assert response["data"]["route"] == "business"
    assert response["workflow"]["workflow"] == "run_business_overview"


def test_router_agent_returns_failure_when_domain_fails() -> None:
    """Assert RouterAgent returns failure when selected domain fails."""

    router = _build_router(transaction_fail=True)
    response = router.route(
        user_input="catat transaksi",
        payload={"business_id": "business-1", "product_id": "product-1"},
    )

    assert response["success"] is False
    assert response["data"]["route"] == "transaction"
    assert response["error"]["type"] == "WorkflowStepError"


def test_router_agent_saves_optional_user_message() -> None:
    """Assert RouterAgent saves optional user message."""

    memory = FakeConversationMemory()
    router = _build_router(memory=memory)

    response = router.route(
        user_input="lihat dashboard bisnis",
        payload={
            "business_id": "business-1",
            "session_id": "session-1",
            "business_intent": "business_overview",
        },
    )

    assert response["success"] is True
    assert len(memory.saved) == 1
    assert memory.saved[0]["agent"] == "RouterAgent"


def test_router_agent_rejects_empty_input() -> None:
    """Assert RouterAgent rejects empty user input."""

    router = _build_router()
    response = router.route(
        user_input="",
        payload={"business_id": "business-1"},
    )

    assert response["success"] is False
    assert response["error"]["type"] == "ValueError"
