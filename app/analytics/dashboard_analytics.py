"""
Dashboard Analytics
===================

Read-only dashboard analytics aggregator for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from app.analytics.base_analytics import BaseAnalytics
from app.analytics.customer_analytics import CustomerAnalytics
from app.analytics.inventory_analytics import InventoryAnalytics
from app.analytics.product_analytics import ProductAnalytics
from app.analytics.sales_analytics import SalesAnalytics


class DashboardAnalytics(BaseAnalytics):
    """
    Read-only dashboard analytics aggregator.

    DashboardAnalytics combines outputs from other analytics classes into a
    structured dashboard payload. It does not write data and does not contain UI
    logic.
    """

    def __init__(
        self,
        sales_analytics: SalesAnalytics,
        inventory_analytics: InventoryAnalytics,
        product_analytics: ProductAnalytics,
        customer_analytics: CustomerAnalytics,
    ) -> None:
        """
        Initialize dashboard analytics.

        Args:
            sales_analytics: Sales analytics dependency.
            inventory_analytics: Inventory analytics dependency.
            product_analytics: Product analytics dependency.
            customer_analytics: Customer analytics dependency.
        """

        super().__init__()
        self._sales_analytics = sales_analytics
        self._inventory_analytics = inventory_analytics
        self._product_analytics = product_analytics
        self._customer_analytics = customer_analytics

    def build_dashboard_payload(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """
        Build complete dashboard payload.

        Args:
            business_id: Business identifier.
            limit: Maximum number of records read by each analytics component.

        Returns:
            Dashboard payload.
        """

        self._validate_required_text(business_id, field_name="business_id")
        self._validate_positive_int(limit, field_name="limit")

        sales_summary = self._sales_analytics.get_sales_summary(
            business_id=business_id,
            limit=limit,
        )
        inventory_summary = self._inventory_analytics.get_inventory_summary(
            business_id=business_id,
            limit=limit,
        )
        product_summary = self._product_analytics.get_product_summary(
            business_id=business_id,
            limit=limit,
        )
        customer_summary = self._customer_analytics.get_customer_summary(
            business_id=business_id,
            limit=limit,
        )

        return {
            "business_id": str(business_id),
            "kpi_cards": self.build_kpi_cards(
                business_id=business_id,
                limit=limit,
            ),
            "sales_summary": sales_summary,
            "inventory_summary": inventory_summary,
            "product_summary": product_summary,
            "customer_summary": customer_summary,
            "alerts": self.build_dashboard_alerts(
                business_id=business_id,
                limit=limit,
            ),
            "top_products_by_revenue": (
                self._sales_analytics.get_top_products_by_revenue(
                    business_id=business_id,
                    top_n=5,
                    limit=limit,
                )
            ),
            "top_products_by_quantity": (
                self._sales_analytics.get_top_products_by_quantity(
                    business_id=business_id,
                    top_n=5,
                    limit=limit,
                )
            ),
        }

    def build_kpi_cards(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> list[dict[str, Any]]:
        """
        Build dashboard KPI cards.

        Args:
            business_id: Business identifier.
            limit: Maximum number of records read.

        Returns:
            KPI card payloads.
        """

        sales_summary = self._sales_analytics.get_sales_summary(
            business_id=business_id,
            limit=limit,
        )
        inventory_summary = self._inventory_analytics.get_inventory_summary(
            business_id=business_id,
            limit=limit,
        )
        product_summary = self._product_analytics.get_product_summary(
            business_id=business_id,
            limit=limit,
        )
        customer_summary = self._customer_analytics.get_customer_summary(
            business_id=business_id,
            limit=limit,
        )

        return [
            {
                "key": "total_revenue",
                "label": "Total Revenue",
                "value": sales_summary["total_revenue"],
            },
            {
                "key": "transaction_count",
                "label": "Completed Transactions",
                "value": sales_summary["transaction_count"],
            },
            {
                "key": "active_products",
                "label": "Active Products",
                "value": product_summary["active_products"],
            },
            {
                "key": "low_stock_count",
                "label": "Low Stock Items",
                "value": inventory_summary["low_stock_count"],
            },
            {
                "key": "estimated_unique_customers",
                "label": "Estimated Unique Customers",
                "value": customer_summary["estimated_unique_customers"],
            },
        ]

    def build_dashboard_alerts(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> list[dict[str, Any]]:
        """
        Build dashboard alert payloads.

        Args:
            business_id: Business identifier.
            limit: Maximum number of records read.

        Returns:
            Dashboard alerts.
        """

        inventory_summary = self._inventory_analytics.get_inventory_summary(
            business_id=business_id,
            limit=limit,
        )
        sales_summary = self._sales_analytics.get_sales_summary(
            business_id=business_id,
            limit=limit,
        )
        alerts: list[dict[str, Any]] = []

        if inventory_summary["out_of_stock_count"] > 0:
            alerts.append(
                {
                    "level": "critical",
                    "category": "inventory",
                    "message": "There are out-of-stock products.",
                    "value": inventory_summary["out_of_stock_count"],
                }
            )

        if inventory_summary["low_stock_count"] > 0:
            alerts.append(
                {
                    "level": "warning",
                    "category": "inventory",
                    "message": "There are low-stock products.",
                    "value": inventory_summary["low_stock_count"],
                }
            )

        if sales_summary["transaction_count"] == 0:
            alerts.append(
                {
                    "level": "info",
                    "category": "sales",
                    "message": "No completed sales transactions found.",
                    "value": 0,
                }
            )

        return alerts
