"""
Inventory Service
=================

Service layer for inventory use cases in UMKM Copilot AI.
"""

from __future__ import annotations

from typing import Any

from app.repositories.product_repository import ProductRepository
from app.services.base_service import BaseService
from app.utils.logger import logger


class InventoryService(BaseService):
    """Coordinate inventory use cases through ProductRepository."""

    def __init__(self, product_repository: ProductRepository) -> None:
        """Initialize service with injected product repository."""
        super().__init__()
        self._product_repository = product_repository
        self._logger = logger

    def get_inventory_item(self, product_id: str) -> dict[str, Any]:
        """Return inventory item by product ID."""
        self._required_text(product_id, "product_id")
        product = self._product_repository.get(product_id)
        if product is None:
            raise LookupError(f"Product inventory not found: {product_id}.")
        return product

    def list_inventory(
        self,
        business_id: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return active inventory records for a business."""
        self._required_text(business_id, "business_id")
        self._validate_limit(limit)
        return self._product_repository.list_active(business_id, limit=limit)

    def list_low_stock_items(
        self,
        business_id: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return low-stock inventory records."""
        self._required_text(business_id, "business_id")
        self._validate_limit(limit)
        return self._product_repository.list_low_stock(business_id, limit=limit)

    def list_out_of_stock_items(
        self,
        business_id: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return out-of-stock inventory records."""
        return [
            product
            for product in self.list_inventory(business_id, limit=limit)
            if int(product.get("stock", 0)) == 0
        ]

    def get_stock_status(self, product_id: str) -> str:
        """Return stock status for a product."""
        return self._stock_status(self.get_inventory_item(product_id))

    def get_inventory_summary(
        self,
        business_id: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Return inventory summary for a business."""
        records = self.list_inventory(business_id, limit=limit)
        low_stock = [
            item for item in records if self._stock_status(item) == "low_stock"
        ]
        out_of_stock = [
            item for item in records if self._stock_status(item) == "out_of_stock"
        ]

        return {
            "business_id": str(business_id),
            "total_items": len(records),
            "low_stock_count": len(low_stock),
            "out_of_stock_count": len(out_of_stock),
            "safe_stock_count": len(records) - len(low_stock) - len(out_of_stock),
            "inventory_cost_value": sum(
                int(item.get("stock", 0)) * int(item.get("cost_price", 0))
                for item in records
            ),
            "inventory_sales_value": sum(
                int(item.get("stock", 0)) * int(item.get("selling_price", 0))
                for item in records
            ),
            "low_stock_items": low_stock,
            "out_of_stock_items": out_of_stock,
        }

    def has_sufficient_stock(self, product_id: str, quantity: int) -> bool:
        """Return whether product stock is sufficient."""
        self._positive_int(quantity, "quantity")
        product = self.get_inventory_item(product_id)
        return int(product.get("stock", 0)) >= quantity

    def ensure_sufficient_stock(
        self,
        product_id: str,
        quantity: int,
    ) -> dict[str, Any]:
        """Return product when stock is sufficient."""
        self._positive_int(quantity, "quantity")
        product = self.get_inventory_item(product_id)
        if int(product.get("stock", 0)) < quantity:
            raise RuntimeError(f"Insufficient stock for product_id={product_id}.")
        return product

    def update_stock(self, product_id: str, stock: int) -> dict[str, Any]:
        """Set product stock."""
        self._required_text(product_id, "product_id")
        self._non_negative_int(stock, "stock")
        self.get_inventory_item(product_id)
        self._logger.info("Updating stock for product_id=%s.", product_id)
        return self._product_repository.update_stock(product_id, stock)

    def increase_stock(self, product_id: str, quantity: int) -> dict[str, Any]:
        """Increase product stock."""
        self._positive_int(quantity, "quantity")
        product = self.get_inventory_item(product_id)
        return self.update_stock(product_id, int(product["stock"]) + quantity)

    def decrease_stock(self, product_id: str, quantity: int) -> dict[str, Any]:
        """Decrease product stock."""
        product = self.ensure_sufficient_stock(product_id, quantity)
        return self.update_stock(product_id, int(product["stock"]) - quantity)

    def _stock_status(self, product: dict[str, Any]) -> str:
        """Calculate product stock status."""
        stock = int(product.get("stock", 0))
        minimum_stock = int(product.get("minimum_stock", 0))
        if stock == 0:
            return "out_of_stock"
        if stock <= minimum_stock:
            return "low_stock"
        return "safe"

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

    def _positive_int(self, value: Any, field_name: str) -> None:
        """Validate positive integer value."""
        if not isinstance(value, int) or value <= 0:
            raise ValueError(f"{field_name} must be a positive integer.")

    def _validate_limit(self, limit: int) -> None:
        """Validate list limit."""
        if not isinstance(limit, int) or limit <= 0:
            raise ValueError("limit must be a positive integer.")
