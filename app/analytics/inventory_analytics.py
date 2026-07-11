"""
Inventory Analytics
===================

Read-only inventory analytics for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.analytics.base_analytics import BaseAnalytics
from app.repositories.product_repository import ProductRepository


class InventoryAnalytics(BaseAnalytics):
    """
    Read-only analytics for inventory metrics.

    InventoryAnalytics reads product inventory fields through ProductRepository
    and calculates stock KPI without mutating data.
    """

    def __init__(self, product_repository: ProductRepository) -> None:
        """
        Initialize inventory analytics.

        Args:
            product_repository: Repository used to read product inventory data.
        """

        super().__init__()
        self._product_repository = product_repository

    def get_inventory_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """
        Get inventory summary for a business.

        Args:
            business_id: Business identifier.
            limit: Maximum number of product records read.

        Returns:
            Inventory summary payload.
        """

        products = self._get_products(
            business_id=business_id,
            limit=limit,
        )
        status_distribution = self.get_stock_status_distribution(
            business_id=business_id,
            limit=limit,
        )

        total_stock_units = self._sum_numeric(products, "stock")
        inventory_cost_value = sum(
            self._to_int(product.get("stock")) * self._to_int(product.get("cost_price"))
            for product in products
        )
        inventory_selling_value = sum(
            self._to_int(product.get("stock"))
            * self._to_int(product.get("selling_price"))
            for product in products
        )

        return {
            "business_id": str(business_id),
            "total_inventory_items": len(products),
            "total_stock_units": total_stock_units,
            "low_stock_count": status_distribution.get("low_stock", 0),
            "out_of_stock_count": status_distribution.get("out_of_stock", 0),
            "safe_stock_count": status_distribution.get("safe", 0),
            "inventory_cost_value": inventory_cost_value,
            "inventory_selling_value": inventory_selling_value,
            "inventory_potential_margin": (
                inventory_selling_value - inventory_cost_value
            ),
            "stock_status_distribution": status_distribution,
        }

    def get_stock_status_distribution(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, int]:
        """
        Count products by stock status.

        Args:
            business_id: Business identifier.
            limit: Maximum number of product records read.

        Returns:
            Stock status distribution.
        """

        products = self._get_products(
            business_id=business_id,
            limit=limit,
        )
        distribution = {
            "out_of_stock": 0,
            "low_stock": 0,
            "safe": 0,
        }

        for product in products:
            distribution[self._get_stock_status(product)] += 1

        return distribution

    def get_low_stock_items(
        self,
        business_id: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        Get low-stock products.

        Args:
            business_id: Business identifier.
            limit: Maximum number of records returned.

        Returns:
            Low-stock product records.
        """

        self._validate_required_text(business_id, field_name="business_id")
        self._validate_positive_int(limit, field_name="limit")

        try:
            records = self._product_repository.list_low_stock(
                business_id=business_id,
                limit=limit,
            )
        except AttributeError:
            products = self._get_products(
                business_id=business_id,
                limit=limit,
            )
            return [
                product
                for product in products
                if self._get_stock_status(product) == "low_stock"
            ]

        products = self._ensure_list(records, field_name="low_stock_products")

        return self._filter_by_business_id(products, business_id)

    def get_out_of_stock_items(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> list[dict[str, Any]]:
        """
        Get out-of-stock products.

        Args:
            business_id: Business identifier.
            limit: Maximum number of product records read.

        Returns:
            Out-of-stock product records.
        """

        products = self._get_products(
            business_id=business_id,
            limit=limit,
        )

        return [
            product
            for product in products
            if self._get_stock_status(product) == "out_of_stock"
        ]

    def get_inventory_value_by_category(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, int]:
        """
        Calculate inventory selling value by product category.

        Args:
            business_id: Business identifier.
            limit: Maximum number of product records read.

        Returns:
            Inventory selling value by category.
        """

        products = self._get_products(
            business_id=business_id,
            limit=limit,
        )
        values: dict[str, int] = {}

        for product in products:
            category = str(product.get("category") or "uncategorized")
            item_value = self._to_int(product.get("stock")) * self._to_int(
                product.get("selling_price")
            )
            values[category] = values.get(category, 0) + item_value

        return values

    def _get_products(
        self,
        business_id: str,
        limit: int,
    ) -> list[dict[str, Any]]:
        """
        Read active product records for a business.

        Args:
            business_id: Business identifier.
            limit: Maximum number of product records read.

        Returns:
            Product records.
        """

        self._validate_required_text(business_id, field_name="business_id")
        self._validate_positive_int(limit, field_name="limit")

        try:
            records = self._product_repository.list_active(
                business_id=business_id,
                limit=limit,
            )
        except AttributeError:
            records = self._product_repository.list(limit=limit)

        products = self._ensure_list(records, field_name="products")

        return self._filter_by_business_id(products, business_id)

    def _get_stock_status(self, product: Mapping[str, Any]) -> str:
        """
        Get stock status for a product.

        Args:
            product: Product record.

        Returns:
            Stock status.
        """

        stock = self._to_int(product.get("stock"))
        minimum_stock = self._to_int(product.get("minimum_stock"))

        if stock == 0:
            return "out_of_stock"

        if stock <= minimum_stock:
            return "low_stock"

        return "safe"
