"""
Product Service
===============

Service layer for product use cases in UMKM Copilot AI.
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.repositories.product_repository import ProductRepository
from app.services.base_service import BaseService
from app.utils.logger import logger


class ProductService(BaseService):
    """Coordinate product use cases through ProductRepository."""

    VALID_UNITS = {"pcs", "cup", "bottle", "pack", "kg", "gram", "liter"}

    def __init__(self, product_repository: ProductRepository) -> None:
        """Initialize service with injected product repository."""
        super().__init__()
        self._product_repository = product_repository
        self._logger = logger

    def create_product(
        self,
        business_id: str,
        product_data: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Create a product for a business."""
        self._required_text(business_id, "business_id")
        data = self._to_dict(product_data, "product_data")
        data["business_id"] = str(business_id)
        self._validate_product(data, require_name=True)
        self._ensure_unique_identifiers(data)

        self._logger.info("Creating product for business_id=%s.", business_id)
        created = self._product_repository.create(data)
        return self._ensure_dict(created, "Product creation failed.")

    def get_product(self, product_id: str) -> dict[str, Any]:
        """Return product by ID."""
        self._required_text(product_id, "product_id")
        product = self._product_repository.get(product_id)
        if product is None:
            raise LookupError(f"Product not found: {product_id}.")
        return product

    def list_products(self, limit: int = 100) -> list[dict[str, Any]]:
        """Return product records."""
        self._validate_limit(limit)
        return self._ensure_list(self._product_repository.list(limit=limit))

    def list_active_products(
        self,
        business_id: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return active products for a business."""
        self._required_text(business_id, "business_id")
        self._validate_limit(limit)
        return self._product_repository.list_active(business_id, limit=limit)

    def list_low_stock_products(
        self,
        business_id: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return low-stock products for a business."""
        self._required_text(business_id, "business_id")
        self._validate_limit(limit)
        return self._product_repository.list_low_stock(business_id, limit=limit)

    def search_products(
        self,
        business_id: str,
        keyword: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Search products by keyword."""
        self._required_text(business_id, "business_id")
        self._required_text(keyword, "keyword")
        self._validate_limit(limit)
        return self._product_repository.search(business_id, keyword, limit=limit)

    def update_product(
        self,
        product_id: str,
        values: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Update product values."""
        self._required_text(product_id, "product_id")
        update_values = self._to_dict(values, "values")
        existing = self.get_product(product_id)
        self._validate_product(update_values, require_name=False)

        validation_values = dict(update_values)
        validation_values["business_id"] = existing["business_id"]
        self._ensure_unique_identifiers(
            validation_values,
            current_product_id=str(product_id),
        )

        self._logger.info("Updating product_id=%s.", product_id)
        updated = self._product_repository.update(product_id, update_values)
        return self._ensure_dict(updated, "Product update failed.")

    def update_stock(self, product_id: str, stock: int) -> dict[str, Any]:
        """Update product stock."""
        self._required_text(product_id, "product_id")
        self._non_negative_int(stock, "stock")
        self.get_product(product_id)
        return self._product_repository.update_stock(product_id, stock)

    def activate_product(self, product_id: str) -> dict[str, Any]:
        """Activate a product."""
        return self.update_product(product_id, {"is_active": True})

    def deactivate_product(self, product_id: str) -> dict[str, Any]:
        """Deactivate a product."""
        return self.update_product(product_id, {"is_active": False})

    def delete_product(self, product_id: str) -> bool:
        """Delete product by ID."""
        self._required_text(product_id, "product_id")
        self.get_product(product_id)
        self._logger.info("Deleting product_id=%s.", product_id)
        self._product_repository.delete(product_id)
        return True

    def product_exists(self, product_id: str) -> bool:
        """Return whether product exists."""
        self._required_text(product_id, "product_id")
        return bool(self._product_repository.exists(product_id))

    def count_products(self) -> int:
        """Return total product records."""
        total = self._product_repository.count()
        if not isinstance(total, int):
            raise RuntimeError("Product count operation failed.")
        return total

    def count_active_products(self, business_id: str) -> int:
        """Return active product count for a business."""
        self._required_text(business_id, "business_id")
        total = self._product_repository.count_active(business_id)
        if not isinstance(total, int):
            raise RuntimeError("Active product count operation failed.")
        return total

    def _validate_product(
        self,
        values: Mapping[str, Any],
        *,
        require_name: bool,
    ) -> None:
        """Validate product values."""
        if require_name or "name" in values:
            self._required_text(values.get("name"), "name")

        for field_name in ("selling_price", "cost_price", "stock", "minimum_stock"):
            if field_name in values:
                self._non_negative_int(values[field_name], field_name)

        if "unit" in values and str(values["unit"]) not in self.VALID_UNITS:
            raise ValueError(f"unit must be one of {sorted(self.VALID_UNITS)}.")

        if "is_active" in values and not isinstance(values["is_active"], bool):
            raise ValueError("is_active must be a boolean.")

    def _ensure_unique_identifiers(
        self,
        values: Mapping[str, Any],
        *,
        current_product_id: str | None = None,
    ) -> None:
        """Ensure SKU and barcode do not belong to another product."""
        business_id = values.get("business_id")
        if business_id is None:
            return

        for field_name, getter_name in (
            ("sku", "get_by_sku"),
            ("barcode", "get_by_barcode"),
        ):
            field_value = values.get(field_name)
            if not field_value:
                continue
            getter = getattr(self._product_repository, getter_name)
            existing = getter(business_id, str(field_value))
            if existing is None:
                continue
            if current_product_id and str(existing.get("id")) == current_product_id:
                continue
            raise RuntimeError(f"Product {field_name} already exists.")

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

    def _non_negative_int(self, value: Any, field_name: str) -> None:
        """Validate non-negative integer value."""
        if not isinstance(value, int) or value < 0:
            raise ValueError(f"{field_name} must be a non-negative integer.")

    def _validate_limit(self, limit: int) -> None:
        """Validate list limit."""
        if not isinstance(limit, int) or limit <= 0:
            raise ValueError("limit must be a positive integer.")

    def _ensure_dict(self, value: Any, message: str) -> dict[str, Any]:
        """Ensure repository result is a dictionary."""
        if not isinstance(value, dict):
            raise RuntimeError(message)
        return value

    def _ensure_list(self, value: Any) -> list[dict[str, Any]]:
        """Ensure repository result is a list."""
        if not isinstance(value, list):
            raise RuntimeError("Product list operation failed.")
        return value
