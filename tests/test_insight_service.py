"""
Insight Service Tests
=====================

Pytest tests for InsightService with real repositories.
"""

from __future__ import annotations

from uuid import uuid4

import pytest

from app.repositories.business_repository import BusinessRepository
from app.repositories.insights_repository import InsightsRepository
from app.repositories.marketing_repository import MarketingRepository
from app.repositories.product_repository import ProductRepository
from app.repositories.transaction_repository import TransactionRepository
from app.services.insight_service import InsightService


@pytest.fixture()
def business_repository() -> BusinessRepository:
    """Return real business repository."""
    return BusinessRepository()


@pytest.fixture()
def insights_repository() -> InsightsRepository:
    """Return real insights repository."""
    return InsightsRepository()


@pytest.fixture()
def service() -> InsightService:
    """Return InsightService with real repositories."""
    return InsightService(
        insights_repository=InsightsRepository(),
        product_repository=ProductRepository(),
        transaction_repository=TransactionRepository(),
        marketing_repository=MarketingRepository(),
    )


def _business_id(repository: BusinessRepository) -> str:
    """Return demo business ID."""
    profile = repository.get_profile()
    if profile is None:
        pytest.skip("No business profile demo data available.")
    return str(profile["id"])


def test_insight_service_create_update_delete(
    business_repository: BusinessRepository,
    insights_repository: InsightsRepository,
    service: InsightService,
) -> None:
    """Assert that service creates, updates, and deletes insight record."""
    business_id = _business_id(business_repository)
    insight_id = str(uuid4())

    try:
        created = service.create_insight_record(
            business_id,
            {
                "id": insight_id,
                "insight_category": "general",
                "title": "Insight Service Test",
                "content": "Insight from service integration test.",
            },
        )
        assert str(created["id"]) == insight_id

        updated = service.update_insight(
            insight_id,
            {"title": "Insight Service Test Updated"},
        )
        assert updated["title"].endswith("Updated")

    finally:
        if insights_repository.get(insight_id) is not None:
            insights_repository.delete(insight_id)


def test_insight_service_builds_context(
    business_repository: BusinessRepository,
    service: InsightService,
) -> None:
    """Assert that service builds structured business insight context."""
    business_id = _business_id(business_repository)
    context = service.build_business_insight_context(business_id, limit=10)

    assert context["business_id"] == business_id
    assert isinstance(context["products"], list)
    assert isinstance(context["transactions"], list)
    assert isinstance(context["marketing_history"], list)
    assert isinstance(context["recent_insights"], list)


def test_insight_service_rejects_invalid_category(
    business_repository: BusinessRepository,
    service: InsightService,
) -> None:
    """Assert that service rejects invalid insight category."""
    business_id = _business_id(business_repository)

    with pytest.raises(ValueError):
        service.create_insight_record(
            business_id,
            {
                "insight_category": "invalid",
                "title": "Invalid Insight",
                "content": "Invalid category must be rejected.",
            },
        )
