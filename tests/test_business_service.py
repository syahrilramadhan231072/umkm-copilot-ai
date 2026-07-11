"""
Business Service Tests
======================

Pytest tests for BusinessService with the real BusinessRepository.
"""

from __future__ import annotations

import pytest

from app.repositories.business_repository import BusinessRepository
from app.services.business_service import BusinessService


@pytest.fixture()
def service() -> BusinessService:
    """Return BusinessService with real repository."""
    return BusinessService(BusinessRepository())


def test_business_service_reads_profile(service: BusinessService) -> None:
    """Assert that service reads the active business profile."""
    if not service.business_profile_exists():
        pytest.skip("No business profile demo data available.")

    profile = service.get_business_profile()

    assert isinstance(profile, dict)
    assert profile.get("id") is not None
    assert profile.get("business_name")


def test_business_service_builds_context(service: BusinessService) -> None:
    """Assert that service builds structured business context."""
    if not service.business_profile_exists():
        pytest.skip("No business profile demo data available.")

    context = service.get_business_context()

    assert context["business_id"]
    assert context["business_name"]
    assert "currency" in context
    assert "timezone" in context


def test_business_service_lists_and_counts_profiles(
    service: BusinessService,
) -> None:
    """Assert that service lists and counts business profile records."""
    records = service.list_business_profiles(limit=10)
    total = service.count_business_profiles()

    assert isinstance(records, list)
    assert len(records) <= 10
    assert isinstance(total, int)
    assert total >= 0


def test_business_service_rejects_invalid_update(
    service: BusinessService,
) -> None:
    """Assert that service rejects invalid update data."""
    with pytest.raises(ValueError):
        service.update_business_profile({})
