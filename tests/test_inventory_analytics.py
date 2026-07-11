"""
Inventory Analytics Tests
=========================

Pytest test suite for InventoryAnalytics using real ProductRepository.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

import pytest

from app.analytics.inventory_analytics import InventoryAnalytics
from app.repositories.business_repository import BusinessRepository
from app.repositories.product_repository import ProductRepository


@pytest.fixture()
def business_repository() -> BusinessRepository:
    """Create real business repository."""

    return BusinessRepository()


@pytest.fixture()
def product_repository() -> ProductRepository:
    """Create real product repository."""

    return ProductRepository()


@pytest.fixture()
def inventory_analytics(
    product_repository: ProductRepository,
) -> InventoryAnalytics:
    """Create inventory analytics with real repository."""

    return InventoryAnalytics(product_repository)


def _get_business_id(business_repository: BusinessRepository) -> str:
    """Get demo business ID."""

    profile = business_repository.get_profile()

    if profile is None:
        pytest.skip("No business profile demo data available.")

    return str(profile["id"])


def test_inventory_analytics_gets_inventory_summary(
    business_repository: BusinessRepository,
    inventory_analytics: InventoryAnalytics,
) -> None:
    """Assert that inventory analytics returns inventory summary."""

    business_id = _get_business_id(business_repository)
    summary = inventory_analytics.get_inventory_summary(
        business_id=business_id,
        limit=100,
    )

    assert summary["business_id"] == business_id
    assert summary["total_inventory_items"] >= 0
    assert summary["total_stock_units"] >= 0
    assert summary["inventory_cost_value"] >= 0
    assert summary["inventory_selling_value"] >= 0
    assert isinstance(summary["stock_status_distribution"], dict)


def test_inventory_analytics_gets_low_stock_items(
    business_repository: BusinessRepository,
    inventory_analytics: InventoryAnalytics,
) -> None:
    """Assert that inventory analytics returns low stock items."""

    business_id = _get_business_id(business_repository)
    items = inventory_analytics.get_low_stock_items(
        business_id=business_id,
        limit=10,
    )

    assert isinstance(items, list)
    assert len(items) <= 10


def test_inventory_analytics_rejects_invalid_business_id(
    inventory_analytics: InventoryAnalytics,
) -> None:
    """Assert that invalid business ID is rejected."""

    with pytest.raises(ValueError):
        inventory_analytics.get_inventory_summary(
            business_id="",
            limit=100,
        )
