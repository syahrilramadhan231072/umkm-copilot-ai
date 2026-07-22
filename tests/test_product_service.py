"""
Product Service Tests
=====================

Pytest tests for ProductService with the real ProductRepository.
"""

from __future__ import annotations

from typing import Any
from uuid import uuid4

import pytest

from app.repositories.business_repository import BusinessRepository
from app.repositories.product_repository import ProductRepository
from app.services.product_service import ProductService


@pytest.fixture()
def business_repository() -> BusinessRepository:
    """Return real business repository."""
    return BusinessRepository()


@pytest.fixture()
def product_repository() -> ProductRepository:
    """Return real product repository."""
    return ProductRepository()


@pytest.fixture()
def service(product_repository: ProductRepository) -> ProductService:
    """Return ProductService with real repository."""
    return ProductService(product_repository)


def _business_id(repository: BusinessRepository) -> str:
    """Return demo business ID."""
    profile = repository.get_profile()
    if profile is None:
        pytest.skip("No business profile demo data available.")
    return str(profile["id"])


def _product_data(business_id: str) -> dict[str, Any]:
    """Return unique product data for integration test."""
    token = uuid4().hex[:12]
    return {
        "id": str(uuid4()),
        "business_id": business_id,
        "name": f"Service Product {token}",
        "category": "Testing",
        "sku": f"SVC-{token}",
        "description": "Created by ProductService test.",
        "selling_price": 25000,
        "cost_price": 12000,
        "stock": 20,
        "minimum_stock": 5,
        "unit": "pcs",
        "barcode": f"899{uuid4().int % 10_000_000_000:010d}",
        "is_active": True,
    }


def test_product_service_create_update_delete(
    business_repository: BusinessRepository,
    product_repository: ProductRepository,
    service: ProductService,
) -> None:
    """Assert that service creates, updates, and deletes a product."""
    business_id = _business_id(business_repository)
    data = _product_data(business_id)
    product_id = data["id"]

    try:
        created = service.create_product(business_id, data)
        updated = service.update_product(product_id, {"name": data["name"] + " Updated"})

        assert str(created["id"]) == product_id
        assert updated["name"].endswith("Updated")
        assert service.product_exists(product_id) is True

    finally:
        if product_repository.get(product_id) is not None:
            product_repository.delete(product_id)

    assert product_repository.get(product_id) is None


def test_product_service_lists_active_products(
    business_repository: BusinessRepository,
    service: ProductService,
) -> None:
    """Assert that service lists active products."""
    business_id = _business_id(business_repository)
    records = service.list_active_products(business_id, limit=10)

    assert isinstance(records, list)
    assert len(records) <= 10


def test_product_service_rejects_invalid_product(
    business_repository: BusinessRepository,
    service: ProductService,
) -> None:
    """Assert that invalid product data is rejected."""
    business_id = _business_id(business_repository)

    with pytest.raises(ValueError):
        service.create_product(
            business_id,
            {
                "name": "",
                "selling_price": -1,
                "cost_price": 0,
                "stock": 0,
                "minimum_stock": 0,
                "unit": "pcs",
            },
        )
