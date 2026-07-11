"""
Business Workflow
=================

Workflow orchestration for business overview and business health use cases.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from app.tools.analytics_tools import AnalyticsTools
from app.tools.conversation_tools import ConversationTools
from app.tools.insight_tools import InsightTools
from app.utils.logger import logger


class BusinessWorkflow:
    """
    Workflow for business overview use cases.

    BusinessWorkflow orchestrates tools only. It does not access services,
    repositories, analytics classes, databases, prompts, LLM clients, or UI
    components directly.
    """

    def __init__(
        self,
        analytics_tools: AnalyticsTools,
        insight_tools: InsightTools,
        conversation_tools: ConversationTools | None = None,
    ) -> None:
        """
        Initialize business workflow.

        Args:
            analytics_tools: Analytics tool dependency.
            insight_tools: Insight tool dependency.
            conversation_tools: Optional conversation tool dependency.
        """

        self._analytics_tools = analytics_tools
        self._insight_tools = insight_tools
        self._conversation_tools = conversation_tools
        self._logger = logger

    def run_business_overview(
        self,
        business_id: str,
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Run business overview workflow.

        Args:
            business_id: Business identifier.
            limit: Maximum number of records read by tools.
            session_id: Optional conversation session identifier.

        Returns:
            Workflow response.
        """

        workflow_name = "run_business_overview"
        steps: list[dict[str, Any]] = []
        data: dict[str, Any] = {
            "business_id": business_id,
            "warnings": [],
        }

        try:
            self._validate_business_id(business_id)
            self._validate_limit(limit)

            dashboard_response = self._analytics_tools.build_dashboard_payload(
                business_id=business_id,
                limit=limit,
            )
            self._record_step(
                steps,
                name="build_dashboard_payload",
                response=dashboard_response,
            )
            if not dashboard_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "build_dashboard_payload",
                    dashboard_response,
                )
            data["dashboard"] = dashboard_response["data"]

            insight_response = self._insight_tools.build_business_insight_context(
                business_id=business_id,
                limit=min(limit, 100),
            )
            self._record_step(
                steps,
                name="build_business_insight_context",
                response=insight_response,
            )
            if not insight_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "build_business_insight_context",
                    insight_response,
                )
            data["insight_context"] = insight_response["data"]

            self._save_optional_message(
                steps=steps,
                data=data,
                business_id=business_id,
                session_id=session_id,
                message="Business overview workflow completed.",
                agent="business_workflow",
            )

            return self._success(workflow_name, steps, data)

        except Exception as exc:
            return self._failure_from_exception(
                workflow_name,
                steps,
                data,
                exc,
            )

    def run_business_health_check(
        self,
        business_id: str,
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Run business health check workflow.

        Args:
            business_id: Business identifier.
            limit: Maximum number of records read by tools.
            session_id: Optional conversation session identifier.

        Returns:
            Workflow response.
        """

        workflow_name = "run_business_health_check"
        steps: list[dict[str, Any]] = []
        data: dict[str, Any] = {
            "business_id": business_id,
            "warnings": [],
        }

        try:
            self._validate_business_id(business_id)
            self._validate_limit(limit)

            sales_response = self._analytics_tools.get_sales_summary(
                business_id=business_id,
                limit=limit,
            )
            self._record_step(steps, name="get_sales_summary", response=sales_response)
            if not sales_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "get_sales_summary",
                    sales_response,
                )
            data["sales_summary"] = sales_response["data"]

            inventory_response = self._analytics_tools.get_inventory_summary(
                business_id=business_id,
                limit=limit,
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

            alerts_response = self._analytics_tools.build_dashboard_alerts(
                business_id=business_id,
                limit=limit,
            )
            self._record_step(
                steps,
                name="build_dashboard_alerts",
                response=alerts_response,
            )
            if not alerts_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "build_dashboard_alerts",
                    alerts_response,
                )
            data["alerts"] = alerts_response["data"]

            self._save_optional_message(
                steps=steps,
                data=data,
                business_id=business_id,
                session_id=session_id,
                message="Business health check workflow completed.",
                agent="business_workflow",
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
        agent: str,
    ) -> None:
        """
        Save optional conversation message.

        Args:
            steps: Workflow steps.
            data: Workflow data.
            business_id: Business identifier.
            session_id: Optional session identifier.
            message: Message to save.
            agent: Agent name.
        """

        if self._conversation_tools is None or session_id is None:
            return

        response = self._conversation_tools.save_message(
            business_id=business_id,
            session_id=session_id,
            role="system",
            message=message,
            agent=agent,
        )
        self._record_step(steps, name="save_workflow_message", response=response)

        if not response["success"]:
            data["warnings"].append(
                {
                    "step": "save_workflow_message",
                    "error": response["error"],
                }
            )

    def _validate_business_id(self, business_id: str) -> None:
        """Validate business identifier."""

        if not str(business_id).strip():
            raise ValueError("business_id is required.")

    def _validate_limit(self, limit: int) -> None:
        """Validate limit."""

        if not isinstance(limit, int) or limit <= 0:
            raise ValueError("limit must be a positive integer.")

    def _record_step(
        self,
        steps: list[dict[str, Any]],
        *,
        name: str,
        response: dict[str, Any],
    ) -> None:
        """Record workflow step result."""

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
        """Build failed workflow response from failed tool response."""

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
        """Build failed workflow response from exception."""

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
