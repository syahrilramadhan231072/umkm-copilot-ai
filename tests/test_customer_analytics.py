"""
Customer Analytics Tests
========================

Pytest test suite for CustomerAnalytics using real TransactionRepository.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

import pytest

from app.analytics.customer_analytics import CustomerAnalytics
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
def customer_analytics(
    transaction_repository: TransactionRepository,
) -> CustomerAnalytics:
    """Create customer analytics with real repository."""

    return CustomerAnalytics(transaction_repository)


def _get_business_id(business_repository: BusinessRepository) -> str:
    """Get demo business ID."""

    profile = business_repository.get_profile()

    if profile is None:
        pytest.skip("No business profile demo data available.")

    return str(profile["id"])


def test_customer_analytics_gets_customer_summary(
    business_repository: BusinessRepository,
    customer_analytics: CustomerAnalytics,
) -> None:
    """Assert that customer analytics returns customer summary."""

    business_id = _get_business_id(business_repository)
    summary = customer_analytics.get_customer_summary(
        business_id=business_id,
        limit=100,
    )

    assert summary["business_id"] == business_id
    assert summary["transaction_count"] >= 0
    assert summary["estimated_unique_customers"] >= 0
    assert summary["anonymous_transaction_count"] >= 0
    assert isinstance(summary["customer_fields_available"], dict)


def test_customer_analytics_gets_payment_distribution(
    business_repository: BusinessRepository,
    customer_analytics: CustomerAnalytics,
) -> None:
    """Assert that customer analytics returns payment distribution."""

    business_id = _get_business_id(business_repository)
    distribution = customer_analytics.get_payment_preference_distribution(
        business_id=business_id,
        limit=100,
    )

    assert isinstance(distribution, dict)


def test_customer_analytics_rejects_invalid_limit(
    business_repository: BusinessRepository,
    customer_analytics: CustomerAnalytics,
) -> None:
    """Assert that invalid limit is rejected."""

    business_id = _get_business_id(business_repository)

    with pytest.raises(ValueError):
        customer_analytics.get_customer_summary(
            business_id=business_id,
            limit=0,
        )
