"""
Dashboard Analytics Tests
=========================

Pytest test suite for DashboardAnalytics using real repositories.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

import pytest

from app.analytics.customer_analytics import CustomerAnalytics
from app.analytics.dashboard_analytics import DashboardAnalytics
from app.analytics.inventory_analytics import InventoryAnalytics
from app.analytics.product_analytics import ProductAnalytics
from app.analytics.sales_analytics import SalesAnalytics
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
def dashboard_analytics(
    product_repository: ProductRepository,
    transaction_repository: TransactionRepository,
) -> DashboardAnalytics:
    """Create dashboard analytics with real repository-backed analytics."""

    sales_analytics = SalesAnalytics(transaction_repository)
    inventory_analytics = InventoryAnalytics(product_repository)
    product_analytics = ProductAnalytics(
        product_repository=product_repository,
        transaction_repository=transaction_repository,
    )
    customer_analytics = CustomerAnalytics(transaction_repository)

    return DashboardAnalytics(
        sales_analytics=sales_analytics,
        inventory_analytics=inventory_analytics,
        product_analytics=product_analytics,
        customer_analytics=customer_analytics,
    )


def _get_business_id(business_repository: BusinessRepository) -> str:
    """Get demo business ID."""

    profile = business_repository.get_profile()

    if profile is None:
        pytest.skip("No business profile demo data available.")

    return str(profile["id"])


def test_dashboard_analytics_builds_payload(
    business_repository: BusinessRepository,
    dashboard_analytics: DashboardAnalytics,
) -> None:
    """Assert that dashboard analytics builds dashboard payload."""

    business_id = _get_business_id(business_repository)
    payload = dashboard_analytics.build_dashboard_payload(
        business_id=business_id,
        limit=100,
    )

    assert payload["business_id"] == business_id
    assert isinstance(payload["kpi_cards"], list)
    assert isinstance(payload["sales_summary"], dict)
    assert isinstance(payload["inventory_summary"], dict)
    assert isinstance(payload["product_summary"], dict)
    assert isinstance(payload["customer_summary"], dict)
    assert isinstance(payload["alerts"], list)


def test_dashboard_analytics_builds_kpi_cards(
    business_repository: BusinessRepository,
    dashboard_analytics: DashboardAnalytics,
) -> None:
    """Assert that dashboard analytics builds KPI cards."""

    business_id = _get_business_id(business_repository)
    cards = dashboard_analytics.build_kpi_cards(
        business_id=business_id,
        limit=100,
    )

    assert isinstance(cards, list)
    assert len(cards) == 5

    for card in cards:
        assert "key" in card
        assert "label" in card
        assert "value" in card


def test_dashboard_analytics_rejects_invalid_business_id(
    dashboard_analytics: DashboardAnalytics,
) -> None:
    """Assert that invalid business ID is rejected."""

    with pytest.raises(ValueError):
        dashboard_analytics.build_dashboard_payload(
            business_id="",
            limit=100,
        )
