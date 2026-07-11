"""
Sales Analytics Tests
=====================

Pytest test suite for SalesAnalytics using real TransactionRepository.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

import pytest

from app.analytics.sales_analytics import SalesAnalytics
from app.repositories.business_repository import BusinessRepository
from app.repositories.transaction_repository import TransactionRepository


@pytest.fixture()
def business_repository() -> BusinessRepository:
    """Create real business repository."""

    return BusinessRepository()


@pytest.fixture()
def transaction_repository() -> TransactionRepository:
    """Create real transaction repository."""

    return TransactionRepository()


@pytest.fixture()
def sales_analytics(
    transaction_repository: TransactionRepository,
) -> SalesAnalytics:
    """Create sales analytics with real repository."""

    return SalesAnalytics(transaction_repository)


def _get_business_id(business_repository: BusinessRepository) -> str:
    """Get demo business ID."""

    profile = business_repository.get_profile()

    if profile is None:
        pytest.skip("No business profile demo data available.")

    return str(profile["id"])


def test_sales_analytics_gets_sales_summary(
    business_repository: BusinessRepository,
    sales_analytics: SalesAnalytics,
) -> None:
    """Assert that sales analytics returns sales summary."""

    business_id = _get_business_id(business_repository)
    summary = sales_analytics.get_sales_summary(
        business_id=business_id,
        limit=100,
    )

    assert summary["business_id"] == business_id
    assert summary["transaction_count"] >= 0
    assert summary["total_revenue"] >= 0
    assert summary["total_quantity_sold"] >= 0
    assert isinstance(summary["sales_by_status"], dict)
    assert isinstance(summary["sales_by_payment_method"], dict)


def test_sales_analytics_gets_top_products(
    business_repository: BusinessRepository,
    sales_analytics: SalesAnalytics,
) -> None:
    """Assert that sales analytics returns top products."""

    business_id = _get_business_id(business_repository)
    products = sales_analytics.get_top_products_by_revenue(
        business_id=business_id,
        top_n=5,
        limit=100,
    )

    assert isinstance(products, list)
    assert len(products) <= 5


def test_sales_analytics_rejects_invalid_limit(
    business_repository: BusinessRepository,
    sales_analytics: SalesAnalytics,
) -> None:
    """Assert that invalid limit is rejected."""

    business_id = _get_business_id(business_repository)

    with pytest.raises(ValueError):
        sales_analytics.get_sales_summary(
            business_id=business_id,
            limit=0,
        )
