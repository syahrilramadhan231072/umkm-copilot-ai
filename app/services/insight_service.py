"""
Insight Service
===============

Service layer for insight data use cases in UMKM Copilot AI.
"""

from __future__ import annotations

from typing import Any, Mapping

from app.repositories.insights_repository import InsightsRepository
from app.repositories.marketing_repository import MarketingRepository
from app.repositories.product_repository import ProductRepository
from app.repositories.transaction_repository import TransactionRepository
from app.services.base_service import BaseService
from app.utils.logger import logger


class InsightService(BaseService):
    """Coordinate insight use cases and structured insight context."""

    VALID_CATEGORIES = {"sales", "marketing", "inventory", "customer", "general"}

    def __init__(
        self,
        insights_repository: InsightsRepository,
        product_repository: ProductRepository,
        transaction_repository: TransactionRepository,
        marketing_repository: MarketingRepository,
    ) -> None:
        """Initialize service with injected repositories."""
        super().__init__()
        self._insights_repository = insights_repository
        self._product_repository = product_repository
        self._transaction_repository = transaction_repository
        self._marketing_repository = marketing_repository
        self._logger = logger

    def create_insight_record(
        self,
        business_id: str,
        insight_data: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Create insight record."""
        self._required_text(business_id, "business_id")
        data = self._to_dict(insight_data, "insight_data")
        data["business_id"] = str(business_id)
        self._validate_insight(data, require_all=True)

        created = self._insights_repository.create(data)
        if not isinstance(created, dict):
            raise RuntimeError("Insight record creation failed.")
        return created

    def get_insight(self, insight_id: str) -> dict[str, Any]:
        """Return insight record by ID."""
        self._required_text(insight_id, "insight_id")
        insight = self._insights_repository.get(insight_id)
        if insight is None:
            raise LookupError(f"Insight not found: {insight_id}.")
        return insight

    def list_insights(
        self,
        business_id: str | None = None,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return insight records."""
        if business_id is not None:
            self._required_text(business_id, "business_id")
        self._validate_limit(limit)
        return self._insights_repository.list(business_id=business_id, limit=limit)

    def list_recent_insights(
        self,
        business_id: str,
        limit: int = 20,
    ) -> list[dict[str, Any]]:
        """Return recent insight records."""
        self._required_text(business_id, "business_id")
        self._validate_limit(limit)
        return self._insights_repository.list_recent(business_id, limit=limit)

    def list_insights_by_category(
        self,
        business_id: str,
        insight_category: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return insight records by category."""
        self._required_text(business_id, "business_id")
        self._validate_category(insight_category)
        self._validate_limit(limit)
        return self._insights_repository.list_by_category(
            business_id,
            insight_category,
            limit=limit,
        )

    def search_insight_titles(
        self,
        business_id: str,
        keyword: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Search insight titles by keyword."""
        self._required_text(business_id, "business_id")
        self._required_text(keyword, "keyword")
        self._validate_limit(limit)
        return self._insights_repository.search_title(
            business_id,
            keyword,
            limit=limit,
        )

    def update_insight(
        self,
        insight_id: str,
        values: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Update insight record."""
        self._required_text(insight_id, "insight_id")
        update_values = self._to_dict(values, "values")
        self._validate_insight(update_values, require_all=False)
        self.get_insight(insight_id)

        updated = self._insights_repository.update(insight_id, update_values)
        if not isinstance(updated, dict):
            raise RuntimeError("Insight record update failed.")
        return updated

    def delete_insight(self, insight_id: str) -> bool:
        """Delete insight record by ID."""
        self._required_text(insight_id, "insight_id")
        self.get_insight(insight_id)
        self._insights_repository.delete(insight_id)
        return True

    def count_insights(self, business_id: str | None = None) -> int:
        """Return insight record count."""
        if business_id is not None:
            self._required_text(business_id, "business_id")
        total = self._insights_repository.count(business_id=business_id)
        if not isinstance(total, int):
            raise RuntimeError("Insight count operation failed.")
        return total

    def build_business_insight_context(
        self,
        business_id: str,
        limit: int = 20,
    ) -> dict[str, Any]:
        """Return structured business context without AI reasoning."""
        self._required_text(business_id, "business_id")
        self._validate_limit(limit)

        return {
            "business_id": str(business_id),
            "products": self._product_repository.list_active(business_id, limit=limit),
            "low_stock_products": self._product_repository.list_low_stock(
                business_id,
                limit=limit,
            ),
            "transactions": self._list_transactions(business_id, limit),
            "marketing_history": self._marketing_repository.list_recent(
                business_id,
                limit=limit,
            ),
            "recent_insights": self._insights_repository.list_recent(
                business_id,
                limit=limit,
            ),
        }

    def _list_transactions(self, business_id: str, limit: int) -> list[dict[str, Any]]:
        """Return transactions with repository signature compatibility."""
        try:
            records = self._transaction_repository.list(
                business_id=business_id,
                limit=limit,
            )
        except TypeError:
            records = self._transaction_repository.list(limit=limit)
        return [
            record
            for record in records
            if str(record.get("business_id")) == str(business_id)
        ]

    def _validate_insight(
        self,
        values: Mapping[str, Any],
        *,
        require_all: bool,
    ) -> None:
        """Validate insight record values."""
        if require_all:
            self._validate_category(str(values.get("insight_category", "general")))
            self._required_text(values.get("title"), "title")
            self._required_text(values.get("content"), "content")

        if "insight_category" in values:
            self._validate_category(str(values["insight_category"]))
        if "title" in values:
            self._required_text(values.get("title"), "title")
        if "content" in values:
            self._required_text(values.get("content"), "content")

    def _validate_category(self, value: str) -> None:
        """Validate insight category."""
        if value not in self.VALID_CATEGORIES:
            raise ValueError(
                f"insight_category must be one of {sorted(self.VALID_CATEGORIES)}."
            )

    def _to_dict(self, value: Mapping[str, Any], field_name: str) -> dict[str, Any]:
        """Convert mapping input into a non-empty dictionary."""
        if not isinstance(value, Mapping):
            raise ValueError(f"{field_name} must be a mapping.")
        result = dict(value)
        if not result:
            raise ValueError(f"{field_name} cannot be empty.")
        return result

    def _required_text(self, value: Any, field_name: str) -> str:
        """Validate and return required text value."""
        if value is None:
            raise ValueError(f"{field_name} is required.")
        text = str(value).strip()
        if not text:
            raise ValueError(f"{field_name} cannot be empty.")
        return text

    def _validate_limit(self, limit: int) -> None:
        """Validate list limit."""
        if not isinstance(limit, int) or limit <= 0:
            raise ValueError("limit must be a positive integer.")
