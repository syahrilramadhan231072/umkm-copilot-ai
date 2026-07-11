"""
Sales Analytics
===============

Read-only sales analytics for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from app.analytics.base_analytics import BaseAnalytics
from app.repositories.transaction_repository import TransactionRepository


class SalesAnalytics(BaseAnalytics):
    """
    Read-only analytics for sales metrics.

    SalesAnalytics reads transaction records through TransactionRepository and
    calculates sales KPI without creating, updating, or deleting data.
    """

    def __init__(self, transaction_repository: TransactionRepository) -> None:
        """
        Initialize sales analytics.

        Args:
            transaction_repository: Repository used to read transactions.
        """

        super().__init__()
        self._transaction_repository = transaction_repository

    def get_sales_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """
        Get sales summary for a business.

        Args:
            business_id: Business identifier.
            limit: Maximum number of transaction records read.

        Returns:
            Sales summary payload.
        """

        transactions = self._get_transactions(
            business_id=business_id,
            limit=limit,
        )
        completed = self._only_completed_transactions(transactions)

        total_revenue = self._sum_numeric(completed, "total_price")
        total_quantity = self._sum_numeric(completed, "quantity")
        transaction_count = len(completed)

        return {
            "business_id": str(business_id),
            "transaction_count": transaction_count,
            "all_status_transaction_count": len(transactions),
            "total_revenue": total_revenue,
            "total_quantity_sold": total_quantity,
            "average_order_value": self._safe_divide(
                total_revenue,
                transaction_count,
            ),
            "average_item_per_transaction": self._safe_divide(
                total_quantity,
                transaction_count,
            ),
            "sales_by_status": self.get_sales_by_status(
                business_id=business_id,
                limit=limit,
            ),
            "sales_by_payment_method": self.get_sales_by_payment_method(
                business_id=business_id,
                limit=limit,
            ),
        }

    def get_sales_by_status(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, int]:
        """
        Count transactions by status.

        Args:
            business_id: Business identifier.
            limit: Maximum number of transaction records read.

        Returns:
            Count by transaction status.
        """

        transactions = self._get_transactions(
            business_id=business_id,
            limit=limit,
        )

        return self._group_count(transactions, "status", default="completed")

    def get_sales_by_payment_method(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, int]:
        """
        Count transactions by payment method.

        Args:
            business_id: Business identifier.
            limit: Maximum number of transaction records read.

        Returns:
            Count by payment method.
        """

        transactions = self._get_transactions(
            business_id=business_id,
            limit=limit,
        )
        completed = self._only_completed_transactions(transactions)

        return self._group_count(
            completed,
            "payment_method",
            default="unknown",
        )

    def get_revenue_by_payment_method(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, int]:
        """
        Calculate revenue by payment method.

        Args:
            business_id: Business identifier.
            limit: Maximum number of transaction records read.

        Returns:
            Revenue by payment method.
        """

        transactions = self._get_transactions(
            business_id=business_id,
            limit=limit,
        )
        completed = self._only_completed_transactions(transactions)

        return self._group_sum(
            completed,
            group_field="payment_method",
            value_field="total_price",
        )

    def get_revenue_by_product(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, int]:
        """
        Calculate revenue by product name.

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

    def get_quantity_by_product(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, int]:
        """
        Calculate sold quantity by product name.

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
            Top product records.
        """

        self._validate_positive_int(top_n, field_name="top_n")
        revenue_by_product = self.get_revenue_by_product(
            business_id=business_id,
            limit=limit,
        )

        return self._sort_mapping_desc(revenue_by_product, limit=top_n)

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
            Top product records.
        """

        self._validate_positive_int(top_n, field_name="top_n")
        quantity_by_product = self.get_quantity_by_product(
            business_id=business_id,
            limit=limit,
        )

        return self._sort_mapping_desc(quantity_by_product, limit=top_n)

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
