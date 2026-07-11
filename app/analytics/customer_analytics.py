"""
Customer Analytics
==================

Read-only customer analytics for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.analytics.base_analytics import BaseAnalytics
from app.repositories.transaction_repository import TransactionRepository


class CustomerAnalytics(BaseAnalytics):
    """
    Read-only analytics for customer-related metrics.

    CustomerAnalytics derives customer metrics from transaction records. It is
    safe when explicit customer fields are unavailable.
    """

    CUSTOMER_ID_FIELDS = (
        "customer_id",
        "customer_phone",
        "customer_email",
        "customer_name",
    )

    def __init__(self, transaction_repository: TransactionRepository) -> None:
        """
        Initialize customer analytics.

        Args:
            transaction_repository: Repository used to read transactions.
        """

        super().__init__()
        self._transaction_repository = transaction_repository

    def get_customer_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """
        Get customer summary.

        Args:
            business_id: Business identifier.
            limit: Maximum number of transaction records read.

        Returns:
            Customer summary payload.
        """

        transactions = self._only_completed_transactions(
            self._get_transactions(
                business_id=business_id,
                limit=limit,
            )
        )
        customer_keys = [
            self._extract_customer_key(transaction) for transaction in transactions
        ]
        known_customer_keys = [key for key in customer_keys if key != "anonymous"]

        return {
            "business_id": str(business_id),
            "transaction_count": len(transactions),
            "estimated_unique_customers": len(set(known_customer_keys)),
            "anonymous_transaction_count": customer_keys.count("anonymous"),
            "customer_fields_available": self._detect_customer_fields(
                transactions,
            ),
            "payment_preference_distribution": self._group_count(
                transactions,
                "payment_method",
                default="unknown",
            ),
            "top_customers_by_revenue": self.get_top_customers_by_revenue(
                business_id=business_id,
                top_n=5,
                limit=limit,
            ),
        }

    def get_revenue_by_customer(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, int]:
        """
        Calculate revenue by customer key.

        Args:
            business_id: Business identifier.
            limit: Maximum number of transaction records read.

        Returns:
            Revenue by customer key.
        """

        transactions = self._only_completed_transactions(
            self._get_transactions(
                business_id=business_id,
                limit=limit,
            )
        )
        revenue_by_customer: dict[str, int] = {}

        for transaction in transactions:
            customer_key = self._extract_customer_key(transaction)
            revenue_by_customer[customer_key] = revenue_by_customer.get(
                customer_key, 0
            ) + self._to_int(transaction.get("total_price"))

        return revenue_by_customer

    def get_purchase_frequency_by_customer(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, int]:
        """
        Count purchases by customer key.

        Args:
            business_id: Business identifier.
            limit: Maximum number of transaction records read.

        Returns:
            Purchase count by customer key.
        """

        transactions = self._only_completed_transactions(
            self._get_transactions(
                business_id=business_id,
                limit=limit,
            )
        )
        frequency: dict[str, int] = {}

        for transaction in transactions:
            customer_key = self._extract_customer_key(transaction)
            frequency[customer_key] = frequency.get(customer_key, 0) + 1

        return frequency

    def get_top_customers_by_revenue(
        self,
        business_id: str,
        top_n: int = 5,
        limit: int = 1000,
    ) -> list[dict[str, Any]]:
        """
        Get top customers by revenue.

        Args:
            business_id: Business identifier.
            top_n: Number of customers returned.
            limit: Maximum number of transaction records read.

        Returns:
            Top customers by revenue.
        """

        self._validate_positive_int(top_n, field_name="top_n")
        revenue = self.get_revenue_by_customer(
            business_id=business_id,
            limit=limit,
        )

        return self._sort_mapping_desc(revenue, limit=top_n)

    def get_payment_preference_distribution(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, int]:
        """
        Count payment preferences from customer transactions.

        Args:
            business_id: Business identifier.
            limit: Maximum number of transaction records read.

        Returns:
            Payment method distribution.
        """

        transactions = self._only_completed_transactions(
            self._get_transactions(
                business_id=business_id,
                limit=limit,
            )
        )

        return self._group_count(
            transactions,
            "payment_method",
            default="unknown",
        )

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

    def _extract_customer_key(self, transaction: Mapping[str, Any]) -> str:
        """
        Extract the most stable available customer key.

        Args:
            transaction: Transaction record.

        Returns:
            Customer key or anonymous.
        """

        for field_name in self.CUSTOMER_ID_FIELDS:
            value = transaction.get(field_name)

            if value is not None and str(value).strip():
                return f"{field_name}:{str(value).strip()}"

        return "anonymous"

    def _detect_customer_fields(
        self,
        transactions: list[Mapping[str, Any]],
    ) -> dict[str, bool]:
        """
        Detect available customer fields in transaction records.

        Args:
            transactions: Transaction records.

        Returns:
            Availability by customer field.
        """

        return {
            field_name: any(
                transaction.get(field_name) is not None
                and str(transaction.get(field_name)).strip() != ""
                for transaction in transactions
            )
            for field_name in self.CUSTOMER_ID_FIELDS
        }
