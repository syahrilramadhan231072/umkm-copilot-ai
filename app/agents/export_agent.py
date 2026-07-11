"""
Export Agent
============

Domain agent for export reasoning.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.memory.conversation_memory import ConversationMemory
from app.utils.logger import logger
from app.workflows.export_workflow import ExportWorkflow


class ExportAgent:
    """
    Agent for export domain decisions.

    ExportAgent selects export workflows and delegates execution to
    ExportWorkflow. It never writes files directly, accesses repositories,
    accesses databases, or calls LLM providers.
    """

    def __init__(
        self,
        export_workflow: ExportWorkflow,
        conversation_memory: ConversationMemory | None = None,
    ) -> None:
        """Initialize export agent."""

        self._export_workflow = export_workflow
        self._conversation_memory = conversation_memory
        self._logger = logger

    def handle_export(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "export_dashboard",
    ) -> dict[str, Any]:
        """
        Handle export intent.

        Args:
            payload: Export payload.
            intent: Export intent.

        Returns:
            Agent response.
        """

        agent_name = "ExportAgent"

        try:
            self._validate_mapping(payload, field_name="payload")
            self._validate_text(intent, field_name="intent")
            self._save_optional_user_message(payload=payload, agent_name=agent_name)

            if intent == "export_dashboard":
                workflow_response = self._export_workflow.run_export_dashboard(
                    business_id=str(payload.get("business_id", "")),
                    export_format=str(payload.get("export_format", "json")),
                    limit=self._get_int(payload, "limit", default=1000),
                    session_id=self._optional_text(payload.get("session_id")),
                )
            elif intent == "export_sales_summary":
                workflow_response = self._export_workflow.run_export_sales_summary(
                    business_id=str(payload.get("business_id", "")),
                    export_format=str(payload.get("export_format", "json")),
                    limit=self._get_int(payload, "limit", default=1000),
                    session_id=self._optional_text(payload.get("session_id")),
                )
            elif intent == "export_inventory_summary":
                workflow_response = self._export_workflow.run_export_inventory_summary(
                    business_id=str(payload.get("business_id", "")),
                    export_format=str(payload.get("export_format", "json")),
                    limit=self._get_int(payload, "limit", default=1000),
                    session_id=self._optional_text(payload.get("session_id")),
                )
            elif intent == "export_structured_data":
                data_to_export = payload.get("data_to_export")
                if not isinstance(data_to_export, (Mapping, list)):
                    raise ValueError("data_to_export must be a mapping or list.")
                workflow_response = self._export_workflow.run_export_structured_data(
                    data_to_export=data_to_export,
                    export_format=str(payload.get("export_format", "json")),
                    filename_prefix=str(payload.get("filename_prefix", "export")),
                )
            else:
                raise ValueError(f"Unsupported export intent: {intent}.")

            return self._from_workflow(
                agent_name=agent_name,
                intent=intent,
                workflow_response=workflow_response,
            )

        except Exception as exc:
            return self._failure(agent_name, intent, exc)

    def export_dashboard(
        self,
        business_id: str,
        *,
        export_format: str = "json",
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Export dashboard.

        Args:
            business_id: Business identifier.
            export_format: Export format.
            limit: Maximum number of records read.
            session_id: Optional conversation session identifier.

        Returns:
            Agent response.
        """

        return self.handle_export(
            {
                "business_id": business_id,
                "export_format": export_format,
                "limit": limit,
                "session_id": session_id,
            },
            intent="export_dashboard",
        )

    def export_sales_summary(
        self,
        business_id: str,
        *,
        export_format: str = "json",
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Export sales summary.

        Args:
            business_id: Business identifier.
            export_format: Export format.
            limit: Maximum number of records read.
            session_id: Optional conversation session identifier.

        Returns:
            Agent response.
        """

        return self.handle_export(
            {
                "business_id": business_id,
                "export_format": export_format,
                "limit": limit,
                "session_id": session_id,
            },
            intent="export_sales_summary",
        )

    def _from_workflow(
        self,
        *,
        agent_name: str,
        intent: str,
        workflow_response: dict[str, Any],
    ) -> dict[str, Any]:
        """Build agent response from workflow response."""

        if workflow_response.get("success"):
            return {
                "success": True,
                "agent": agent_name,
                "intent": intent,
                "workflow": workflow_response,
                "data": workflow_response.get("data", {}),
                "error": None,
            }

        return {
            "success": False,
            "agent": agent_name,
            "intent": intent,
            "workflow": workflow_response,
            "data": workflow_response.get("data", {}),
            "error": workflow_response.get("error"),
        }

    def _save_optional_user_message(
        self,
        *,
        payload: Mapping[str, Any],
        agent_name: str,
    ) -> None:
        """Save optional user message through memory."""

        if self._conversation_memory is None:
            return

        business_id = self._optional_text(payload.get("business_id"))
        session_id = self._optional_text(payload.get("session_id"))
        user_message = self._optional_text(payload.get("user_message"))

        if business_id is None or session_id is None or user_message is None:
            return

        self._conversation_memory.save_user_message(
            business_id=business_id,
            session_id=session_id,
            message=user_message,
            agent=agent_name,
        )

    def _validate_mapping(self, value: Any, *, field_name: str) -> None:
        """Validate mapping value."""

        if not isinstance(value, Mapping):
            raise ValueError(f"{field_name} must be a mapping.")

    def _validate_text(self, value: Any, *, field_name: str) -> None:
        """Validate required text."""

        if value is None or not str(value).strip():
            raise ValueError(f"{field_name} is required.")

    def _get_int(
        self,
        payload: Mapping[str, Any],
        field_name: str,
        *,
        default: int,
    ) -> int:
        """Get integer value from payload."""

        value = payload.get(field_name, default)

        if not isinstance(value, int):
            raise ValueError(f"{field_name} must be an integer.")

        return value

    def _optional_text(self, value: Any) -> str | None:
        """Return stripped optional text."""

        if value is None:
            return None

        text = str(value).strip()

        return text or None

    def _failure(
        self,
        agent_name: str,
        intent: str,
        error: Exception,
    ) -> dict[str, Any]:
        """Build failure response."""

        self._logger.exception("%s failed for intent=%s.", agent_name, intent)

        return {
            "success": False,
            "agent": agent_name,
            "intent": intent,
            "workflow": None,
            "data": {},
            "error": {
                "type": error.__class__.__name__,
                "message": str(error),
            },
        }
