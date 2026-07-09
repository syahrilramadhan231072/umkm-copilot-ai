"""
Product Repository
==================

Repository for products table.

Responsibilities
----------------
- CRUD operations
- Product queries
- Inventory queries
- Database abstraction

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any
from uuid import UUID

from app.repositories.base_repository import BaseRepository
from app.utils.logger import logger


class ProductRepository(BaseRepository):
    """
    Repository for products.
    """

    TABLE_NAME = "products"

    def create(
        self,
        data: dict[str, Any],
    ) -> dict[str, Any]:
        """
        Create a product record.

        Args:
            data: Product data using products table columns.

        Returns:
            Created product record.
        """

        result = (
            self.table
            .insert(data)
            .execute()
        )

        logger.success("Product created.")

        return result.data[0]

    def get(
        self,
        product_id: UUID | str,
    ) -> dict[str, Any] | None:
        """
        Get a product by product ID.

        Args:
            product_id: Product UUID.

        Returns:
            Product record if found, otherwise None.
        """

        result = (
            self.table
            .select("*")
            .eq("id", str(product_id))
            .limit(1)
            .execute()
        )

        if result.data:
            return result.data[0]

        return None

    def list(
        self,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        List products.

        Args:
            limit: Maximum number of records returned.

        Returns:
            List of product records.
        """

        result = (
            self.table
            .select("*")
            .order("name")
            .limit(limit)
            .execute()
        )

        return result.data

    def update(
        self,
        product_id: UUID | str,
        values: dict[str, Any],
    ) -> dict[str, Any]:
        """
        Update a product record.

        Args:
            product_id: Product UUID.
            values: Product column values to update.

        Returns:
            Updated product record.
        """

        result = (
            self.table
            .update(values)
            .eq("id", str(product_id))
            .execute()
        )

        logger.success("Product updated.")

        return result.data[0]

    def delete(
        self,
        product_id: UUID | str,
    ) -> None:
        """
        Delete a product record.

        Args:
            product_id: Product UUID.
        """

        (
            self.table
            .delete()
            .eq("id", str(product_id))
            .execute()
        )

        logger.success("Product deleted.")

    def count(self) -> int:
        """
        Count all products.

        Returns:
            Total number of product records.
        """

        result = (
            self.table
            .select("id", count="exact")
            .range(0, 0)
            .execute()
        )

        return int(result.count or 0)

    def exists(
        self,
        product_id: UUID | str,
    ) -> bool:
        """
        Check whether a product exists by product ID.

        Args:
            product_id: Product UUID.

        Returns:
            True if product exists, otherwise False.
        """

        result = (
            self.table
            .select("id")
            .eq("id", str(product_id))
            .limit(1)
            .execute()
        )

        return bool(result.data)

    def get_by_sku(
        self,
        business_id: UUID | str,
        sku: str,
    ) -> dict[str, Any] | None:
        """
        Get a product by business ID and SKU.

        Args:
            business_id: Business UUID.
            sku: Product SKU.

        Returns:
            Product record if found, otherwise None.
        """

        result = (
            self.table
            .select("*")
            .eq("business_id", str(business_id))
            .eq("sku", sku)
            .limit(1)
            .execute()
        )

        if result.data:
            return result.data[0]

        return None

    def get_by_barcode(
        self,
        business_id: UUID | str,
        barcode: str,
    ) -> dict[str, Any] | None:
        """
        Get a product by business ID and barcode.

        Args:
            business_id: Business UUID.
            barcode: Product barcode.

        Returns:
            Product record if found, otherwise None.
        """

        result = (
            self.table
            .select("*")
            .eq("business_id", str(business_id))
            .eq("barcode", barcode)
            .limit(1)
            .execute()
        )

        if result.data:
            return result.data[0]

        return None

    def list_active(
        self,
        business_id: UUID | str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        List active products for a business.

        Args:
            business_id: Business UUID.
            limit: Maximum number of records returned.

        Returns:
            List of active product records.
        """

        result = (
            self.table
            .select("*")
            .eq("business_id", str(business_id))
            .eq("is_active", True)
            .order("name")
            .limit(limit)
            .execute()
        )

        return result.data

    def list_low_stock(
        self,
        business_id: UUID | str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        List products with stock lower than or equal to minimum stock.

        Args:
            business_id: Business UUID.
            limit: Maximum number of records returned.

        Returns:
            List of low-stock product records.
        """

        result = (
            self.table
            .select("*")
            .eq("business_id", str(business_id))
            .eq("is_active", True)
            .order("stock")
            .limit(limit)
            .execute()
        )

        return [
            product
            for product in result.data
            if product["stock"] <= product["minimum_stock"]
        ]

    def update_stock(
        self,
        product_id: UUID | str,
        stock: int,
    ) -> dict[str, Any]:
        """
        Update product stock.

        Args:
            product_id: Product UUID.
            stock: New stock value.

        Returns:
            Updated product record.
        """

        result = (
            self.table
            .update(
                {
                    "stock": stock,
                }
            )
            .eq("id", str(product_id))
            .execute()
        )

        logger.success("Product stock updated.")

        return result.data[0]

    def search(
        self,
        business_id: UUID | str,
        keyword: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        Search products by keyword.

        Args:
            business_id: Business UUID.
            keyword: Search keyword.
            limit: Maximum number of records returned.

        Returns:
            List of matching product records.
        """

        search_keyword = keyword.strip()

        if not search_keyword:
            return []

        pattern = f"%{search_keyword}%"

        result = (
            self.table
            .select("*")
            .eq("business_id", str(business_id))
            .or_(
                ",".join(
                    [
                        f"name.ilike.{pattern}",
                        f"category.ilike.{pattern}",
                        f"sku.ilike.{pattern}",
                        f"description.ilike.{pattern}",
                        f"barcode.ilike.{pattern}",
                    ]
                )
            )
            .order("name")
            .limit(limit)
            .execute()
        )

        return result.data

    def count_active(
        self,
        business_id: UUID | str,
    ) -> int:
        """
        Count active products for a business.

        Args:
            business_id: Business UUID.

        Returns:
            Total number of active product records.
        """

        result = (
            self.table
            .select("id", count="exact")
            .eq("business_id", str(business_id))
            .eq("is_active", True)
            .range(0, 0)
            .execute()
        )

        return int(result.count or 0)

    def exists_sku(
        self,
        business_id: UUID | str,
        sku: str,
    ) -> bool:
        """
        Check whether a SKU exists for a business.

        Args:
            business_id: Business UUID.
            sku: Product SKU.

        Returns:
            True if SKU exists, otherwise False.
        """

        result = (
            self.table
            .select("id")
            .eq("business_id", str(business_id))
            .eq("sku", sku)
            .limit(1)
            .execute()
        )

        return bool(result.data)

    def exists_barcode(
        self,
        business_id: UUID | str,
        barcode: str,
    ) -> bool:
        """
        Check whether a barcode exists for a business.

        Args:
            business_id: Business UUID.
            barcode: Product barcode.

        Returns:
            True if barcode exists, otherwise False.
        """

        result = (
            self.table
            .select("id")
            .eq("business_id", str(business_id))
            .eq("barcode", barcode)
            .limit(1)
            .execute()
        )

        return bool(result.data)
