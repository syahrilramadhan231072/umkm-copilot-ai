"""
Base Analytics Tests
====================

Pytest test suite for BaseAnalytics.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

import pytest

from app.analytics.base_analytics import BaseAnalytics


def test_base_analytics_validates_required_text() -> None:
    """Assert that required text validation returns stripped text."""

    analytics = BaseAnalytics()

    assert (
        analytics._validate_required_text(
            "  abc  ",
            field_name="value",
        )
        == "abc"
    )

    with pytest.raises(ValueError):
        analytics._validate_required_text("", field_name="value")


def test_base_analytics_validates_positive_int() -> None:
    """Assert that positive integer validation works."""

    analytics = BaseAnalytics()

    assert analytics._validate_positive_int(1, field_name="limit") == 1

    with pytest.raises(ValueError):
        analytics._validate_positive_int(0, field_name="limit")


def test_base_analytics_sums_and_averages_numeric_values() -> None:
    """Assert that numeric helpers calculate expected values."""

    analytics = BaseAnalytics()
    records = [
        {"total_price": 10000},
        {"total_price": "20000"},
        {"total_price": None},
    ]

    assert analytics._sum_numeric(records, "total_price") == 30000
    assert analytics._average_numeric(records, "total_price") == 10000.0


def test_base_analytics_groups_and_sorts_values() -> None:
    """Assert that grouping and sorting helpers work."""

    analytics = BaseAnalytics()
    records = [
        {"category": "Food", "value": 100},
        {"category": "Food", "value": 200},
        {"category": "Drink", "value": 50},
    ]

    assert analytics._group_count(records, "category") == {
        "Food": 2,
        "Drink": 1,
    }
    assert analytics._group_sum(records, "category", "value") == {
        "Food": 300,
        "Drink": 50,
    }
    assert analytics._sort_mapping_desc(
        {"A": 10, "B": 30},
        limit=1,
    ) == [{"key": "B", "value": 30}]


def test_base_analytics_filters_completed_transactions() -> None:
    """Assert that completed transaction filter works."""

    analytics = BaseAnalytics()
    records = [
        {"status": "completed"},
        {"status": "cancelled"},
        {},
    ]

    completed = analytics._only_completed_transactions(records)

    assert len(completed) == 2
