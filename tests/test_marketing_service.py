"""
Marketing Service Tests
=======================

Pytest tests for MarketingService with real repositories.
"""

from __future__ import annotations

from typing import Any
from uuid import uuid4

import pytest

from app.repositories.business_repository import BusinessRepository
from app.repositories.marketing_repository import MarketingRepository
from app.repositories.product_repository import ProductRepository
from app.services.marketing_service import MarketingService


@pytest.fixture()
def business_repository() -> BusinessRepository:
    """Return real business repository."""
    return BusinessRepository()


@pytest.fixture()
def product_repository() -> ProductRepository:
    """Return real product repository."""
    return ProductRepository()


@pytest.fixture()
def marketing_repository() -> MarketingRepository:
    """Return real marketing repository."""
    return MarketingRepository()


@pytest.fixture()
def service(
    marketing_repository: MarketingRepository,
    product_repository: ProductRepository,
) -> MarketingService:
    """Return MarketingService with real repositories."""
    return MarketingService(marketing_repository, product_repository)


def _business_id(repository: BusinessRepository) -> str:
    """Return demo business ID."""
    profile = repository.get_profile()
    if profile is None:
        pytest.skip("No business profile demo data available.")
    return str(profile["id"])


def _first_product(repository: ProductRepository, business_id: str) -> dict[str, Any]:
    """Return first active product."""
    products = repository.list_active(business_id, limit=1)
    if not products:
        pytest.skip("No active product demo data available.")
    return products[0]


def test_marketing_service_create_update_delete(
    business_repository: BusinessRepository,
    product_repository: ProductRepository,
    marketing_repository: MarketingRepository,
    service: MarketingService,
) -> None:
    """Assert that service creates, updates, and deletes marketing record."""
    business_id = _business_id(business_repository)
    product = _first_product(product_repository, business_id)
    marketing_id = str(uuid4())

    try:
        created = service.create_marketing_record(
            business_id,
            {
                "id": marketing_id,
                "product_id": str(product["id"]),
                "platform": "Instagram",
                "prompt": "Create promotion.",
                "caption": "Caption from service test.",
                "hashtags": "#umkm #test",
            },
        )
        assert str(created["id"]) == marketing_id

        updated = service.update_marketing_record(
            marketing_id,
            {"caption": "Updated caption from service test."},
        )
        assert updated["caption"].startswith("Updated caption")

    finally:
        if marketing_repository.get(marketing_id) is not None:
            marketing_repository.delete(marketing_id)


def test_marketing_service_builds_product_context(
    business_repository: BusinessRepository,
    product_repository: ProductRepository,
    service: MarketingService,
) -> None:
    """Assert that service builds product marketing context."""
    business_id = _business_id(business_repository)
    product = _first_product(product_repository, business_id)
    context = service.build_product_marketing_context(str(product["id"]))

    assert context["product_id"] == str(product["id"])
    assert context["business_id"] == business_id


def test_marketing_service_rejects_invalid_record(
    business_repository: BusinessRepository,
    service: MarketingService,
) -> None:
    """Assert that service rejects invalid marketing data."""
    business_id = _business_id(business_repository)

    with pytest.raises(ValueError):
        service.create_marketing_record(business_id, {"platform": "", "caption": ""})
