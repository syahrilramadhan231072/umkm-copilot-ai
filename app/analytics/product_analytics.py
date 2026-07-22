"""
Product Analytics
=================

Read-only product performance analytics for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from app.analytics.base_analytics import BaseAnalytics
from app.repositories.product_repository import ProductRepository
from app.repositories.transaction_repository import TransactionRepository


class ProductAnalytics(BaseAnalytics):
    """
    Read-only analytics for product metrics.

    ProductAnalytics combines product and transaction reads to calculate product
    performance without mutating data.
    """

    def __init__(
        self,
        product_repository: ProductRepository,
        transaction_repository: TransactionRepository,
    ) -> None:
        """
        Initialize product analytics.

        Args:
            product_repository: Repository used to read products.
            transaction_repository: Repository used to read transactions.
        """

        super().__init__()
        self._product_repository = product_repository
        self._transaction_repository = transaction_repository

    def get_product_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """
        Get product summary for a business.

        Args:
            business_id: Business identifier.
            limit: Maximum number of records read.

        Returns:
            Product summary payload.
        """

        products = self._get_products(
            business_id=business_id,
            limit=limit,
            active_only=False,
        )
        active_products = [product for product in products if product.get("is_active") is True]
        inactive_products = [
            product for product in products if product.get("is_active") is not True
        ]

        return {
            "business_id": str(business_id),
            "total_products": len(products),
            "active_products": len(active_products),
            "inactive_products": len(inactive_products),
            "products_by_category": self._group_count(
                products,
                "category",
                default="uncategorized",
            ),
            "average_selling_price": self._average_numeric(
                products,
                "selling_price",
            ),
            "average_cost_price": self._average_numeric(
                products,
                "cost_price",
            ),
        }

    def get_products_by_category(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, int]:
        """
        Count products by category.

        Args:
            business_id: Business identifier.
            limit: Maximum number of product records read.

        Returns:
            Product count by category.
        """

        products = self._get_products(
            business_id=business_id,
            limit=limit,
            active_only=False,
        )

        return self._group_count(
            products,
            "category",
            default="uncategorized",
        )

    def get_product_revenue(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, int]:
        """
        Calculate revenue by product.

        Args:
            business_id: Business identifier.
            limit: Maximum number of transaction records read.

        Returns:
            Revenue by product name.
        """

        transactions = self._get_transactions(
            business_id=business_id,
            limit=limit,
        )
        completed = self._only_completed_transactions(transactions)

        return self._group_sum(
            completed,
            group_field="product_name",
            value_field="total_price",
        )

    def get_product_quantity_sold(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, int]:
        """
        Calculate quantity sold by product.

        Args:
            business_id: Business identifier.
            limit: Maximum number of transaction records read.

        Returns:
            Quantity sold by product name.
        """

        transactions = self._get_transactions(
            business_id=business_id,
            limit=limit,
        )
        completed = self._only_completed_transactions(transactions)

        return self._group_sum(
            completed,
            group_field="product_name",
            value_field="quantity",
        )

    def get_top_products_by_revenue(
        self,
        business_id: str,
        top_n: int = 5,
        limit: int = 1000,
    ) -> list[dict[str, Any]]:
        """
        Get top products by revenue.

        Args:
            business_id: Business identifier.
            top_n: Number of products returned.
            limit: Maximum number of transaction records read.

        Returns:
            Top products by revenue.
        """

        self._validate_positive_int(top_n, field_name="top_n")

        return self._sort_mapping_desc(
            self.get_product_revenue(
                business_id=business_id,
                limit=limit,
            ),
            limit=top_n,
        )

    def get_top_products_by_quantity(
        self,
        business_id: str,
        top_n: int = 5,
        limit: int = 1000,
    ) -> list[dict[str, Any]]:
        """
        Get top products by quantity sold.

        Args:
            business_id: Business identifier.
            top_n: Number of products returned.
            limit: Maximum number of transaction records read.

        Returns:
            Top products by quantity sold.
        """

        self._validate_positive_int(top_n, field_name="top_n")

        return self._sort_mapping_desc(
            self.get_product_quantity_sold(
                business_id=business_id,
                limit=limit,
            ),
            limit=top_n,
        )

    def get_product_margin_estimate(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, int]:
        """
        Estimate margin by product using transaction quantity and product cost.

        Args:
            business_id: Business identifier.
            limit: Maximum number of records read.

        Returns:
            Estimated margin by product name.
        """

        products = self._get_products(
            business_id=business_id,
            limit=limit,
            active_only=False,
        )
        transactions = self._only_completed_transactions(
            self._get_transactions(
                business_id=business_id,
                limit=limit,
            )
        )

        product_cost_by_name = {
            str(product.get("name")): self._to_int(product.get("cost_price"))
            for product in products
        }
        margin_by_product: dict[str, int] = {}

        for transaction in transactions:
            product_name = str(transaction.get("product_name") or "unknown")
            quantity = self._to_int(transaction.get("quantity"))
            revenue = self._to_int(transaction.get("total_price"))
            cost = product_cost_by_name.get(product_name, 0) * quantity
            margin_by_product[product_name] = (
                margin_by_product.get(product_name, 0) + revenue - cost
            )

        return margin_by_product

    def _get_products(
        self,
        business_id: str,
        limit: int,
        *,
        active_only: bool,
    ) -> list[dict[str, Any]]:
        """
        Read product records for a business.

        Args:
            business_id: Business identifier.
            limit: Maximum number of product records read.
            active_only: Whether to read only active products.

        Returns:
            Product records.
        """

        self._validate_required_text(business_id, field_name="business_id")
        self._validate_positive_int(limit, field_name="limit")

        if active_only and hasattr(self._product_repository, "list_active"):
            records = self._product_repository.list_active(
                business_id=business_id,
                limit=limit,
            )
        else:
            records = self._product_repository.list(limit=limit)

        products = self._ensure_list(records, field_name="products")

        return self._filter_by_business_id(products, business_id)

    def _get_transactions(
        self,
        business_id: str,
        limit: int,
    ) -> list[dict[str, Any]]:
        """
        Read transaction records for a business.

        Args:
            business_id: Business identifier.
            limit: Maximum number of transaction records read.

        Returns:
            Transaction records.
        """

        self._validate_required_text(business_id, field_name="business_id")
        self._validate_positive_int(limit, field_name="limit")

        try:
            records = self._transaction_repository.list(
                business_id=business_id,
                limit=limit,
            )
        except TypeError:
            records = self._transaction_repository.list(limit=limit)

        transactions = self._ensure_list(records, field_name="transactions")

        return self._filter_by_business_id(transactions, business_id)
