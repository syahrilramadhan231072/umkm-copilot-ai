"""
Transaction Tools
=================

Thin adapter tools for transaction use cases.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.services.transaction_service import TransactionService
from app.utils.logger import logger


class TransactionTools:
    """
    Tool adapter for TransactionService.

    TransactionTools exposes transaction operations to upper layers while keeping
    database access inside Repository Layer and business rules inside Service
    Layer.
    """

    def __init__(self, transaction_service: TransactionService) -> None:
        """Initialize transaction tools."""

        self._transaction_service = transaction_service
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
        """Create transaction through TransactionService."""

        tool_name = "create_transaction"

        try:
            data = self._transaction_service.create_transaction(
                business_id=business_id,
                product_id=product_id,
                quantity=quantity,
                payment_method=payment_method,
                status=status,
                notes=notes,
                transaction_date=transaction_date,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def record_transaction(
        self,
        transaction_data: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Record transaction through TransactionService."""

        tool_name = "record_transaction"

        try:
            data = self._transaction_service.record_transaction(transaction_data)
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def get_transaction(self, transaction_id: str) -> dict[str, Any]:
        """Get transaction by ID through TransactionService."""

        tool_name = "get_transaction"

        try:
            data = self._transaction_service.get_transaction(transaction_id)
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def list_transactions_by_business(
        self,
        business_id: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """List transactions by business through TransactionService."""

        tool_name = "list_transactions_by_business"

        try:
            data = self._transaction_service.list_transactions_by_business(
                business_id=business_id,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def update_transaction_status(
        self,
        transaction_id: str,
        status: str,
    ) -> dict[str, Any]:
        """Update transaction status through TransactionService."""

        tool_name = "update_transaction_status"

        try:
            data = self._transaction_service.update_transaction_status(
                transaction_id=transaction_id,
                status=status,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def calculate_transaction_total(
        self,
        unit_price: int,
        quantity: int,
    ) -> dict[str, Any]:
        """Calculate transaction total through TransactionService."""

        tool_name = "calculate_transaction_total"

        try:
            data = self._transaction_service.calculate_transaction_total(
                unit_price=unit_price,
                quantity=quantity,
            )
            return self._success(tool_name, {"total_price": data})
        except Exception as exc:
            return self._failure(tool_name, exc)

    def delete_transaction(self, transaction_id: str) -> dict[str, Any]:
        """Delete transaction through TransactionService."""

        tool_name = "delete_transaction"

        try:
            data = self._transaction_service.delete_transaction(transaction_id)
            return self._success(tool_name, {"deleted": data})
        except Exception as exc:
            return self._failure(tool_name, exc)

    def _success(self, tool_name: str, data: Any) -> dict[str, Any]:
        """Build successful tool response."""

        return {
            "success": True,
            "tool": tool_name,
            "data": data,
            "error": None,
        }

    def _failure(self, tool_name: str, error: Exception) -> dict[str, Any]:
        """Build failed tool response."""

        self._logger.exception("Transaction tool failed: %s", tool_name)

        return {
            "success": False,
            "tool": tool_name,
            "data": None,
            "error": {
                "type": error.__class__.__name__,
                "message": str(error),
            },
        }
