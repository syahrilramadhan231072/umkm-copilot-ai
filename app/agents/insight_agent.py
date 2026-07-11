"""
Insight Agent
=============

Domain agent for insight reasoning.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.memory.conversation_memory import ConversationMemory
from app.utils.logger import logger
from app.workflows.insight_workflow import InsightWorkflow


class InsightAgent:
    """
    Agent for insight domain decisions.

    InsightAgent selects insight workflows and delegates execution to
    InsightWorkflow. It never accesses repositories, services, tools, databases,
    prompts, or LLM providers directly.
    """

    def __init__(
        self,
        insight_workflow: InsightWorkflow,
        conversation_memory: ConversationMemory | None = None,
    ) -> None:
        """Initialize insight agent."""

        self._insight_workflow = insight_workflow
        self._conversation_memory = conversation_memory
        self._logger = logger

    def handle_insight(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "insight_context",
    ) -> dict[str, Any]:
        """
        Handle insight intent.

        Args:
            payload: Insight payload.
            intent: Insight intent.

        Returns:
            Agent response.
        """

        agent_name = "InsightAgent"

        try:
            self._validate_mapping(payload, field_name="payload")
            self._validate_text(intent, field_name="intent")
            self._save_optional_user_message(payload=payload, agent_name=agent_name)

            if intent == "insight_context":
                workflow_response = self._insight_workflow.run_insight_context(
                    business_id=str(payload.get("business_id", "")),
                    limit=self._get_int(payload, "limit", default=100),
                    session_id=self._optional_text(payload.get("session_id")),
                )
            elif intent == "create_insight":
                insight_data = payload.get("insight_data", payload)
                self._validate_mapping(insight_data, field_name="insight_data")
                workflow_response = self._insight_workflow.run_create_insight(
                    business_id=str(payload.get("business_id", "")),
                    insight_data=insight_data,
                    session_id=self._optional_text(payload.get("session_id")),
                )
            elif intent == "insight_review":
                workflow_response = self._insight_workflow.run_insight_review(
                    business_id=str(payload.get("business_id", "")),
                    insight_category=self._optional_text(
                        payload.get("insight_category")
                    ),
                    keyword=self._optional_text(payload.get("keyword")),
                    limit=self._get_int(payload, "limit", default=100),
                )
            else:
                raise ValueError(f"Unsupported insight intent: {intent}.")

            return self._from_workflow(
                agent_name=agent_name,
                intent=intent,
                workflow_response=workflow_response,
            )

        except Exception as exc:
            return self._failure(agent_name, intent, exc)

    def build_insight_context(
        self,
        business_id: str,
        *,
        limit: int = 100,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Build insight context.

        Args:
            business_id: Business identifier.
            limit: Maximum number of records read.
            session_id: Optional conversation session identifier.

        Returns:
            Agent response.
        """

        return self.handle_insight(
            {
                "business_id": business_id,
                "limit": limit,
                "session_id": session_id,
            },
            intent="insight_context",
        )

    def create_insight(
        self,
        business_id: str,
        insight_data: Mapping[str, Any],
        *,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Create insight record.

        Args:
            business_id: Business identifier.
            insight_data: Insight record values.
            session_id: Optional conversation session identifier.

        Returns:
            Agent response.
        """

        return self.handle_insight(
            {
                "business_id": business_id,
                "insight_data": insight_data,
                "session_id": session_id,
            },
            intent="create_insight",
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
