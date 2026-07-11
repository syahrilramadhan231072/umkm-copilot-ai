"""
Transaction Agent
=================

Domain agent for transaction reasoning.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.memory.conversation_memory import ConversationMemory
from app.utils.logger import logger
from app.workflows.transaction_workflow import TransactionWorkflow


class TransactionAgent:
    """
    Agent for transaction domain decisions.

    TransactionAgent performs lightweight reasoning over transaction intents and
    delegates execution to TransactionWorkflow. It never accesses repositories,
    services, tools, databases, prompts, or LLM providers directly.
    """

    def __init__(
        self,
        transaction_workflow: TransactionWorkflow,
        conversation_memory: ConversationMemory | None = None,
    ) -> None:
        """Initialize transaction agent."""

        self._transaction_workflow = transaction_workflow
        self._conversation_memory = conversation_memory
        self._logger = logger

    def handle_transaction(
        self,
        payload: Mapping[str, Any],
        *,
        intent: str = "record_transaction",
    ) -> dict[str, Any]:
        """
        Handle transaction intent.

        Args:
            payload: Transaction payload.
            intent: Transaction intent.

        Returns:
            Agent response.
        """

        agent_name = "TransactionAgent"

        try:
            self._validate_mapping(payload, field_name="payload")
            self._validate_text(intent, field_name="intent")

            self._save_optional_user_message(
                payload=payload,
                agent_name=agent_name,
            )

            if intent == "record_transaction":
                workflow_response = self._transaction_workflow.run_record_transaction(
                    business_id=str(payload.get("business_id", "")),
                    product_id=str(payload.get("product_id", "")),
                    quantity=self._get_int(payload, "quantity"),
                    payment_method=str(payload.get("payment_method", "cash")),
                    status=str(payload.get("status", "completed")),
                    notes=self._optional_text(payload.get("notes")),
                    session_id=self._optional_text(payload.get("session_id")),
                )
            elif intent == "record_transaction_from_payload":
                workflow_response = (
                    self._transaction_workflow.run_record_transaction_from_payload(
                        transaction_data=payload,
                    )
                )
            elif intent == "transaction_summary":
                workflow_response = (
                    self._transaction_workflow.run_transaction_summary_refresh(
                        business_id=str(payload.get("business_id", "")),
                        limit=self._get_int(payload, "limit", default=1000),
                    )
                )
            else:
                raise ValueError(f"Unsupported transaction intent: {intent}.")

            return self._from_workflow(
                agent_name=agent_name,
                intent=intent,
                workflow_response=workflow_response,
            )

        except Exception as exc:
            return self._failure(agent_name, intent, exc)

    def record_transaction(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """
        Record transaction.

        Args:
            payload: Transaction payload.

        Returns:
            Agent response.
        """

        return self.handle_transaction(payload, intent="record_transaction")

    def refresh_transaction_summary(
        self,
        business_id: str,
        *,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """
        Refresh transaction summary.

        Args:
            business_id: Business identifier.
            limit: Maximum number of records read.

        Returns:
            Agent response.
        """

        return self.handle_transaction(
            {
                "business_id": business_id,
                "limit": limit,
            },
            intent="transaction_summary",
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
        default: int | None = None,
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
