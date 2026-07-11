"""
Product Analytics Tests
=======================

Pytest test suite for ProductAnalytics using real repositories.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

import pytest

from app.analytics.product_analytics import ProductAnalytics
from app.repositories.business_repository import BusinessRepository
from app.repositories.product_repository import ProductRepository
from app.repositories.transaction_repository import TransactionRepository


@pytest.fixture()
def business_repository() -> BusinessRepository:
    """Create real business repository."""

    return BusinessRepository()


@pytest.fixture()
def product_repository() -> ProductRepository:
    """Create real product repository."""

    return ProductRepository()


@pytest.fixture()
def transaction_repository() -> TransactionRepository:
    """Create real transaction repository."""

    return TransactionRepository()


@pytest.fixture()
def product_analytics(
    product_repository: ProductRepository,
    transaction_repository: TransactionRepository,
) -> ProductAnalytics:
    """Create product analytics with real repositories."""

    return ProductAnalytics(
        product_repository=product_repository,
        transaction_repository=transaction_repository,
    )


def _get_business_id(business_repository: BusinessRepository) -> str:
    """Get demo business ID."""

    profile = business_repository.get_profile()

    if profile is None:
        pytest.skip("No business profile demo data available.")

    return str(profile["id"])


def test_product_analytics_gets_product_summary(
    business_repository: BusinessRepository,
    product_analytics: ProductAnalytics,
) -> None:
    """Assert that product analytics returns product summary."""

    business_id = _get_business_id(business_repository)
    summary = product_analytics.get_product_summary(
        business_id=business_id,
        limit=100,
    )

    assert summary["business_id"] == business_id
    assert summary["total_products"] >= 0
    assert summary["active_products"] >= 0
    assert summary["inactive_products"] >= 0
    assert isinstance(summary["products_by_category"], dict)


def test_product_analytics_gets_product_revenue(
    business_repository: BusinessRepository,
    product_analytics: ProductAnalytics,
) -> None:
    """Assert that product analytics returns product revenue."""

    business_id = _get_business_id(business_repository)
    revenue = product_analytics.get_product_revenue(
        business_id=business_id,
        limit=100,
    )

    assert isinstance(revenue, dict)


def test_product_analytics_rejects_invalid_top_n(
    business_repository: BusinessRepository,
    product_analytics: ProductAnalytics,
) -> None:
    """Assert that invalid top_n is rejected."""

    business_id = _get_business_id(business_repository)

    with pytest.raises(ValueError):
        product_analytics.get_top_products_by_revenue(
            business_id=business_id,
            top_n=0,
            limit=100,
        )
