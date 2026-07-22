"""
Insight Tools
=============

Thin adapter tools for insight use cases.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.services.insight_service import InsightService
from app.utils.logger import logger


class InsightTools:
    """
    Tool adapter for InsightService.

    InsightTools manages structured insight records and context without
    generating AI narratives, prompts, or LLM output.
    """

    def __init__(self, insight_service: InsightService) -> None:
        """Initialize insight tools."""

        self._insight_service = insight_service
        self._logger = logger

    def create_insight_record(
        self,
        business_id: str,
        insight_data: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Create insight record through InsightService."""

        tool_name = "create_insight_record"

        try:
            data = self._insight_service.create_insight_record(
                business_id=business_id,
                insight_data=insight_data,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def get_insight(self, insight_id: str) -> dict[str, Any]:
        """Get insight record through InsightService."""

        tool_name = "get_insight"

        try:
            data = self._insight_service.get_insight(insight_id)
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def list_recent_insights(
        self,
        business_id: str,
        limit: int = 20,
    ) -> dict[str, Any]:
        """List recent insights through InsightService."""

        tool_name = "list_recent_insights"

        try:
            data = self._insight_service.list_recent_insights(
                business_id=business_id,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def list_insights_by_category(
        self,
        business_id: str,
        insight_category: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """List insights by category through InsightService."""

        tool_name = "list_insights_by_category"

        try:
            data = self._insight_service.list_insights_by_category(
                business_id=business_id,
                insight_category=insight_category,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def search_insight_titles(
        self,
        business_id: str,
        keyword: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Search insight titles through InsightService."""

        tool_name = "search_insight_titles"

        try:
            data = self._insight_service.search_insight_titles(
                business_id=business_id,
                keyword=keyword,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def build_business_insight_context(
        self,
        business_id: str,
        limit: int = 20,
    ) -> dict[str, Any]:
        """Build business insight context through InsightService."""

        tool_name = "build_business_insight_context"

        try:
            data = self._insight_service.build_business_insight_context(
                business_id=business_id,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def update_insight(
        self,
        insight_id: str,
        values: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Update insight record through InsightService."""

        tool_name = "update_insight"

        try:
            data = self._insight_service.update_insight(
                insight_id=insight_id,
                values=values,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def delete_insight(self, insight_id: str) -> dict[str, Any]:
        """Delete insight record through InsightService."""

        tool_name = "delete_insight"

        try:
            data = self._insight_service.delete_insight(insight_id)
            return self._success(tool_name, {"deleted": data})
        except Exception as exc:
            return self._failure(tool_name, exc)

    def _success(self, tool_name: str, data: Any) -> dict[str, Any]:
        """Build successful tool response."""

        return {
            "success": True,
            "tool": tool_name,
            "data": data,
            "error": None,
        }

    def _failure(self, tool_name: str, error: Exception) -> dict[str, Any]:
        """Build failed tool response."""

        self._logger.exception("Insight tool failed: %s", tool_name)

        return {
            "success": False,
            "tool": tool_name,
            "data": None,
            "error": {
                "type": error.__class__.__name__,
                "message": str(error),
            },
        }
