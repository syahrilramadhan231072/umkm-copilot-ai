"""
Marketing Service
=================

Service layer for marketing history use cases in UMKM Copilot AI.
"""

from __future__ import annotations

from typing import Any, Mapping

from app.repositories.marketing_repository import MarketingRepository
from app.repositories.product_repository import ProductRepository
from app.services.base_service import BaseService
from app.utils.logger import logger


class MarketingService(BaseService):
    """Coordinate marketing history use cases through repositories."""

    def __init__(
        self,
        marketing_repository: MarketingRepository,
        product_repository: ProductRepository,
    ) -> None:
        """Initialize service with injected repositories."""
        super().__init__()
        self._marketing_repository = marketing_repository
        self._product_repository = product_repository
        self._logger = logger

    def create_marketing_record(
        self,
        business_id: str,
        marketing_data: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Create marketing history record."""
        self._required_text(business_id, "business_id")
        data = self._to_dict(marketing_data, "marketing_data")
        data["business_id"] = str(business_id)
        self._validate_marketing(data, require_all=True)
        self._validate_product_reference(data)

        created = self._marketing_repository.create(data)
        if not isinstance(created, dict):
            raise RuntimeError("Marketing record creation failed.")
        return created

    def get_marketing_record(self, marketing_id: str) -> dict[str, Any]:
        """Return marketing record by ID."""
        self._required_text(marketing_id, "marketing_id")
        record = self._marketing_repository.get(marketing_id)
        if record is None:
            raise LookupError(f"Marketing record not found: {marketing_id}.")
        return record

    def list_marketing_history(
        self,
        business_id: str | None = None,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return marketing history records."""
        if business_id is not None:
            self._required_text(business_id, "business_id")
        self._validate_limit(limit)
        return self._marketing_repository.list(business_id=business_id, limit=limit)

    def list_recent_marketing(
        self,
        business_id: str,
        limit: int = 20,
    ) -> list[dict[str, Any]]:
        """Return recent marketing records."""
        self._required_text(business_id, "business_id")
        self._validate_limit(limit)
        return self._marketing_repository.list_recent(business_id, limit=limit)

    def list_marketing_by_platform(
        self,
        business_id: str,
        platform: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return marketing records by platform."""
        self._required_text(business_id, "business_id")
        self._required_text(platform, "platform")
        self._validate_limit(limit)
        return self._marketing_repository.list_by_platform(
            business_id,
            platform,
            limit=limit,
        )

    def list_marketing_by_product(
        self,
        business_id: str,
        product_id: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return marketing records by product."""
        self._required_text(business_id, "business_id")
        self._required_text(product_id, "product_id")
        self._validate_limit(limit)
        return self._marketing_repository.list_by_product(
            business_id,
            product_id,
            limit=limit,
        )

    def search_marketing_captions(
        self,
        business_id: str,
        keyword: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Search marketing captions by keyword."""
        self._required_text(business_id, "business_id")
        self._required_text(keyword, "keyword")
        self._validate_limit(limit)
        return self._marketing_repository.search_caption(
            business_id,
            keyword,
            limit=limit,
        )

    def update_marketing_record(
        self,
        marketing_id: str,
        values: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Update marketing record."""
        self._required_text(marketing_id, "marketing_id")
        update_values = self._to_dict(values, "values")
        self._validate_marketing(update_values, require_all=False)
        self.get_marketing_record(marketing_id)

        updated = self._marketing_repository.update(marketing_id, update_values)
        if not isinstance(updated, dict):
            raise RuntimeError("Marketing record update failed.")
        return updated

    def delete_marketing_record(self, marketing_id: str) -> bool:
        """Delete marketing record by ID."""
        self._required_text(marketing_id, "marketing_id")
        self.get_marketing_record(marketing_id)
        self._marketing_repository.delete(marketing_id)
        return True

    def count_marketing_records(self, business_id: str | None = None) -> int:
        """Return marketing record count."""
        if business_id is not None:
            self._required_text(business_id, "business_id")
        total = self._marketing_repository.count(business_id=business_id)
        if not isinstance(total, int):
            raise RuntimeError("Marketing count operation failed.")
        return total

    def count_marketing_by_platform(self, business_id: str, platform: str) -> int:
        """Return marketing record count for a platform."""
        self._required_text(business_id, "business_id")
        self._required_text(platform, "platform")
        total = self._marketing_repository.count_by_platform(business_id, platform)
        if not isinstance(total, int):
            raise RuntimeError("Marketing platform count operation failed.")
        return total

    def build_product_marketing_context(self, product_id: str) -> dict[str, Any]:
        """Return product context for marketing tools."""
        self._required_text(product_id, "product_id")
        product = self._product_repository.get(product_id)
        if product is None:
            raise LookupError(f"Product not found: {product_id}.")
        return {
            "product_id": str(product["id"]),
            "business_id": str(product["business_id"]),
            "name": product.get("name"),
            "category": product.get("category"),
            "description": product.get("description"),
            "selling_price": product.get("selling_price"),
            "unit": product.get("unit"),
            "stock": product.get("stock"),
            "is_active": product.get("is_active"),
        }

    def _validate_product_reference(self, values: Mapping[str, Any]) -> None:
        """Validate optional referenced product ownership."""
        product_id = values.get("product_id")
        if product_id is None:
            return
        product = self._product_repository.get(product_id)
        if product is None:
            raise LookupError(f"Product not found: {product_id}.")
        if str(product["business_id"]) != str(values["business_id"]):
            raise RuntimeError("Product does not belong to the business.")

    def _validate_marketing(
        self,
        values: Mapping[str, Any],
        *,
        require_all: bool,
    ) -> None:
        """Validate marketing record values."""
        if require_all:
            self._required_text(values.get("platform"), "platform")
            self._required_text(values.get("caption"), "caption")
        for field_name in ("platform", "caption"):
            if field_name in values:
                self._required_text(values.get(field_name), field_name)

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
