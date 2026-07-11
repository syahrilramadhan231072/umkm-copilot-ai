"""
Insight Workflow
================

Workflow orchestration for insight use cases.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.tools.analytics_tools import AnalyticsTools
from app.tools.conversation_tools import ConversationTools
from app.tools.insight_tools import InsightTools
from app.utils.logger import logger


class InsightWorkflow:
    """
    Workflow for insight use cases.

    InsightWorkflow orchestrates InsightTools, AnalyticsTools, and optional
    ConversationTools. It does not generate AI narratives, create prompts, call
    LLMs, or access repositories directly.
    """

    def __init__(
        self,
        insight_tools: InsightTools,
        analytics_tools: AnalyticsTools,
        conversation_tools: ConversationTools | None = None,
    ) -> None:
        """Initialize insight workflow."""

        self._insight_tools = insight_tools
        self._analytics_tools = analytics_tools
        self._conversation_tools = conversation_tools
        self._logger = logger

    def run_insight_context(
        self,
        business_id: str,
        limit: int = 100,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Run insight context workflow.

        Args:
            business_id: Business identifier.
            limit: Maximum number of records read.
            session_id: Optional conversation session identifier.

        Returns:
            Workflow response.
        """

        workflow_name = "run_insight_context"
        steps: list[dict[str, Any]] = []
        data: dict[str, Any] = {
            "business_id": business_id,
            "warnings": [],
        }

        try:
            self._validate_text(business_id, field_name="business_id")
            self._validate_positive_int(limit, field_name="limit")

            context_response = self._insight_tools.build_business_insight_context(
                business_id=business_id,
                limit=limit,
            )
            self._record_step(
                steps,
                name="build_business_insight_context",
                response=context_response,
            )
            if not context_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "build_business_insight_context",
                    context_response,
                )
            data["insight_context"] = context_response["data"]

            dashboard_response = self._analytics_tools.build_dashboard_payload(
                business_id=business_id,
                limit=limit,
            )
            self._record_step(
                steps,
                name="build_dashboard_payload",
                response=dashboard_response,
            )
            if dashboard_response["success"]:
                data["dashboard"] = dashboard_response["data"]
            else:
                data["warnings"].append(
                    {
                        "step": "build_dashboard_payload",
                        "error": dashboard_response["error"],
                    }
                )

            self._save_optional_message(
                steps=steps,
                data=data,
                business_id=business_id,
                session_id=session_id,
                message="Insight context workflow completed.",
            )

            return self._success(workflow_name, steps, data)

        except Exception as exc:
            return self._failure_from_exception(
                workflow_name,
                steps,
                data,
                exc,
            )

    def run_create_insight(
        self,
        business_id: str,
        insight_data: Mapping[str, Any],
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Run create insight workflow.

        Args:
            business_id: Business identifier.
            insight_data: Insight values.
            session_id: Optional conversation session identifier.

        Returns:
            Workflow response.
        """

        workflow_name = "run_create_insight"
        steps: list[dict[str, Any]] = []
        data: dict[str, Any] = {
            "business_id": business_id,
            "warnings": [],
        }

        try:
            self._validate_text(business_id, field_name="business_id")
            if not isinstance(insight_data, Mapping):
                raise ValueError("insight_data must be a mapping.")

            create_response = self._insight_tools.create_insight_record(
                business_id=business_id,
                insight_data=insight_data,
            )
            self._record_step(
                steps,
                name="create_insight_record",
                response=create_response,
            )
            if not create_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "create_insight_record",
                    create_response,
                )
            data["insight"] = create_response["data"]

            recent_response = self._insight_tools.list_recent_insights(
                business_id=business_id,
                limit=10,
            )
            self._record_step(
                steps,
                name="list_recent_insights",
                response=recent_response,
            )
            if recent_response["success"]:
                data["recent_insights"] = recent_response["data"]
            else:
                data["warnings"].append(
                    {
                        "step": "list_recent_insights",
                        "error": recent_response["error"],
                    }
                )

            self._save_optional_message(
                steps=steps,
                data=data,
                business_id=business_id,
                session_id=session_id,
                message="Create insight workflow completed.",
            )

            return self._success(workflow_name, steps, data)

        except Exception as exc:
            return self._failure_from_exception(
                workflow_name,
                steps,
                data,
                exc,
            )

    def run_insight_review(
        self,
        business_id: str,
        insight_category: str | None = None,
        keyword: str | None = None,
        limit: int = 100,
    ) -> dict[str, Any]:
        """
        Run insight review workflow.

        Args:
            business_id: Business identifier.
            insight_category: Optional insight category.
            keyword: Optional title keyword.
            limit: Maximum number of records read.

        Returns:
            Workflow response.
        """

        workflow_name = "run_insight_review"
        steps: list[dict[str, Any]] = []
        data: dict[str, Any] = {
            "business_id": business_id,
            "warnings": [],
        }

        try:
            self._validate_text(business_id, field_name="business_id")
            self._validate_positive_int(limit, field_name="limit")

            if keyword is not None:
                response = self._insight_tools.search_insight_titles(
                    business_id=business_id,
                    keyword=keyword,
                    limit=limit,
                )
                step_name = "search_insight_titles"
            elif insight_category is not None:
                response = self._insight_tools.list_insights_by_category(
                    business_id=business_id,
                    insight_category=insight_category,
                    limit=limit,
                )
                step_name = "list_insights_by_category"
            else:
                response = self._insight_tools.list_recent_insights(
                    business_id=business_id,
                    limit=limit,
                )
                step_name = "list_recent_insights"

            self._record_step(steps, name=step_name, response=response)
            if not response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    step_name,
                    response,
                )
            data["insights"] = response["data"]

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
            agent="insight_workflow",
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
