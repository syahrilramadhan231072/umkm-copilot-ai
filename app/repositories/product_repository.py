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
            data: Product table values.

        Returns:
            Created product record.

        Raises:
            ValueError: If the product is not created.
        """

        try:

            result = self.table.insert(data).execute()

            if not result.data:
                raise ValueError("Product was not created.")

            logger.success("Product created.")

            return result.data[0]

        except Exception as exc:

            logger.exception(exc)

            raise

    def get(
        self,
        product_id: UUID | str,
    ) -> dict[str, Any] | None:
        """
        Get a product by product ID.

        Args:
            product_id: Product ID.

        Returns:
            Product record if found, otherwise None.
        """

        try:

            result = self.table.select("*").eq("id", str(product_id)).limit(1).execute()

            if result.data:
                return result.data[0]

            return None

        except Exception as exc:

            logger.exception(exc)

            raise

    def list(
        self,
        business_id: UUID | str | None = None,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        List products.

        Args:
            business_id: Optional business ID filter.
            limit: Maximum number of records returned.

        Returns:
            List of product records.
        """

        try:

            query = self.table.select("*").order("name").limit(limit)

            if business_id is not None:
                query = query.eq("business_id", str(business_id))

            result = query.execute()

            return result.data

        except Exception as exc:

            logger.exception(exc)

            raise

    def update(
        self,
        product_id: UUID | str,
        values: dict[str, Any],
    ) -> dict[str, Any]:
        """
        Update a product record.

        Args:
            product_id: Product ID.
            values: Product table values to update.

        Returns:
            Updated product record.

        Raises:
            ValueError: If the product is not updated.
        """

        try:

            result = self.table.update(values).eq("id", str(product_id)).execute()

            if not result.data:
                raise ValueError("Product was not updated.")

            logger.success("Product updated.")

            return result.data[0]

        except Exception as exc:

            logger.exception(exc)

            raise

    def delete(
        self,
        product_id: UUID | str,
    ) -> None:
        """
        Delete a product record.

        Args:
            product_id: Product ID.
        """

        try:

            (self.table.delete().eq("id", str(product_id)).execute())

            logger.success("Product deleted.")

        except Exception as exc:

            logger.exception(exc)

            raise

    def count(
        self,
        business_id: UUID | str | None = None,
    ) -> int:
        """
        Count products.

        Args:
            business_id: Optional business ID filter.

        Returns:
            Total number of product records.
        """

        try:

            query = self.table.select("id", count="exact").limit(1)

            if business_id is not None:
                query = query.eq("business_id", str(business_id))

            result = query.execute()

            return int(result.count or 0)

        except Exception as exc:

            logger.exception(exc)

            raise

    def exists(
        self,
        product_id: UUID | str,
    ) -> bool:
        """
        Check whether a product exists by product ID.

        Args:
            product_id: Product ID.

        Returns:
            True if product exists, otherwise False.
        """

        try:

            result = (
                self.table.select("id").eq("id", str(product_id)).limit(1).execute()
            )

            return bool(result.data)

        except Exception as exc:

            logger.exception(exc)

            raise

    def get_by_sku(
        self,
        business_id: UUID | str,
        sku: str,
    ) -> dict[str, Any] | None:
        """
        Get a product by business ID and SKU.

        Args:
            business_id: Business ID.
            sku: Product SKU.

        Returns:
            Product record if found, otherwise None.
        """

        try:

            result = (
                self.table.select("*")
                .eq("business_id", str(business_id))
                .eq("sku", sku)
                .limit(1)
                .execute()
            )

            if result.data:
                return result.data[0]

            return None

        except Exception as exc:

            logger.exception(exc)

            raise

    def get_by_barcode(
        self,
        business_id: UUID | str,
        barcode: str,
    ) -> dict[str, Any] | None:
        """
        Get a product by business ID and barcode.

        Args:
            business_id: Business ID.
            barcode: Product barcode.

        Returns:
            Product record if found, otherwise None.
        """

        try:

            result = (
                self.table.select("*")
                .eq("business_id", str(business_id))
                .eq("barcode", barcode)
                .limit(1)
                .execute()
            )

            if result.data:
                return result.data[0]

            return None

        except Exception as exc:

            logger.exception(exc)

            raise

    def list_active(
        self,
        business_id: UUID | str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        List active products for a business.

        Args:
            business_id: Business ID.
            limit: Maximum number of records returned.

        Returns:
            List of active product records.
        """

        try:

            result = (
                self.table.select("*")
                .eq("business_id", str(business_id))
                .eq("is_active", True)
                .order("name")
                .limit(limit)
                .execute()
            )

            return result.data

        except Exception as exc:

            logger.exception(exc)

            raise

    def list_low_stock(
        self,
        business_id: UUID | str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        List active products with low stock for a business.

        Args:
            business_id: Business ID.
            limit: Maximum number of records returned.

        Returns:
            List of low-stock product records.
        """

        try:

            result = (
                self.table.select("*")
                .eq("business_id", str(business_id))
                .eq("is_active", True)
                .order("stock")
                .execute()
            )

            products = [
                product
                for product in result.data
                if product["stock"] <= product["minimum_stock"]
            ]

            return products[:limit]

        except Exception as exc:

            logger.exception(exc)

            raise

    def update_stock(
        self,
        product_id: UUID | str,
        stock: int,
    ) -> dict[str, Any]:
        """
        Update product stock.

        Args:
            product_id: Product ID.
            stock: New stock value.

        Returns:
            Updated product record.

        Raises:
            ValueError: If product stock is not updated.
        """

        try:

            result = (
                self.table.update(
                    {
                        "stock": stock,
                    }
                )
                .eq("id", str(product_id))
                .execute()
            )

            if not result.data:
                raise ValueError("Product stock was not updated.")

            logger.success("Product stock updated.")

            return result.data[0]

        except Exception as exc:

            logger.exception(exc)

            raise

    def search(
        self,
        business_id: UUID | str,
        keyword: str,
        limit: int = 100,
    ) -> list[dict[str, Any]]:
        """
        Search products by keyword.

        Args:
            business_id: Business ID.
            keyword: Search keyword.
            limit: Maximum number of records returned.

        Returns:
            List of matching product records.
        """

        try:

            keyword = keyword.strip()

            if not keyword:
                return []

            pattern = f"%{keyword}%"

            result = (
                self.table.select("*")
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

        except Exception as exc:

            logger.exception(exc)

            raise

    def count_active(
        self,
        business_id: UUID | str,
    ) -> int:
        """
        Count active products for a business.

        Args:
            business_id: Business ID.

        Returns:
            Total number of active product records.
        """

        try:

            result = (
                self.table.select("id", count="exact")
                .eq("business_id", str(business_id))
                .eq("is_active", True)
                .limit(1)
                .execute()
            )

            return int(result.count or 0)

        except Exception as exc:

            logger.exception(exc)

            raise

    def exists_sku(
        self,
        business_id: UUID | str,
        sku: str,
    ) -> bool:
        """
        Check whether a SKU exists for a business.

        Args:
            business_id: Business ID.
            sku: Product SKU.

        Returns:
            True if SKU exists, otherwise False.
        """

        try:

            result = (
                self.table.select("id")
                .eq("business_id", str(business_id))
                .eq("sku", sku)
                .limit(1)
                .execute()
            )

            return bool(result.data)

        except Exception as exc:

            logger.exception(exc)

            raise

    def exists_barcode(
        self,
        business_id: UUID | str,
        barcode: str,
    ) -> bool:
        """
        Check whether a barcode exists for a business.

        Args:
            business_id: Business ID.
            barcode: Product barcode.

        Returns:
            True if barcode exists, otherwise False.
        """

        try:

            result = (
                self.table.select("id")
                .eq("business_id", str(business_id))
                .eq("barcode", barcode)
                .limit(1)
                .execute()
            )

            return bool(result.data)

        except Exception as exc:

            logger.exception(exc)

            raise
