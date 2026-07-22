"""
Router Agent
============

High-level router agent for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.agents.export_agent import ExportAgent
from app.agents.insight_agent import InsightAgent
from app.agents.marketing_agent import MarketingAgent
from app.agents.transaction_agent import TransactionAgent
from app.memory.conversation_memory import ConversationMemory
from app.utils.logger import logger
from app.workflows.ai_conversation_workflow import AIConversationWorkflow
from app.workflows.business_workflow import BusinessWorkflow


class RouterAgent:
    """
    High-level router agent.

    RouterAgent classifies user intent and delegates execution to the appropriate
    domain agent or workflow. It never accesses repositories, services, tools,
    analytics classes, databases, prompts, or LLM providers directly.
    """

    ROUTE_KEYWORDS = {
        "transaction": (
            "jual",
            "jualan",
            "penjualan",
            "transaksi",
            "bayar",
            "pembayaran",
            "record sale",
            "sales",
            "transaction",
        ),
        "marketing": (
            "marketing",
            "caption",
            "promosi",
            "promo",
            "konten",
            "instagram",
            "tiktok",
            "iklan",
        ),
        "export": (
            "export",
            "ekspor",
            "download",
            "unduh",
            "csv",
            "json",
            "laporan",
        ),
        "insight": (
            "insight",
            "analisis",
            "rekomendasi",
            "ringkasan",
            "kenapa",
            "mengapa",
            "strategi",
        ),
        "business": (
            "dashboard",
            "overview",
            "kondisi bisnis",
            "kesehatan bisnis",
            "health",
            "status bisnis",
        ),
    }

    QUESTION_PREFIXES = (
        "apa",
        "apakah",
        "bagaimana",
        "gimana",
        "kenapa",
        "mengapa",
        "siapa",
        "kapan",
        "dimana",
        "di mana",
        "berapa",
        "what",
        "why",
        "how",
        "who",
        "when",
        "where",
        "which",
        "should",
        "can",
        "could",
        "would",
        "do",
        "does",
        "is",
        "are",
    )
    GREETINGS = (
        "hi",
        "hello",
        "halo",
        "hai",
        "hey",
        "selamat pagi",
        "selamat siang",
        "selamat sore",
        "selamat malam",
    )

    def __init__(
        self,
        transaction_agent: TransactionAgent,
        marketing_agent: MarketingAgent,
        insight_agent: InsightAgent,
        export_agent: ExportAgent,
        business_workflow: BusinessWorkflow,
        ai_conversation_workflow: AIConversationWorkflow | None = None,
        conversation_memory: ConversationMemory | None = None,
    ) -> None:
        """
        Initialize router agent.

        Args:
            transaction_agent: Transaction domain agent.
            marketing_agent: Marketing domain agent.
            insight_agent: Insight domain agent.
            export_agent: Export domain agent.
            business_workflow: Business workflow dependency.
            ai_conversation_workflow: Gemini-backed AI conversation workflow.
            conversation_memory: Optional conversation memory dependency.
        """

        self._transaction_agent = transaction_agent
        self._marketing_agent = marketing_agent
        self._insight_agent = insight_agent
        self._export_agent = export_agent
        self._business_workflow = business_workflow
        self._ai_conversation_workflow = ai_conversation_workflow
        self._conversation_memory = conversation_memory
        self._logger = logger

    def route(
        self,
        user_input: str,
        payload: Mapping[str, Any],
        *,
        explicit_route: str | None = None,
    ) -> dict[str, Any]:
        """
        Route user request to the proper domain agent or workflow.

        Args:
            user_input: User input text.
            payload: Structured payload for the selected route.
            explicit_route: Optional route override.

        Returns:
            Agent response.
        """

        agent_name = "RouterAgent"
        intent = "route"

        try:
            self._validate_text(user_input, field_name="user_input")
            self._validate_mapping(payload, field_name="payload")

            route_name = explicit_route or self.classify_intent(user_input)
            self._save_optional_user_message(user_input=user_input, payload=payload)

            if route_name == "transaction":
                response = self._transaction_agent.handle_transaction(
                    payload,
                    intent=str(payload.get("transaction_intent", "record_transaction")),
                )
            elif route_name == "marketing":
                response = self._marketing_agent.handle_marketing(
                    payload,
                    intent=str(payload.get("marketing_intent", "marketing_context")),
                )
            elif route_name == "insight":
                response = self._insight_agent.handle_insight(
                    payload,
                    intent=str(payload.get("insight_intent", "insight_context")),
                )
            elif route_name == "export":
                response = self._export_agent.handle_export(
                    payload,
                    intent=str(payload.get("export_intent", "export_dashboard")),
                )
            elif route_name == "business":
                response = self._run_business_route(payload)
            elif route_name == "conversation":
                response = self._run_conversation_route(user_input, payload)
            else:
                raise ValueError(f"Unsupported route: {route_name}.")

            return {
                "success": bool(response.get("success")),
                "agent": agent_name,
                "intent": intent,
                "workflow": response.get("workflow"),
                "data": {
                    "route": route_name,
                    "route_response": response,
                },
                "error": response.get("error"),
            }

        except Exception as exc:
            return self._failure(agent_name, intent, exc)

    def classify_intent(self, user_input: str) -> str:
        """
        Classify user input into route name.

        General questions and greetings are routed to Gemini-backed conversation
        so the assistant can answer the actual prompt instead of always returning
        a business overview.
        """

        self._validate_text(user_input, field_name="user_input")
        lowered = user_input.lower().strip()

        if self._is_conversation_prompt(lowered):
            return "conversation"

        if self._is_business_intelligence_question(lowered):
            return "conversation"

        if self._is_transaction_record_prompt(lowered):
            return "transaction"

        for route_name, keywords in self.ROUTE_KEYWORDS.items():
            if route_name == "transaction":
                continue
            if any(keyword in lowered for keyword in keywords):
                return route_name

        return "conversation"

    def _run_conversation_route(
        self,
        user_input: str,
        payload: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Run Gemini-backed AI conversation workflow."""

        if self._ai_conversation_workflow is None:
            raise RuntimeError("AI conversation workflow is not configured.")

        business_id = self._optional_text(payload.get("business_id"))
        session_id = self._optional_text(payload.get("session_id"))
        limit = self._get_optional_int(payload, "limit", default=1000)
        business_profile = payload.get("business_profile")
        if not isinstance(business_profile, Mapping):
            business_profile = None

        workflow_response = self._ai_conversation_workflow.run_ai_conversation(
            user_input=user_input,
            business_id=business_id,
            session_id=session_id,
            business_profile=business_profile,
            limit=limit,
        )

        return {
            "success": bool(workflow_response.get("success")),
            "agent": "AIConversationWorkflowRoute",
            "intent": "ai_conversation",
            "workflow": workflow_response,
            "data": workflow_response.get("data", {}),
            "error": workflow_response.get("error"),
        }

    def _run_business_route(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """
        Run business workflow route.

        Args:
            payload: Business payload.

        Returns:
            Agent-like response for business workflow.
        """

        business_intent = str(payload.get("business_intent", "business_overview"))
        business_id = str(payload.get("business_id", ""))
        limit = self._get_int(payload, "limit", default=1000)
        session_id = self._optional_text(payload.get("session_id"))

        if business_intent == "business_health_check":
            workflow_response = self._business_workflow.run_business_health_check(
                business_id=business_id,
                limit=limit,
                session_id=session_id,
            )
        elif business_intent == "business_overview":
            workflow_response = self._business_workflow.run_business_overview(
                business_id=business_id,
                limit=limit,
                session_id=session_id,
            )
        else:
            raise ValueError(f"Unsupported business intent: {business_intent}.")

        if workflow_response.get("success"):
            return {
                "success": True,
                "agent": "BusinessWorkflowRoute",
                "intent": business_intent,
                "workflow": workflow_response,
                "data": workflow_response.get("data", {}),
                "error": None,
            }

        return {
            "success": False,
            "agent": "BusinessWorkflowRoute",
            "intent": business_intent,
            "workflow": workflow_response,
            "data": workflow_response.get("data", {}),
            "error": workflow_response.get("error"),
        }

    def _is_conversation_prompt(self, lowered_input: str) -> bool:
        """Return True for greetings and natural-language questions."""

        if lowered_input in self.GREETINGS:
            return True

        if lowered_input.endswith("?"):
            return True

        return lowered_input.startswith(self.QUESTION_PREFIXES)

    def _is_business_intelligence_question(self, lowered_input: str) -> bool:
        """Return True when user asks the assistant to read business data."""

        direct_bi_phrases = (
            "produk apa",
            "produk yang",
            "produk terjual",
            "apa yang terjual",
            "paling laku",
            "terlaris",
            "paling laris",
            "kurang laku",
            "tidak laku",
            "belum terjual",
            "tidak terjual",
            "stok menipis",
            "stok habis",
            "margin",
            "alert",
            "kesehatan bisnis",
            "business health",
        )
        if any(phrase in lowered_input for phrase in direct_bi_phrases):
            return True

        analysis_markers = (
            "bantu",
            "baca",
            "membaca",
            "analisa",
            "analisis",
            "ringkas",
            "rangkum",
            "cek data",
            "lihat data",
            "tampilkan data",
        )
        business_markers = (
            "produk",
            "transaksi",
            "penjualan",
            "stok",
            "stock",
            "margin",
            "alert",
            "kesehatan",
        )

        return any(marker in lowered_input for marker in analysis_markers) and any(
            marker in lowered_input for marker in business_markers
        )

    def _is_transaction_record_prompt(self, lowered_input: str) -> bool:
        """Return True when user wants to create or record a transaction."""

        record_markers = (
            "catat transaksi",
            "catat penjualan",
            "input transaksi",
            "input penjualan",
            "rekam transaksi",
            "rekam penjualan",
            "tambah transaksi",
            "buat transaksi",
            "record sale",
            "record transaction",
            "simpan transaksi",
            "saya jual",
            "terjual sebanyak",
        )

        return any(marker in lowered_input for marker in record_markers)

    def _save_optional_user_message(
        self,
        *,
        user_input: str,
        payload: Mapping[str, Any],
    ) -> None:
        """Save optional user message through memory."""

        if self._conversation_memory is None:
            return

        business_id = self._optional_text(payload.get("business_id"))
        session_id = self._optional_text(payload.get("session_id"))

        if business_id is None or session_id is None:
            return

        self._conversation_memory.save_user_message(
            business_id=business_id,
            session_id=session_id,
            message=user_input,
            agent="RouterAgent",
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

    def _get_optional_int(
        self,
        payload: Mapping[str, Any],
        field_name: str,
        *,
        default: int,
    ) -> int:
        """Get integer value but accept absent/None values."""

        value = payload.get(field_name, default)
        if value is None:
            return default
        if isinstance(value, int):
            return value
        raise ValueError(f"{field_name} must be an integer.")

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
