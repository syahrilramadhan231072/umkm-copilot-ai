"""
Analytics Tools
===============

Thin adapter tools for read-only analytics use cases.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from app.analytics.customer_analytics import CustomerAnalytics
from app.analytics.dashboard_analytics import DashboardAnalytics
from app.analytics.inventory_analytics import InventoryAnalytics
from app.analytics.product_analytics import ProductAnalytics
from app.analytics.sales_analytics import SalesAnalytics
from app.utils.logger import logger


class AnalyticsTools:
    """
    Tool adapter for Analytics Layer.

    AnalyticsTools exposes read-only analytics operations to upper layers without
    direct repository access or metric calculation inside the tool.
    """

    def __init__(
        self,
        sales_analytics: SalesAnalytics,
        inventory_analytics: InventoryAnalytics,
        product_analytics: ProductAnalytics,
        customer_analytics: CustomerAnalytics,
        dashboard_analytics: DashboardAnalytics,
    ) -> None:
        """Initialize analytics tools."""

        self._sales_analytics = sales_analytics
        self._inventory_analytics = inventory_analytics
        self._product_analytics = product_analytics
        self._customer_analytics = customer_analytics
        self._dashboard_analytics = dashboard_analytics
        self._logger = logger

    def get_sales_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Get sales summary through SalesAnalytics."""

        tool_name = "get_sales_summary"

        try:
            data = self._sales_analytics.get_sales_summary(
                business_id=business_id,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def get_inventory_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Get inventory summary through InventoryAnalytics."""

        tool_name = "get_inventory_summary"

        try:
            data = self._inventory_analytics.get_inventory_summary(
                business_id=business_id,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def get_product_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Get product summary through ProductAnalytics."""

        tool_name = "get_product_summary"

        try:
            data = self._product_analytics.get_product_summary(
                business_id=business_id,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def get_customer_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Get customer summary through CustomerAnalytics."""

        tool_name = "get_customer_summary"

        try:
            data = self._customer_analytics.get_customer_summary(
                business_id=business_id,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def build_dashboard_payload(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Build dashboard payload through DashboardAnalytics."""

        tool_name = "build_dashboard_payload"

        try:
            data = self._dashboard_analytics.build_dashboard_payload(
                business_id=business_id,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def get_top_products_by_revenue(
        self,
        business_id: str,
        top_n: int = 5,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Get top products by revenue through SalesAnalytics."""

        tool_name = "get_top_products_by_revenue"

        try:
            data = self._sales_analytics.get_top_products_by_revenue(
                business_id=business_id,
                top_n=top_n,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def build_dashboard_alerts(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Build dashboard alerts through DashboardAnalytics."""

        tool_name = "build_dashboard_alerts"

        try:
            data = self._dashboard_analytics.build_dashboard_alerts(
                business_id=business_id,
                limit=limit,
            )
            return self._success(tool_name, data)
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

        self._logger.exception("Analytics tool failed: %s", tool_name)

        return {
            "success": False,
            "tool": tool_name,
            "data": None,
            "error": {
                "type": error.__class__.__name__,
                "message": str(error),
            },
        }
