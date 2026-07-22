"""
Export Workflow
===============

Workflow orchestration for export use cases.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.tools.conversation_tools import ConversationTools
from app.tools.export_tools import ExportTools
from app.utils.logger import logger


class ExportWorkflow:
    """
    Workflow for export use cases.

    ExportWorkflow orchestrates ExportTools and optional ConversationTools. It
    does not write physical files, access repositories, access databases, use UI
    components, build prompts, or call LLM providers.
    """

    def __init__(
        self,
        export_tools: ExportTools,
        conversation_tools: ConversationTools | None = None,
    ) -> None:
        """Initialize export workflow."""

        self._export_tools = export_tools
        self._conversation_tools = conversation_tools
        self._logger = logger

    def run_export_dashboard(
        self,
        business_id: str,
        export_format: str = "json",
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Run dashboard export workflow.

        Args:
            business_id: Business identifier.
            export_format: Export format.
            limit: Maximum number of records read.
            session_id: Optional conversation session identifier.

        Returns:
            Workflow response.
        """

        workflow_name = "run_export_dashboard"
        steps: list[dict[str, Any]] = []
        data: dict[str, Any] = {
            "business_id": business_id,
            "warnings": [],
        }

        try:
            self._validate_text(business_id, field_name="business_id")
            self._validate_positive_int(limit, field_name="limit")

            export_response = self._export_tools.export_dashboard(
                business_id=business_id,
                export_format=export_format,
                limit=limit,
            )
            self._record_step(
                steps,
                name="export_dashboard",
                response=export_response,
            )
            if not export_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "export_dashboard",
                    export_response,
                )
            data["export"] = export_response["data"]

            self._save_optional_message(
                steps=steps,
                data=data,
                business_id=business_id,
                session_id=session_id,
                message="Dashboard export workflow completed.",
            )

            return self._success(workflow_name, steps, data)

        except Exception as exc:
            return self._failure_from_exception(
                workflow_name,
                steps,
                data,
                exc,
            )

    def run_export_sales_summary(
        self,
        business_id: str,
        export_format: str = "json",
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Run sales summary export workflow.

        Args:
            business_id: Business identifier.
            export_format: Export format.
            limit: Maximum number of records read.
            session_id: Optional conversation session identifier.

        Returns:
            Workflow response.
        """

        workflow_name = "run_export_sales_summary"
        steps: list[dict[str, Any]] = []
        data: dict[str, Any] = {
            "business_id": business_id,
            "warnings": [],
        }

        try:
            self._validate_text(business_id, field_name="business_id")
            self._validate_positive_int(limit, field_name="limit")

            export_response = self._export_tools.export_sales_summary(
                business_id=business_id,
                export_format=export_format,
                limit=limit,
            )
            self._record_step(
                steps,
                name="export_sales_summary",
                response=export_response,
            )
            if not export_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "export_sales_summary",
                    export_response,
                )
            data["export"] = export_response["data"]

            self._save_optional_message(
                steps=steps,
                data=data,
                business_id=business_id,
                session_id=session_id,
                message="Sales summary export workflow completed.",
            )

            return self._success(workflow_name, steps, data)

        except Exception as exc:
            return self._failure_from_exception(
                workflow_name,
                steps,
                data,
                exc,
            )

    def run_export_inventory_summary(
        self,
        business_id: str,
        export_format: str = "json",
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Run inventory summary export workflow.

        Args:
            business_id: Business identifier.
            export_format: Export format.
            limit: Maximum number of records read.
            session_id: Optional conversation session identifier.

        Returns:
            Workflow response.
        """

        workflow_name = "run_export_inventory_summary"
        steps: list[dict[str, Any]] = []
        data: dict[str, Any] = {
            "business_id": business_id,
            "warnings": [],
        }

        try:
            self._validate_text(business_id, field_name="business_id")
            self._validate_positive_int(limit, field_name="limit")

            export_response = self._export_tools.export_inventory_summary(
                business_id=business_id,
                export_format=export_format,
                limit=limit,
            )
            self._record_step(
                steps,
                name="export_inventory_summary",
                response=export_response,
            )
            if not export_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "export_inventory_summary",
                    export_response,
                )
            data["export"] = export_response["data"]

            self._save_optional_message(
                steps=steps,
                data=data,
                business_id=business_id,
                session_id=session_id,
                message="Inventory summary export workflow completed.",
            )

            return self._success(workflow_name, steps, data)

        except Exception as exc:
            return self._failure_from_exception(
                workflow_name,
                steps,
                data,
                exc,
            )

    def run_export_structured_data(
        self,
        data_to_export: Mapping[str, Any] | list[Mapping[str, Any]],
        export_format: str,
        filename_prefix: str,
    ) -> dict[str, Any]:
        """
        Run structured data export workflow.

        Args:
            data_to_export: Structured data to export.
            export_format: Export format.
            filename_prefix: Filename prefix.

        Returns:
            Workflow response.
        """

        workflow_name = "run_export_structured_data"
        steps: list[dict[str, Any]] = []
        data: dict[str, Any] = {
            "warnings": [],
        }

        try:
            if not isinstance(data_to_export, (Mapping, list)):
                raise ValueError("data_to_export must be a mapping or list.")
            self._validate_text(filename_prefix, field_name="filename_prefix")

            export_response = self._export_tools.export_structured_data(
                data=data_to_export,
                export_format=export_format,
                filename_prefix=filename_prefix,
            )
            self._record_step(
                steps,
                name="export_structured_data",
                response=export_response,
            )
            if not export_response["success"]:
                return self._failure_from_tool(
                    workflow_name,
                    steps,
                    data,
                    "export_structured_data",
                    export_response,
                )
            data["export"] = export_response["data"]

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
            agent="export_workflow",
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
