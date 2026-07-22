"""
Business Context
================

Business context memory provider for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.services.business_service import BusinessService
from app.tools.analytics_tools import AnalyticsTools
from app.tools.insight_tools import InsightTools
from app.utils.logger import logger


class BusinessContext:
    """
    Memory component for business context.

    BusinessContext prepares structured business state for workflow, agent, and
    future LangGraph usage. It reads data through Service or Tool dependencies
    only and never accesses repositories, Supabase, prompts, LLM clients, or UI
    components directly.
    """

    def __init__(
        self,
        business_service: BusinessService,
        analytics_tools: AnalyticsTools | None = None,
        insight_tools: InsightTools | None = None,
    ) -> None:
        """
        Initialize business context memory.

        Args:
            business_service: Business service dependency.
            analytics_tools: Optional analytics tools dependency.
            insight_tools: Optional insight tools dependency.
        """

        self._business_service = business_service
        self._analytics_tools = analytics_tools
        self._insight_tools = insight_tools
        self._logger = logger

    def load_business_profile(self) -> dict[str, Any]:
        """
        Load active business profile.

        Returns:
            Business profile record.
        """

        self._logger.info("Loading business profile context.")

        return self._business_service.get_business_profile()

    def load_business_context(self) -> dict[str, Any]:
        """
        Load normalized business context.

        Returns:
            Business context dictionary.
        """

        self._logger.info("Loading normalized business context.")

        return self._business_service.get_business_context()

    def build_business_state(
        self,
        business_id: str | None = None,
        *,
        include_dashboard: bool = True,
        include_insights: bool = True,
        limit: int = 100,
    ) -> dict[str, Any]:
        """
        Build complete business state.

        Args:
            business_id: Optional business identifier. If omitted, active
                business ID is loaded from BusinessService.
            include_dashboard: Whether dashboard context should be loaded.
            include_insights: Whether insight context should be loaded.
            limit: Maximum records read by tool dependencies.

        Returns:
            Business state dictionary.
        """

        self._validate_boolean(include_dashboard, field_name="include_dashboard")
        self._validate_boolean(include_insights, field_name="include_insights")
        self._validate_positive_int(limit, field_name="limit")

        profile = self.load_business_profile()
        base_context = self.load_business_context()
        resolved_business_id = business_id or str(base_context.get("business_id", ""))

        self._validate_text(resolved_business_id, field_name="business_id")

        if str(profile.get("id")) != str(resolved_business_id):
            raise RuntimeError("Requested business_id does not match active business.")

        state: dict[str, Any] = {
            "business_id": str(resolved_business_id),
            "business_profile": profile,
            "business_context": base_context,
            "dashboard_context": None,
            "insight_context": None,
            "metadata": {
                "source": "BusinessContext",
                "include_dashboard": include_dashboard,
                "include_insights": include_insights,
                "limit": limit,
            },
        }

        if include_dashboard:
            state["dashboard_context"] = self._load_dashboard_context(
                business_id=str(resolved_business_id),
                limit=limit,
            )

        if include_insights:
            state["insight_context"] = self._load_insight_context(
                business_id=str(resolved_business_id),
                limit=limit,
            )

        return state

    def append_business_context(
        self,
        state: Mapping[str, Any],
        *,
        include_dashboard: bool = True,
        include_insights: bool = True,
        limit: int = 100,
    ) -> dict[str, Any]:
        """
        Append business context to an existing workflow state.

        Args:
            state: Existing workflow or agent state.
            include_dashboard: Whether dashboard context should be loaded.
            include_insights: Whether insight context should be loaded.
            limit: Maximum records read by tool dependencies.

        Returns:
            New state containing business context.
        """

        if not isinstance(state, Mapping):
            raise ValueError("state must be a mapping.")

        business_state = self.build_business_state(
            business_id=str(state.get("business_id", "")) or None,
            include_dashboard=include_dashboard,
            include_insights=include_insights,
            limit=limit,
        )
        merged_state = dict(state)
        merged_state["business_memory"] = business_state

        return merged_state

    def get_business_id(self) -> str:
        """
        Get active business identifier.

        Returns:
            Active business ID.
        """

        business_id = self._business_service.get_business_id()
        self._validate_text(business_id, field_name="business_id")

        return business_id

    def _load_dashboard_context(
        self,
        *,
        business_id: str,
        limit: int,
    ) -> dict[str, Any]:
        """
        Load dashboard context through AnalyticsTools.

        Args:
            business_id: Business identifier.
            limit: Maximum records read.

        Returns:
            Dashboard context.

        Raises:
            RuntimeError: If AnalyticsTools is unavailable or returns failure.
        """

        if self._analytics_tools is None:
            raise RuntimeError("AnalyticsTools dependency is required.")

        response = self._analytics_tools.build_dashboard_payload(
            business_id=business_id,
            limit=limit,
        )

        return self._extract_tool_data(
            response,
            step_name="build_dashboard_payload",
        )

    def _load_insight_context(
        self,
        *,
        business_id: str,
        limit: int,
    ) -> dict[str, Any]:
        """
        Load insight context through InsightTools.

        Args:
            business_id: Business identifier.
            limit: Maximum records read.

        Returns:
            Insight context.

        Raises:
            RuntimeError: If InsightTools is unavailable or returns failure.
        """

        if self._insight_tools is None:
            raise RuntimeError("InsightTools dependency is required.")

        response = self._insight_tools.build_business_insight_context(
            business_id=business_id,
            limit=limit,
        )

        return self._extract_tool_data(
            response,
            step_name="build_business_insight_context",
        )

    def _extract_tool_data(
        self,
        response: Mapping[str, Any],
        *,
        step_name: str,
    ) -> dict[str, Any]:
        """
        Extract data from tool response.

        Args:
            response: Tool response.
            step_name: Tool step name.

        Returns:
            Tool data.

        Raises:
            RuntimeError: If tool response indicates failure.
        """

        if not isinstance(response, Mapping):
            raise RuntimeError(f"{step_name} response must be a mapping.")

        if not response.get("success"):
            raise RuntimeError(f"{step_name} failed: {response.get('error')}")

        data = response.get("data")

        if not isinstance(data, dict):
            raise RuntimeError(f"{step_name} data must be a dictionary.")

        return data

    def _validate_text(self, value: Any, *, field_name: str) -> None:
        """
        Validate required text value.

        Args:
            value: Value to validate.
            field_name: Field name used in error messages.
        """

        if value is None or not str(value).strip():
            raise ValueError(f"{field_name} is required.")

    def _validate_positive_int(self, value: Any, *, field_name: str) -> None:
        """
        Validate positive integer value.

        Args:
            value: Value to validate.
            field_name: Field name used in error messages.
        """

        if not isinstance(value, int) or value <= 0:
            raise ValueError(f"{field_name} must be a positive integer.")

    def _validate_boolean(self, value: Any, *, field_name: str) -> None:
        """
        Validate boolean value.

        Args:
            value: Value to validate.
            field_name: Field name used in error messages.
        """

        if not isinstance(value, bool):
            raise ValueError(f"{field_name} must be a boolean.")
