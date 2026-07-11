"""
Export Agent Tests
==================

Pytest test suite for ExportAgent.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.agents.export_agent import ExportAgent


class FakeExportWorkflow:
    """Fake export workflow for agent tests."""

    def __init__(self, fail: bool = False) -> None:
        """Initialize fake workflow."""

        self.fail = fail

    def run_export_dashboard(
        self,
        business_id: str,
        export_format: str = "json",
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return export dashboard workflow response."""

        if self.fail:
            return {
                "success": False,
                "workflow": "run_export_dashboard",
                "steps": [],
                "data": {},
                "error": {"type": "WorkflowStepError", "message": "Failed."},
            }

        return {
            "success": True,
            "workflow": "run_export_dashboard",
            "steps": [],
            "data": {"export": {"filename": f"dashboard.{export_format}"}},
            "error": None,
        }

    def run_export_sales_summary(
        self,
        business_id: str,
        export_format: str = "json",
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return export sales workflow response."""

        return {
            "success": True,
            "workflow": "run_export_sales_summary",
            "steps": [],
            "data": {"export": {"filename": f"sales_summary.{export_format}"}},
            "error": None,
        }

    def run_export_inventory_summary(
        self,
        business_id: str,
        export_format: str = "json",
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Return export inventory workflow response."""

        return {
            "success": True,
            "workflow": "run_export_inventory_summary",
            "steps": [],
            "data": {"export": {"filename": f"inventory_summary.{export_format}"}},
            "error": None,
        }

    def run_export_structured_data(
        self,
        data_to_export: Mapping[str, Any] | list[Mapping[str, Any]],
        export_format: str,
        filename_prefix: str,
    ) -> dict[str, Any]:
        """Return export structured data workflow response."""

        return {
            "success": True,
            "workflow": "run_export_structured_data",
            "steps": [],
            "data": {"export": {"filename": f"{filename_prefix}.{export_format}"}},
            "error": None,
        }


def test_export_agent_exports_dashboard_successfully() -> None:
    """Assert ExportAgent exports dashboard."""

    agent = ExportAgent(FakeExportWorkflow())  # type: ignore[arg-type]
    response = agent.export_dashboard("business-1", export_format="json")

    assert response["success"] is True
    assert response["agent"] == "ExportAgent"
    assert response["data"]["export"]["filename"] == "dashboard.json"


def test_export_agent_returns_failure_when_workflow_fails() -> None:
    """Assert ExportAgent returns failure when workflow fails."""

    agent = ExportAgent(FakeExportWorkflow(fail=True))  # type: ignore[arg-type]
    response = agent.export_dashboard("business-1")

    assert response["success"] is False
    assert response["error"]["type"] == "WorkflowStepError"


def test_export_agent_exports_structured_data_successfully() -> None:
    """Assert ExportAgent exports structured data."""

    agent = ExportAgent(FakeExportWorkflow())  # type: ignore[arg-type]
    response = agent.handle_export(
        {
            "data_to_export": [{"name": "Coffee"}],
            "export_format": "csv",
            "filename_prefix": "products",
        },
        intent="export_structured_data",
    )

    assert response["success"] is True
    assert response["data"]["export"]["filename"] == "products.csv"


def test_export_agent_rejects_invalid_structured_data() -> None:
    """Assert ExportAgent rejects invalid structured data."""

    agent = ExportAgent(FakeExportWorkflow())  # type: ignore[arg-type]
    response = agent.handle_export(
        {
            "data_to_export": "invalid",
            "export_format": "csv",
            "filename_prefix": "products",
        },
        intent="export_structured_data",
    )

    assert response["success"] is False
    assert response["error"]["type"] == "ValueError"
