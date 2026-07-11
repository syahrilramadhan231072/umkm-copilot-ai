"""
Inventory Service Tests
=======================

Pytest tests for InventoryService with the real ProductRepository.
"""

from __future__ import annotations

from typing import Any

import pytest

from app.repositories.business_repository import BusinessRepository
from app.repositories.product_repository import ProductRepository
from app.services.inventory_service import InventoryService


@pytest.fixture()
def business_repository() -> BusinessRepository:
    """Return real business repository."""
    return BusinessRepository()


@pytest.fixture()
def product_repository() -> ProductRepository:
    """Return real product repository."""
    return ProductRepository()


@pytest.fixture()
def service(product_repository: ProductRepository) -> InventoryService:
    """Return InventoryService with real product repository."""
    return InventoryService(product_repository)


def _business_id(repository: BusinessRepository) -> str:
    """Return demo business ID."""
    profile = repository.get_profile()
    if profile is None:
        pytest.skip("No business profile demo data available.")
    return str(profile["id"])


def _first_product(repository: ProductRepository, business_id: str) -> dict[str, Any]:
    """Return first active demo product."""
    products = repository.list_active(business_id, limit=1)
    if not products:
        pytest.skip("No active product demo data available.")
    return products[0]


def test_inventory_service_reads_and_summarizes_inventory(
    business_repository: BusinessRepository,
    product_repository: ProductRepository,
    service: InventoryService,
) -> None:
    """Assert that service reads inventory and builds summary."""
    business_id = _business_id(business_repository)
    product = _first_product(product_repository, business_id)

    item = service.get_inventory_item(str(product["id"]))
    summary = service.get_inventory_summary(business_id, limit=20)

    assert str(item["id"]) == str(product["id"])
    assert summary["business_id"] == business_id
    assert summary["total_items"] >= 0


def test_inventory_service_updates_and_restores_stock(
    business_repository: BusinessRepository,
    product_repository: ProductRepository,
    service: InventoryService,
) -> None:
    """Assert that service updates stock and restores original value."""
    business_id = _business_id(business_repository)
    product = _first_product(product_repository, business_id)
    product_id = str(product["id"])
    original_stock = int(product["stock"])

    try:
        updated = service.update_stock(product_id, original_stock + 1)
        assert updated["stock"] == original_stock + 1
    finally:
        current = product_repository.get(product_id)
        if current is not None and int(current["stock"]) != original_stock:
            product_repository.update_stock(product_id, original_stock)


def test_inventory_service_rejects_negative_stock(
    business_repository: BusinessRepository,
    product_repository: ProductRepository,
    service: InventoryService,
) -> None:
    """Assert that service rejects negative stock."""
    business_id = _business_id(business_repository)
    product = _first_product(product_repository, business_id)

    with pytest.raises(ValueError):
        service.update_stock(str(product["id"]), -1)
