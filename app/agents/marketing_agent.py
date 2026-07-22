"""
Marketing Agent
===============

Domain agent for marketing reasoning.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.memory.conversation_memory import ConversationMemory
from app.utils.logger import logger
from app.workflows.marketing_workflow import MarketingWorkflow


class MarketingAgent:
    """
    Agent for marketing domain decisions.

    MarketingAgent selects marketing workflows and delegates execution to
    MarketingWorkflow. It never generates final AI copy, calls LLM providers, or
    accesses repositories, services, tools, or databases directly.
    """

    def __init__(
        self,
        marketing_workflow: MarketingWorkflow,
        conversation_memory: ConversationMemory | None = None,
    ) -> None:
        """Initialize marketing agent."""

        self._marketing_workflow = marketing_workflow
        self._conversation_memory = conversation_memory
        self._logger = logger

    def handle_marketing(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "marketing_context",
    ) -> dict[str, Any]:
        """
        Handle marketing intent.

        Args:
            payload: Marketing payload.
            intent: Marketing intent.

        Returns:
            Agent response.
        """

        agent_name = "MarketingAgent"

        try:
            self._validate_mapping(payload, field_name="payload")
            self._validate_text(intent, field_name="intent")
            self._save_optional_user_message(payload=payload, agent_name=agent_name)

            if intent == "marketing_context":
                workflow_response = self._marketing_workflow.run_product_marketing_context(
                    product_id=str(payload.get("product_id", "")),
                    business_id=self._optional_text(payload.get("business_id")),
                    session_id=self._optional_text(payload.get("session_id")),
                )
            elif intent == "create_marketing_record":
                marketing_data = payload.get("marketing_data", payload)
                self._validate_mapping(marketing_data, field_name="marketing_data")
                workflow_response = self._marketing_workflow.run_create_marketing_record(
                    business_id=str(payload.get("business_id", "")),
                    marketing_data=marketing_data,
                    session_id=self._optional_text(payload.get("session_id")),
                )
            elif intent == "marketing_history":
                workflow_response = self._marketing_workflow.run_marketing_history_review(
                    business_id=str(payload.get("business_id", "")),
                    keyword=self._optional_text(payload.get("keyword")),
                    limit=self._get_int(payload, "limit", default=100),
                )
            else:
                raise ValueError(f"Unsupported marketing intent: {intent}.")

            return self._from_workflow(
                agent_name=agent_name,
                intent=intent,
                workflow_response=workflow_response,
            )

        except Exception as exc:
            return self._failure(agent_name, intent, exc)

    def build_marketing_context(
        self,
        product_id: str,
        *,
        business_id: str | None = None,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Build marketing context for a product.

        Args:
            product_id: Product identifier.
            business_id: Optional business identifier.
            session_id: Optional conversation session identifier.

        Returns:
            Agent response.
        """

        return self.handle_marketing(
            {
                "product_id": product_id,
                "business_id": business_id,
                "session_id": session_id,
            },
            intent="marketing_context",
        )

    def create_marketing_record(
        self,
        business_id: str,
        marketing_data: Mapping[str, Any],
        *,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """
        Create marketing record through workflow.

        Args:
            business_id: Business identifier.
            marketing_data: Marketing record values.
            session_id: Optional conversation session identifier.

        Returns:
            Agent response.
        """

        return self.handle_marketing(
            {
                "business_id": business_id,
                "marketing_data": marketing_data,
                "session_id": session_id,
            },
            intent="create_marketing_record",
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
