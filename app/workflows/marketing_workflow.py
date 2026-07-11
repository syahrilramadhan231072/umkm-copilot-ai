"""
Marketing Workflow
==================

Workflow orchestration for marketing use cases.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.tools.analytics_tools import AnalyticsTools
from app.tools.conversation_tools import ConversationTools
from app.tools.marketing_tools import MarketingTools
from app.utils.logger import logger


class MarketingWorkflow:
    """
    Workflow for marketing use cases.

    MarketingWorkflow orchestrates MarketingTools, AnalyticsTools, and optional
    ConversationTools. It does not generate AI copy, create prompts, call LLMs,
    or access repositories directly.
    """

    def __init__(
        self,
        marketing_tools: MarketingTools,
        analytics_tools: AnalyticsTools,
        conversation_tools: ConversationTools | None = None,
    ) -> None:
        """Initialize marketing workflow."""

        self._marketing_tools = marketing_tools
        self._analytics_tools = analytics_tools
        self._conversation_tools = conversation_tools
        self._logger = logger

    def run_product_marketing_context(
        self,
        product_id: str,
        business_id: str | None = None,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Run product marketing context workflow.

        Args:
            product_id: Product identifier.
            business_id: Optional business identifier for conversation logging.
            session_id: Optional conversation session identifier.

        Returns:
            Workflow response.
        """

        workflow_name = "run_product_marketing_context"
        steps: list[dict[str, Any]] = []
        data: dict[str, Any] = {
            "warnings": [],
        }

        try:
            self._validate_text(product_id, field_name="product_id")

            context_response = self._marketing_tools.build_product_marketing_context(
                product_id
            )
            self._record_step(
                steps,
                name="build_product_marketing_context",
                response=context_response,
            )
            if not context_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "build_product_marketing_context",
                    context_response,
                )
            data["product_marketing_context"] = context_response["data"]

            resolved_business_id = business_id or str(
                context_response["data"].get("business_id", "")
            )
            if resolved_business_id:
                product_summary_response = self._analytics_tools.get_product_summary(
                    business_id=resolved_business_id,
                )
                self._record_step(
                    steps,
                    name="get_product_summary",
                    response=product_summary_response,
                )
                if product_summary_response["success"]:
                    data["product_summary"] = product_summary_response["data"]
                else:
                    data["warnings"].append(
                        {
                            "step": "get_product_summary",
                            "error": product_summary_response["error"],
                        }
                    )

                self._save_optional_message(
                    steps=steps,
                    data=data,
                    business_id=resolved_business_id,
                    session_id=session_id,
                    message="Marketing context workflow completed.",
                )

            return self._success(workflow_name, steps, data)

        except Exception as exc:
            return self._failure_from_exception(
                workflow_name,
                steps,
                data,
                exc,
            )

    def run_create_marketing_record(
        self,
        business_id: str,
        marketing_data: Mapping[str, Any],
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Run create marketing record workflow.

        Args:
            business_id: Business identifier.
            marketing_data: Marketing record values.
            session_id: Optional conversation session identifier.

        Returns:
            Workflow response.
        """

        workflow_name = "run_create_marketing_record"
        steps: list[dict[str, Any]] = []
        data: dict[str, Any] = {
            "business_id": business_id,
            "warnings": [],
        }

        try:
            self._validate_text(business_id, field_name="business_id")
            if not isinstance(marketing_data, Mapping):
                raise ValueError("marketing_data must be a mapping.")

            record_response = self._marketing_tools.create_marketing_record(
                business_id=business_id,
                marketing_data=marketing_data,
            )
            self._record_step(
                steps,
                name="create_marketing_record",
                response=record_response,
            )
            if not record_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "create_marketing_record",
                    record_response,
                )
            data["marketing_record"] = record_response["data"]

            history_response = self._marketing_tools.list_marketing_history(
                business_id=business_id,
                limit=20,
            )
            self._record_step(
                steps,
                name="list_marketing_history",
                response=history_response,
            )
            if history_response["success"]:
                data["marketing_history"] = history_response["data"]
            else:
                data["warnings"].append(
                    {
                        "step": "list_marketing_history",
                        "error": history_response["error"],
                    }
                )

            self._save_optional_message(
                steps=steps,
                data=data,
                business_id=business_id,
                session_id=session_id,
                message="Marketing record workflow completed.",
            )

            return self._success(workflow_name, steps, data)

        except Exception as exc:
            return self._failure_from_exception(
                workflow_name,
                steps,
                data,
                exc,
            )

    def run_marketing_history_review(
        self,
        business_id: str,
        keyword: str | None = None,
        limit: int = 100,
    ) -> dict[str, Any]:
        """
        Run marketing history review workflow.

        Args:
            business_id: Business identifier.
            keyword: Optional caption keyword.
            limit: Maximum number of records read.

        Returns:
            Workflow response.
        """

        workflow_name = "run_marketing_history_review"
        steps: list[dict[str, Any]] = []
        data: dict[str, Any] = {
            "business_id": business_id,
            "warnings": [],
        }

        try:
            self._validate_text(business_id, field_name="business_id")
            self._validate_positive_int(limit, field_name="limit")

            if keyword is None:
                response = self._marketing_tools.list_marketing_history(
                    business_id=business_id,
                    limit=limit,
                )
                step_name = "list_marketing_history"
            else:
                response = self._marketing_tools.search_marketing_captions(
                    business_id=business_id,
                    keyword=keyword,
                    limit=limit,
                )
                step_name = "search_marketing_captions"

            self._record_step(steps, name=step_name, response=response)
            if not response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    step_name,
                    response,
                )
            data["marketing_records"] = response["data"]

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
            agent="marketing_workflow",
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
