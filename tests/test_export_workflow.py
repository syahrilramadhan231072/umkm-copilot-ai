"""
Export Workflow Tests
=====================

Pytest test suite for ExportWorkflow.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.workflows.export_workflow import ExportWorkflow


class FakeExportTools:
    """Fake export tools for workflow tests."""

    def __init__(self, fail_dashboard: bool = False) -> None:
        """Initialize fake export tools."""

        self.fail_dashboard = fail_dashboard

    def export_dashboard(
        self,
        business_id: str,
        export_format: str = "json",
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Return export dashboard response."""

        if self.fail_dashboard:
            return {
                "success": False,
                "tool": "export_dashboard",
                "data": None,
                "error": {"type": "RuntimeError", "message": "Export failed."},
            }

        return {
            "success": True,
            "tool": "export_dashboard",
            "data": {
                "filename": f"dashboard.{export_format}",
                "content": "{}",
                "limit": limit,
            },
            "error": None,
        }

    def export_sales_summary(
        self,
        business_id: str,
        export_format: str = "json",
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Return export sales summary response."""

        return {
            "success": True,
            "tool": "export_sales_summary",
            "data": {
                "filename": f"sales_summary.{export_format}",
                "content": "{}",
            },
            "error": None,
        }

    def export_inventory_summary(
        self,
        business_id: str,
        export_format: str = "json",
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Return export inventory summary response."""

        return {
            "success": True,
            "tool": "export_inventory_summary",
            "data": {
                "filename": f"inventory_summary.{export_format}",
                "content": "{}",
            },
            "error": None,
        }

    def export_structured_data(
        self,
        data: Mapping[str, Any] | list[Mapping[str, Any]],
        export_format: str,
        filename_prefix: str,
    ) -> dict[str, Any]:
        """Return export structured data response."""

        return {
            "success": True,
            "tool": "export_structured_data",
            "data": {
                "filename": f"{filename_prefix}.{export_format}",
                "content": str(data),
            },
            "error": None,
        }


class FakeConversationTools:
    """Fake conversation tools for workflow tests."""

    def __init__(self, fail: bool = False) -> None:
        """Initialize fake conversation tools."""

        self.fail = fail

    def save_message(
        self,
        business_id: str,
        session_id: str,
        role: str,
        message: str,
        agent: str | None = None,
    ) -> dict[str, Any]:
        """Return save message response."""

        if self.fail:
            return {
                "success": False,
                "tool": "save_message",
                "data": None,
                "error": {"type": "RuntimeError", "message": "Save failed."},
            }

        return {
            "success": True,
            "tool": "save_message",
            "data": {"business_id": business_id, "session_id": session_id},
            "error": None,
        }


def test_export_workflow_exports_dashboard_successfully() -> None:
    """Assert dashboard export workflow succeeds."""

    workflow = ExportWorkflow(
        export_tools=FakeExportTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_export_dashboard(
        business_id="business-1",
        export_format="json",
    )

    assert response["success"] is True
    assert response["workflow"] == "run_export_dashboard"
    assert response["data"]["export"]["filename"] == "dashboard.json"


def test_export_workflow_stops_on_export_failure() -> None:
    """Assert export workflow stops on required export failure."""

    workflow = ExportWorkflow(
        export_tools=FakeExportTools(fail_dashboard=True),  # type: ignore[arg-type]
    )

    response = workflow.run_export_dashboard(
        business_id="business-1",
        export_format="json",
    )

    assert response["success"] is False
    assert response["error"]["step"] == "export_dashboard"


def test_export_workflow_records_optional_warning() -> None:
    """Assert optional conversation failure becomes warning."""

    workflow = ExportWorkflow(
        export_tools=FakeExportTools(),  # type: ignore[arg-type]
        conversation_tools=FakeConversationTools(fail=True),  # type: ignore[arg-type]
    )

    response = workflow.run_export_dashboard(
        business_id="business-1",
        export_format="json",
        session_id="session-1",
    )

    assert response["success"] is True
    assert response["data"]["warnings"][0]["step"] == "save_workflow_message"


def test_export_workflow_exports_structured_data_successfully() -> None:
    """Assert structured data export workflow succeeds."""

    workflow = ExportWorkflow(
        export_tools=FakeExportTools(),  # type: ignore[arg-type]
    )

    response = workflow.run_export_structured_data(
        data_to_export=[{"name": "Coffee"}],
        export_format="csv",
        filename_prefix="products",
    )

    assert response["success"] is True
    assert response["data"]["export"]["filename"] == "products.csv"
