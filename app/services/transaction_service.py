"""
Transaction Service
===================

Service layer for transaction use cases in UMKM Copilot AI.
"""

from __future__ import annotations

from datetime import datetime, timezone
from typing import Any, Mapping

from app.repositories.product_repository import ProductRepository
from app.repositories.transaction_repository import TransactionRepository
from app.services.base_service import BaseService
from app.utils.logger import logger


class TransactionService(BaseService):
    """Coordinate transaction use cases through repositories."""

    VALID_PAYMENT_METHODS = {"cash", "qris", "transfer", "credit_card", "other"}
    VALID_STATUSES = {"completed", "cancelled", "refunded"}

    def __init__(
        self,
        transaction_repository: TransactionRepository,
        product_repository: ProductRepository,
    ) -> None:
        """Initialize service with injected repositories."""
        super().__init__()
        self._transaction_repository = transaction_repository
        self._product_repository = product_repository
        self._logger = logger

    def create_transaction(
        self,
        business_id: str,
        product_id: str,
        quantity: int,
        payment_method: str = "cash",
        status: str = "completed",
        notes: str | None = None,
        transaction_date: str | None = None,
    ) -> dict[str, Any]:
        """Create transaction from product snapshot."""
        self._required_text(business_id, "business_id")
        self._required_text(product_id, "product_id")
        self._positive_int(quantity, "quantity")
        self._validate_payment_method(payment_method)
        self._validate_status(status)

        product = self._get_valid_product(business_id, product_id)
        if status == "completed":
            self._ensure_stock(product, quantity)

        unit_price = int(product["selling_price"])
        data = {
            "business_id": str(business_id),
            "product_id": str(product_id),
            "product_name": product["name"],
            "quantity": quantity,
            "unit_price": unit_price,
            "total_price": self.calculate_transaction_total(unit_price, quantity),
            "payment_method": payment_method,
            "status": status,
            "notes": notes,
            "transaction_date": transaction_date
            or datetime.now(timezone.utc).isoformat(),
        }

        created = self._transaction_repository.create(data)
        if not isinstance(created, dict):
            raise RuntimeError("Transaction creation failed.")

        if status == "completed":
            self._product_repository.update_stock(
                product_id, int(product["stock"]) - quantity
            )

        self._logger.info("Transaction created for business_id=%s.", business_id)
        return created

    def record_transaction(self, transaction_data: Mapping[str, Any]) -> dict[str, Any]:
        """Create transaction from explicit transaction values."""
        data = self._to_dict(transaction_data, "transaction_data")
        self._validate_transaction_data(data)

        created = self._transaction_repository.create(data)
        if not isinstance(created, dict):
            raise RuntimeError("Transaction creation failed.")
        return created

    def get_transaction(self, transaction_id: str) -> dict[str, Any]:
        """Return transaction by ID."""
        self._required_text(transaction_id, "transaction_id")
        transaction = self._transaction_repository.get(transaction_id)
        if transaction is None:
            raise LookupError(f"Transaction not found: {transaction_id}.")
        return transaction

    def list_transactions(self, limit: int = 100) -> list[dict[str, Any]]:
        """Return transaction records."""
        self._validate_limit(limit)
        return self._list_transactions(limit=limit)

    def list_transactions_by_business(
        self,
        business_id: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return transaction records by business."""
        self._required_text(business_id, "business_id")
        self._validate_limit(limit)
        return self._list_transactions(business_id=business_id, limit=limit)

    def list_transactions_by_product(
        self,
        business_id: str,
        product_id: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return transaction records by product."""
        self._required_text(business_id, "business_id")
        self._required_text(product_id, "product_id")
        self._validate_limit(limit)

        if hasattr(self._transaction_repository, "list_by_product"):
            return self._transaction_repository.list_by_product(
                business_id,
                product_id,
                limit=limit,
            )

        return [
            item
            for item in self.list_transactions_by_business(business_id, limit=limit)
            if str(item.get("product_id")) == str(product_id)
        ]

    def list_transactions_by_status(
        self,
        business_id: str,
        status: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """Return transaction records by status."""
        self._required_text(business_id, "business_id")
        self._validate_status(status)
        self._validate_limit(limit)

        if hasattr(self._transaction_repository, "list_by_status"):
            return self._transaction_repository.list_by_status(
                business_id,
                status,
                limit=limit,
            )

        return [
            item
            for item in self.list_transactions_by_business(business_id, limit=limit)
            if item.get("status") == status
        ]

    def update_transaction(
        self,
        transaction_id: str,
        values: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Update transaction values."""
        self._required_text(transaction_id, "transaction_id")
        update_values = self._to_dict(values, "values")
        self._validate_transaction_update(update_values)
        self.get_transaction(transaction_id)

        updated = self._transaction_repository.update(transaction_id, update_values)
        if not isinstance(updated, dict):
            raise RuntimeError("Transaction update failed.")
        return updated

    def update_transaction_status(
        self,
        transaction_id: str,
        status: str,
    ) -> dict[str, Any]:
        """Update transaction status."""
        self._validate_status(status)
        return self.update_transaction(transaction_id, {"status": status})

    def delete_transaction(self, transaction_id: str) -> bool:
        """Delete transaction by ID."""
        self._required_text(transaction_id, "transaction_id")
        self.get_transaction(transaction_id)
        self._transaction_repository.delete(transaction_id)
        return True

    def count_transactions(self, business_id: str | None = None) -> int:
        """Return total transaction records."""
        try:
            total = self._transaction_repository.count(business_id=business_id)
        except TypeError:
            total = self._transaction_repository.count()
        if not isinstance(total, int):
            raise RuntimeError("Transaction count operation failed.")
        return total

    def calculate_transaction_total(self, unit_price: int, quantity: int) -> int:
        """Calculate transaction total."""
        self._non_negative_int(unit_price, "unit_price")
        self._positive_int(quantity, "quantity")
        return unit_price * quantity

    def _get_valid_product(self, business_id: str, product_id: str) -> dict[str, Any]:
        """Return product after ownership and active-status validation."""
        product = self._product_repository.get(product_id)
        if product is None:
            raise LookupError(f"Product not found: {product_id}.")
        if str(product.get("business_id")) != str(business_id):
            raise RuntimeError("Product does not belong to the business.")
        if product.get("is_active") is not True:
            raise RuntimeError("Product is not active.")
        return product

    def _ensure_stock(self, product: Mapping[str, Any], quantity: int) -> None:
        """Validate sufficient product stock."""
        if int(product.get("stock", 0)) < quantity:
            raise RuntimeError("Insufficient product stock.")

    def _list_transactions(
        self,
        *,
        limit: int,
        business_id: str | None = None,
    ) -> list[dict[str, Any]]:
        """Return transactions with optional business filtering."""
        try:
            records = self._transaction_repository.list(
                business_id=business_id,
                limit=limit,
            )
        except TypeError:
            records = self._transaction_repository.list(limit=limit)

        if not isinstance(records, list):
            raise RuntimeError("Transaction list operation failed.")

        if business_id is None:
            return records

        return [
            record
            for record in records
            if str(record.get("business_id")) == str(business_id)
        ]

    def _validate_transaction_data(self, data: Mapping[str, Any]) -> None:
        """Validate transaction creation values."""
        self._required_text(data.get("business_id"), "business_id")
        self._required_text(data.get("product_name"), "product_name")
        self._positive_int(data.get("quantity"), "quantity")
        self._non_negative_int(data.get("unit_price"), "unit_price")
        self._non_negative_int(data.get("total_price"), "total_price")
        if int(data["total_price"]) != int(data["quantity"]) * int(data["unit_price"]):
            raise ValueError(
                "total_price must equal quantity multiplied by unit_price."
            )
        self._validate_payment_method(str(data.get("payment_method", "cash")))
        self._validate_status(str(data.get("status", "completed")))

    def _validate_transaction_update(self, data: Mapping[str, Any]) -> None:
        """Validate transaction update values."""
        if "quantity" in data:
            self._positive_int(data["quantity"], "quantity")
        if "unit_price" in data:
            self._non_negative_int(data["unit_price"], "unit_price")
        if "total_price" in data:
            self._non_negative_int(data["total_price"], "total_price")
        if "payment_method" in data:
            self._validate_payment_method(str(data["payment_method"]))
        if "status" in data:
            self._validate_status(str(data["status"]))

    def _validate_payment_method(self, value: str) -> None:
        """Validate transaction payment method."""
        if value not in self.VALID_PAYMENT_METHODS:
            raise ValueError(
                f"payment_method must be one of {sorted(self.VALID_PAYMENT_METHODS)}."
            )

    def _validate_status(self, value: str) -> None:
        """Validate transaction status."""
        if value not in self.VALID_STATUSES:
            raise ValueError(f"status must be one of {sorted(self.VALID_STATUSES)}.")

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

    def _positive_int(self, value: Any, field_name: str) -> None:
        """Validate positive integer value."""
        if not isinstance(value, int) or value <= 0:
            raise ValueError(f"{field_name} must be a positive integer.")

    def _validate_limit(self, limit: int) -> None:
        """Validate list limit."""
        if not isinstance(limit, int) or limit <= 0:
            raise ValueError("limit must be a positive integer.")
