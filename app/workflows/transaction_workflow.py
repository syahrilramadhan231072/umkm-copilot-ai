"""
Transaction Workflow
====================

Workflow orchestration for transaction use cases.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.tools.analytics_tools import AnalyticsTools
from app.tools.conversation_tools import ConversationTools
from app.tools.transaction_tools import TransactionTools
from app.utils.logger import logger


class TransactionWorkflow:
    """
    Workflow for transaction use cases.

    TransactionWorkflow orchestrates TransactionTools, AnalyticsTools, and
    optional ConversationTools. It does not access repositories, services,
    databases, prompts, LLM clients, or UI components directly.
    """

    def __init__(
        self,
        transaction_tools: TransactionTools,
        analytics_tools: AnalyticsTools,
        conversation_tools: ConversationTools | None = None,
    ) -> None:
        """Initialize transaction workflow."""

        self._transaction_tools = transaction_tools
        self._analytics_tools = analytics_tools
        self._conversation_tools = conversation_tools
        self._logger = logger

    def run_record_transaction(
        self,
        business_id: str,
        product_id: str,
        quantity: int,
        payment_method: str = "cash",
        status: str = "completed",
        notes: str | None = None,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Run transaction recording workflow.

        Args:
            business_id: Business identifier.
            product_id: Product identifier.
            quantity: Quantity sold.
            payment_method: Payment method.
            status: Transaction status.
            notes: Optional transaction notes.
            session_id: Optional conversation session identifier.

        Returns:
            Workflow response.
        """

        workflow_name = "run_record_transaction"
        steps: list[dict[str, Any]] = []
        data: dict[str, Any] = {
            "business_id": business_id,
            "warnings": [],
        }

        try:
            self._validate_text(business_id, field_name="business_id")
            self._validate_text(product_id, field_name="product_id")
            self._validate_positive_int(quantity, field_name="quantity")

            transaction_response = self._transaction_tools.create_transaction(
                business_id=business_id,
                product_id=product_id,
                quantity=quantity,
                payment_method=payment_method,
                status=status,
                notes=notes,
            )
            self._record_step(
                steps,
                name="create_transaction",
                response=transaction_response,
            )
            if not transaction_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "create_transaction",
                    transaction_response,
                )
            data["transaction"] = transaction_response["data"]

            summary_response = self._analytics_tools.get_sales_summary(
                business_id=business_id,
            )
            self._record_step(
                steps,
                name="get_sales_summary",
                response=summary_response,
            )
            if not summary_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "get_sales_summary",
                    summary_response,
                )
            data["sales_summary"] = summary_response["data"]

            inventory_response = self._analytics_tools.get_inventory_summary(
                business_id=business_id,
            )
            self._record_step(
                steps,
                name="get_inventory_summary",
                response=inventory_response,
            )
            if not inventory_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "get_inventory_summary",
                    inventory_response,
                )
            data["inventory_summary"] = inventory_response["data"]

            self._save_optional_message(
                steps=steps,
                data=data,
                business_id=business_id,
                session_id=session_id,
                message="Transaction workflow completed.",
            )

            return self._success(workflow_name, steps, data)

        except Exception as exc:
            return self._failure_from_exception(
                workflow_name,
                steps,
                data,
                exc,
            )

    def run_transaction_summary_refresh(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """
        Refresh transaction-related summaries.

        Args:
            business_id: Business identifier.
            limit: Maximum number of records read.

        Returns:
            Workflow response.
        """

        workflow_name = "run_transaction_summary_refresh"
        steps: list[dict[str, Any]] = []
        data: dict[str, Any] = {
            "business_id": business_id,
            "warnings": [],
        }

        try:
            self._validate_text(business_id, field_name="business_id")
            self._validate_positive_int(limit, field_name="limit")

            sales_response = self._analytics_tools.get_sales_summary(
                business_id=business_id,
                limit=limit,
            )
            self._record_step(
                steps,
                name="get_sales_summary",
                response=sales_response,
            )
            if not sales_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "get_sales_summary",
                    sales_response,
                )
            data["sales_summary"] = sales_response["data"]

            top_products_response = self._analytics_tools.get_top_products_by_revenue(
                business_id=business_id,
                top_n=5,
                limit=limit,
            )
            self._record_step(
                steps,
                name="get_top_products_by_revenue",
                response=top_products_response,
            )
            if not top_products_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "get_top_products_by_revenue",
                    top_products_response,
                )
            data["top_products_by_revenue"] = top_products_response["data"]

            return self._success(workflow_name, steps, data)

        except Exception as exc:
            return self._failure_from_exception(
                workflow_name,
                steps,
                data,
                exc,
            )

    def run_record_transaction_from_payload(
        self,
        transaction_data: Mapping[str, Any],
    ) -> dict[str, Any]:
        """
        Run transaction recording workflow from structured payload.

        Args:
            transaction_data: Transaction values.

        Returns:
            Workflow response.
        """

        workflow_name = "run_record_transaction_from_payload"
        steps: list[dict[str, Any]] = []
        data: dict[str, Any] = {
            "warnings": [],
        }

        try:
            if not isinstance(transaction_data, Mapping):
                raise ValueError("transaction_data must be a mapping.")

            transaction_response = self._transaction_tools.record_transaction(
                transaction_data=transaction_data,
            )
            self._record_step(
                steps,
                name="record_transaction",
                response=transaction_response,
            )
            if not transaction_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "record_transaction",
                    transaction_response,
                )
            data["transaction"] = transaction_response["data"]

            business_id = str(transaction_response["data"].get("business_id", ""))
            if business_id:
                summary_response = self._analytics_tools.get_sales_summary(
                    business_id=business_id,
                )
                self._record_step(
                    steps,
                    name="get_sales_summary",
                    response=summary_response,
                )
                if summary_response["success"]:
                    data["sales_summary"] = summary_response["data"]
                else:
                    data["warnings"].append(
                        {
                            "step": "get_sales_summary",
                            "error": summary_response["error"],
                        }
                    )

            return self._success(workflow_name, steps, data)

        except Exception as exc:
            return self._failure_from_exception(
                workflow_name,
                steps,
                data,
                exc,
            )

    def _save_optional_message(
        self,
        *,
        steps: list[dict[str, Any]],
        data: dict[str, Any],
        business_id: str,
        session_id: str | None,
        message: str,
    ) -> None:
        """Save optional workflow message."""

        if self._conversation_tools is None or session_id is None:
            return

        response = self._conversation_tools.save_message(
            business_id=business_id,
            session_id=session_id,
            role="system",
            message=message,
            agent="transaction_workflow",
        )
        self._record_step(steps, name="save_workflow_message", response=response)

        if not response["success"]:
            data["warnings"].append(
                {
                    "step": "save_workflow_message",
                    "error": response["error"],
                }
            )

    def _validate_text(self, value: Any, *, field_name: str) -> None:
        """Validate required text value."""

        if value is None or not str(value).strip():
            raise ValueError(f"{field_name} is required.")

    def _validate_positive_int(self, value: Any, *, field_name: str) -> None:
        """Validate positive integer value."""

        if not isinstance(value, int) or value <= 0:
            raise ValueError(f"{field_name} must be a positive integer.")

    def _record_step(
        self,
        steps: list[dict[str, Any]],
        *,
        name: str,
        response: dict[str, Any],
    ) -> None:
        """Record workflow step."""

        steps.append(
            {
                "name": name,
                "success": bool(response.get("success")),
                "tool": response.get("tool"),
            }
        )

    def _success(
        self,
        workflow_name: str,
        steps: list[dict[str, Any]],
        data: dict[str, Any],
    ) -> dict[str, Any]:
        """Build successful workflow response."""

        return {
            "success": True,
            "workflow": workflow_name,
            "steps": steps,
            "data": data,
            "error": None,
        }

    def _failure_from_tool(
        self,
        workflow_name: str,
        steps: list[dict[str, Any]],
        data: dict[str, Any],
        step_name: str,
        response: dict[str, Any],
    ) -> dict[str, Any]:
        """Build failure response from failed tool response."""

        self._logger.error("Workflow step failed: %s", step_name)

        return {
            "success": False,
            "workflow": workflow_name,
            "steps": steps,
            "data": data,
            "error": {
                "type": "WorkflowStepError",
                "message": f"Step {step_name} failed.",
                "step": step_name,
                "tool_error": response.get("error"),
            },
        }

    def _failure_from_exception(
        self,
        workflow_name: str,
        steps: list[dict[str, Any]],
        data: dict[str, Any],
        error: Exception,
    ) -> dict[str, Any]:
        """Build failure response from exception."""

        self._logger.exception("Workflow failed: %s", workflow_name)

        return {
            "success": False,
            "workflow": workflow_name,
            "steps": steps,
            "data": data,
            "error": {
                "type": error.__class__.__name__,
                "message": str(error),
            },
        }
