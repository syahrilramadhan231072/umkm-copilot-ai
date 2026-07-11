"""
Marketing Tools
===============

Thin adapter tools for marketing use cases.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.services.marketing_service import MarketingService
from app.utils.logger import logger


class MarketingTools:
    """
    Tool adapter for MarketingService.

    MarketingTools manages marketing history records and marketing context
    without generating AI copy, prompts, or LLM output.
    """

    def __init__(self, marketing_service: MarketingService) -> None:
        """Initialize marketing tools."""

        self._marketing_service = marketing_service
        self._logger = logger

    def create_marketing_record(
        self,
        business_id: str,
        marketing_data: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Create marketing record through MarketingService."""

        tool_name = "create_marketing_record"

        try:
            data = self._marketing_service.create_marketing_record(
                business_id=business_id,
                marketing_data=marketing_data,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def get_marketing_record(self, marketing_id: str) -> dict[str, Any]:
        """Get marketing record through MarketingService."""

        tool_name = "get_marketing_record"

        try:
            data = self._marketing_service.get_marketing_record(marketing_id)
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def list_marketing_history(
        self,
        business_id: str | None = None,
        limit: int = 100,
    ) -> dict[str, Any]:
        """List marketing history through MarketingService."""

        tool_name = "list_marketing_history"

        try:
            data = self._marketing_service.list_marketing_history(
                business_id=business_id,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def search_marketing_captions(
        self,
        business_id: str,
        keyword: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Search marketing captions through MarketingService."""

        tool_name = "search_marketing_captions"

        try:
            data = self._marketing_service.search_marketing_captions(
                business_id=business_id,
                keyword=keyword,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def build_product_marketing_context(
        self,
        product_id: str,
    ) -> dict[str, Any]:
        """Build product marketing context through MarketingService."""

        tool_name = "build_product_marketing_context"

        try:
            data = self._marketing_service.build_product_marketing_context(
                product_id,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def update_marketing_record(
        self,
        marketing_id: str,
        values: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Update marketing record through MarketingService."""

        tool_name = "update_marketing_record"

        try:
            data = self._marketing_service.update_marketing_record(
                marketing_id=marketing_id,
                values=values,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def delete_marketing_record(self, marketing_id: str) -> dict[str, Any]:
        """Delete marketing record through MarketingService."""

        tool_name = "delete_marketing_record"

        try:
            data = self._marketing_service.delete_marketing_record(marketing_id)
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

        self._logger.exception("Marketing tool failed: %s", tool_name)

        return {
            "success": False,
            "tool": tool_name,
            "data": None,
            "error": {
                "type": error.__class__.__name__,
                "message": str(error),
            },
        }
