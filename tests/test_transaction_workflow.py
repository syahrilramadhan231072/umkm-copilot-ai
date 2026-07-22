"""
Transaction Workflow Tests
==========================

Pytest test suite for TransactionWorkflow.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.workflows.transaction_workflow import TransactionWorkflow


class FakeTransactionTools:
    """Fake transaction tools for workflow tests."""

    def __init__(self, fail_create: bool = False) -> None:
        """Initialize fake transaction tools."""

        self.fail_create = fail_create

    def create_transaction(
        self,
        business_id: str,
        product_id: str,
        quantity: int,
        payment_method: str = "cash",
        status: str = "completed",
        notes: str | None = None,
        transaction_date: str | None = None,
    ) -> dict[str, Any]:
        """Return create transaction response."""

        if self.fail_create:
            return {
                "success": False,
                "tool": "create_transaction",
                "data": None,
                "error": {"type": "RuntimeError", "message": "Create failed."},
            }

        return {
            "success": True,
            "tool": "create_transaction",
            "data": {
                "id": "transaction-1",
                "business_id": business_id,
                "product_id": product_id,
                "quantity": quantity,
            },
            "error": None,
        }

    def record_transaction(
        self,
        transaction_data: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Return record transaction response."""

        return {
            "success": True,
            "tool": "record_transaction",
            "data": {"id": "transaction-1", **dict(transaction_data)},
            "error": None,
        }


class FakeAnalyticsTools:
    """Fake analytics tools for workflow tests."""

    def get_sales_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Return sales summary response."""

        return {
            "success": True,
            "tool": "get_sales_summary",
            "data": {"business_id": business_id, "total_revenue": 100000},
            "error": None,
        }

    def get_inventory_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Return inventory summary response."""

        return {
            "success": True,
            "tool": "get_inventory_summary",
            "data": {"business_id": business_id, "low_stock_count": 1},
            "error": None,
        }

    def get_top_products_by_revenue(
        self,
        business_id: str,
        top_n: int = 5,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Return top products response."""

        return {
            "success": True,
            "tool": "get_top_products_by_revenue",
            "data": [{"key": "Coffee", "value": 100000}],
            "error": None,
        }


class FakeConversationTools:
    """Fake conversation tools for workflow tests."""

    def __init__(self, fail: bool = False) -> None:
        """Initialize fake conversation tools."""

        self.fail = fail

    def save_message(
        self,
        business_id: str,
        session_id: str,
        role: str,
        message: str,
        agent: str | None = None,
    ) -> dict[str, Any]:
        """Return save message response."""

        if self.fail:
            return {
                "success": False,
                "tool": "save_message",
                "data": None,
                "error": {"type": "RuntimeError", "message": "Save failed."},
            }

        return {
            "success": True,
            "tool": "save_message",
            "data": {"business_id": business_id, "session_id": session_id},
            "error": None,
        }


def test_transaction_workflow_records_transaction_successfully() -> None:
    """Assert transaction workflow succeeds."""

    workflow = TransactionWorkflow(
        transaction_tools=FakeTransactionTools(),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_record_transaction(
        business_id="business-1",
        product_id="product-1",
        quantity=2,
    )

    assert response["success"] is True
    assert response["workflow"] == "run_record_transaction"
    assert response["data"]["transaction"]["quantity"] == 2
    assert len(response["steps"]) == 3


def test_transaction_workflow_stops_on_create_failure() -> None:
    """Assert transaction workflow stops when create transaction fails."""

    workflow = TransactionWorkflow(
        transaction_tools=FakeTransactionTools(fail_create=True),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_record_transaction(
        business_id="business-1",
        product_id="product-1",
        quantity=2,
    )

    assert response["success"] is False
    assert response["error"]["step"] == "create_transaction"


def test_transaction_workflow_records_optional_warning() -> None:
    """Assert optional conversation failure becomes warning."""

    workflow = TransactionWorkflow(
        transaction_tools=FakeTransactionTools(),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
        conversation_tools=FakeConversationTools(fail=True),  # type: ignore[arg-type]
    )

    response = workflow.run_record_transaction(
        business_id="business-1",
        product_id="product-1",
        quantity=2,
        session_id="session-1",
    )

    assert response["success"] is True
    assert response["data"]["warnings"][0]["step"] == "save_workflow_message"


def test_transaction_workflow_rejects_invalid_quantity() -> None:
    """Assert invalid quantity fails workflow."""

    workflow = TransactionWorkflow(
        transaction_tools=FakeTransactionTools(),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_record_transaction(
        business_id="business-1",
        product_id="product-1",
        quantity=0,
    )

    assert response["success"] is False
    assert response["error"]["type"] == "ValueError"
