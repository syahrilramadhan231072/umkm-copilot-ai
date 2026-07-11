"""
Business Context Tests
======================

Pytest test suite for BusinessContext.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

import pytest

from app.memory.business_context import BusinessContext


class FakeBusinessService:
    """Fake BusinessService for memory tests."""

    def get_business_profile(self) -> dict[str, Any]:
        """Return business profile."""

        return {
            "id": "business-1",
            "business_name": "Demo UMKM",
            "currency": "IDR",
            "timezone": "Asia/Jakarta",
        }

    def get_business_context(self) -> dict[str, Any]:
        """Return business context."""

        return {
            "business_id": "business-1",
            "business_name": "Demo UMKM",
            "currency": "IDR",
            "timezone": "Asia/Jakarta",
        }

    def get_business_id(self) -> str:
        """Return active business ID."""

        return "business-1"


class FakeAnalyticsTools:
    """Fake AnalyticsTools for memory tests."""

    def __init__(self, fail: bool = False) -> None:
        """Initialize fake analytics tools."""

        self.fail = fail

    def build_dashboard_payload(
        self,
        business_id: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Return dashboard payload response."""

        if self.fail:
            return {
                "success": False,
                "tool": "build_dashboard_payload",
                "data": None,
                "error": {"type": "RuntimeError", "message": "Dashboard failed."},
            }

        return {
            "success": True,
            "tool": "build_dashboard_payload",
            "data": {
                "business_id": business_id,
                "kpi_cards": [],
                "limit": limit,
            },
            "error": None,
        }


class FakeInsightTools:
    """Fake InsightTools for memory tests."""

    def build_business_insight_context(
        self,
        business_id: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Return insight context response."""

        return {
            "success": True,
            "tool": "build_business_insight_context",
            "data": {
                "business_id": business_id,
                "products": [],
                "recent_insights": [],
                "limit": limit,
            },
            "error": None,
        }


def test_business_context_loads_business_profile() -> None:
    """Assert BusinessContext loads business profile."""

    memory = BusinessContext(FakeBusinessService())  # type: ignore[arg-type]
    profile = memory.load_business_profile()

    assert profile["id"] == "business-1"
    assert profile["business_name"] == "Demo UMKM"


def test_business_context_builds_complete_state() -> None:
    """Assert BusinessContext builds complete business state."""

    memory = BusinessContext(
        business_service=FakeBusinessService(),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
        insight_tools=FakeInsightTools(),  # type: ignore[arg-type]
    )

    state = memory.build_business_state(
        business_id="business-1",
        include_dashboard=True,
        include_insights=True,
        limit=10,
    )

    assert state["business_id"] == "business-1"
    assert state["business_profile"]["business_name"] == "Demo UMKM"
    assert state["dashboard_context"]["business_id"] == "business-1"
    assert state["insight_context"]["business_id"] == "business-1"
    assert state["metadata"]["source"] == "BusinessContext"


def test_business_context_appends_business_memory_to_state() -> None:
    """Assert BusinessContext appends memory into existing state."""

    memory = BusinessContext(
        business_service=FakeBusinessService(),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(),  # type: ignore[arg-type]
        insight_tools=FakeInsightTools(),  # type: ignore[arg-type]
    )

    state = memory.append_business_context(
        {"business_id": "business-1", "input": "hello"},
        include_dashboard=False,
        include_insights=False,
    )

    assert state["input"] == "hello"
    assert state["business_memory"]["business_id"] == "business-1"
    assert state["business_memory"]["dashboard_context"] is None
    assert state["business_memory"]["insight_context"] is None


def test_business_context_rejects_mismatched_business_id() -> None:
    """Assert BusinessContext rejects mismatched business ID."""

    memory = BusinessContext(FakeBusinessService())  # type: ignore[arg-type]

    with pytest.raises(RuntimeError):
        memory.build_business_state(
            business_id="different-business",
            include_dashboard=False,
            include_insights=False,
        )


def test_business_context_raises_when_required_tool_fails() -> None:
    """Assert BusinessContext raises RuntimeError when required tool fails."""

    memory = BusinessContext(
        business_service=FakeBusinessService(),  # type: ignore[arg-type]
        analytics_tools=FakeAnalyticsTools(fail=True),  # type: ignore[arg-type]
        insight_tools=FakeInsightTools(),  # type: ignore[arg-type]
    )

    with pytest.raises(RuntimeError):
        memory.build_business_state(
            business_id="business-1",
            include_dashboard=True,
            include_insights=False,
        )


def test_business_context_rejects_invalid_limit() -> None:
    """Assert BusinessContext rejects invalid limit."""

    memory = BusinessContext(FakeBusinessService())  # type: ignore[arg-type]

    with pytest.raises(ValueError):
        memory.build_business_state(
            business_id="business-1",
            include_dashboard=False,
            include_insights=False,
            limit=0,
        )
