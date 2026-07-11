"""
Product Tools
=============

Thin adapter tools for product use cases.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.services.product_service import ProductService
from app.utils.logger import logger


class ProductTools:
    """
    Tool adapter for ProductService.

    ProductTools exposes product operations to upper layers without allowing
    direct repository, database, prompt, LLM, or workflow access.
    """

    def __init__(self, product_service: ProductService) -> None:
        """
        Initialize product tools.

        Args:
            product_service: Product service dependency.
        """

        self._product_service = product_service
        self._logger = logger

    def create_product(
        self,
        business_id: str,
        product_data: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Create a product through ProductService."""

        tool_name = "create_product"

        try:
            data = self._product_service.create_product(
                business_id=business_id,
                product_data=product_data,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def get_product(self, product_id: str) -> dict[str, Any]:
        """Get product by ID through ProductService."""

        tool_name = "get_product"

        try:
            data = self._product_service.get_product(product_id)
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def list_active_products(
        self,
        business_id: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """List active products through ProductService."""

        tool_name = "list_active_products"

        try:
            data = self._product_service.list_active_products(
                business_id=business_id,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def list_low_stock_products(
        self,
        business_id: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """List low-stock products through ProductService."""

        tool_name = "list_low_stock_products"

        try:
            data = self._product_service.list_low_stock_products(
                business_id=business_id,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def search_products(
        self,
        business_id: str,
        keyword: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Search products through ProductService."""

        tool_name = "search_products"

        try:
            data = self._product_service.search_products(
                business_id=business_id,
                keyword=keyword,
                limit=limit,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def update_product(
        self,
        product_id: str,
        values: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Update product through ProductService."""

        tool_name = "update_product"

        try:
            data = self._product_service.update_product(
                product_id=product_id,
                values=values,
            )
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def activate_product(self, product_id: str) -> dict[str, Any]:
        """Activate product through ProductService."""

        tool_name = "activate_product"

        try:
            data = self._product_service.activate_product(product_id)
            return self._success(tool_name, data)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def deactivate_product(self, product_id: str) -> dict[str, Any]:
        """Deactivate product through ProductService."""

        tool_name = "deactivate_product"

        try:
            data = self._product_service.deactivate_product(product_id)
            return self._success(tool_name, data)
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

        self._logger.exception("Product tool failed: %s", tool_name)

        return {
            "success": False,
            "tool": tool_name,
            "data": None,
            "error": {
                "type": error.__class__.__name__,
                "message": str(error),
            },
        }
