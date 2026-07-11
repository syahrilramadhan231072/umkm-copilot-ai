"""
Export Tools
============

Thin adapter tools for exporting structured data.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

import csv
import io
import json
from typing import Any, Mapping

from app.tools.analytics_tools import AnalyticsTools
from app.utils.logger import logger


class ExportTools:
    """
    Tool adapter for export use cases.

    ExportTools transforms structured data into export payloads. It does not
    write files, access repositories, access databases, generate prompts, or call
    LLM providers.
    """

    SUPPORTED_FORMATS = {"json", "csv"}

    def __init__(self, analytics_tools: AnalyticsTools) -> None:
        """
        Initialize export tools.

        Args:
            analytics_tools: Analytics tools dependency for read-only payloads.
        """

        self._analytics_tools = analytics_tools
        self._logger = logger

    def export_dashboard(
        self,
        business_id: str,
        export_format: str = "json",
        limit: int = 1000,
    ) -> dict[str, Any]:
        """
        Export dashboard payload.

        Args:
            business_id: Business identifier.
            export_format: Export format, either json or csv.
            limit: Maximum number of records read.

        Returns:
            Tool response containing export payload.
        """

        tool_name = "export_dashboard"

        try:
            self._validate_export_format(export_format)
            dashboard_response = self._analytics_tools.build_dashboard_payload(
                business_id=business_id,
                limit=limit,
            )

            if not dashboard_response["success"]:
                return dashboard_response

            export_payload = self._build_export_payload(
                data=dashboard_response["data"],
                export_format=export_format,
                filename_prefix="dashboard",
            )

            return self._success(tool_name, export_payload)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def export_sales_summary(
        self,
        business_id: str,
        export_format: str = "json",
        limit: int = 1000,
    ) -> dict[str, Any]:
        """
        Export sales summary.

        Args:
            business_id: Business identifier.
            export_format: Export format, either json or csv.
            limit: Maximum number of records read.

        Returns:
            Tool response containing export payload.
        """

        tool_name = "export_sales_summary"

        try:
            self._validate_export_format(export_format)
            response = self._analytics_tools.get_sales_summary(
                business_id=business_id,
                limit=limit,
            )

            if not response["success"]:
                return response

            payload = self._build_export_payload(
                data=response["data"],
                export_format=export_format,
                filename_prefix="sales_summary",
            )

            return self._success(tool_name, payload)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def export_inventory_summary(
        self,
        business_id: str,
        export_format: str = "json",
        limit: int = 1000,
    ) -> dict[str, Any]:
        """
        Export inventory summary.

        Args:
            business_id: Business identifier.
            export_format: Export format, either json or csv.
            limit: Maximum number of records read.

        Returns:
            Tool response containing export payload.
        """

        tool_name = "export_inventory_summary"

        try:
            self._validate_export_format(export_format)
            response = self._analytics_tools.get_inventory_summary(
                business_id=business_id,
                limit=limit,
            )

            if not response["success"]:
                return response

            payload = self._build_export_payload(
                data=response["data"],
                export_format=export_format,
                filename_prefix="inventory_summary",
            )

            return self._success(tool_name, payload)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def export_structured_data(
        self,
        data: Mapping[str, Any] | list[Mapping[str, Any]],
        export_format: str,
        filename_prefix: str,
    ) -> dict[str, Any]:
        """
        Export supplied structured data.

        Args:
            data: Structured data to export.
            export_format: Export format, either json or csv.
            filename_prefix: Export filename prefix.

        Returns:
            Tool response containing export payload.
        """

        tool_name = "export_structured_data"

        try:
            self._validate_export_format(export_format)
            self._validate_text(filename_prefix, field_name="filename_prefix")

            payload = self._build_export_payload(
                data=data,
                export_format=export_format,
                filename_prefix=filename_prefix,
            )

            return self._success(tool_name, payload)
        except Exception as exc:
            return self._failure(tool_name, exc)

    def _build_export_payload(
        self,
        data: Mapping[str, Any] | list[Mapping[str, Any]],
        export_format: str,
        filename_prefix: str,
    ) -> dict[str, Any]:
        """
        Build export payload.

        Args:
            data: Structured data.
            export_format: Export format.
            filename_prefix: Filename prefix.

        Returns:
            Export payload.
        """

        content = self._to_json(data) if export_format == "json" else self._to_csv(data)

        return {
            "filename": f"{filename_prefix}.{export_format}",
            "format": export_format,
            "content": content,
            "content_type": (
                "application/json" if export_format == "json" else "text/csv"
            ),
        }

    def _to_json(
        self,
        data: Mapping[str, Any] | list[Mapping[str, Any]],
    ) -> str:
        """
        Convert structured data to JSON string.

        Args:
            data: Structured data.

        Returns:
            JSON string.
        """

        return json.dumps(data, ensure_ascii=False, indent=2, default=str)

    def _to_csv(
        self,
        data: Mapping[str, Any] | list[Mapping[str, Any]],
    ) -> str:
        """
        Convert structured data to CSV string.

        Args:
            data: Structured data.

        Returns:
            CSV string.
        """

        rows = self._flatten_for_csv(data)

        if not rows:
            return ""

        fieldnames = sorted({key for row in rows for key in row.keys()})

        buffer = io.StringIO()
        writer = csv.DictWriter(buffer, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

        return buffer.getvalue()

    def _flatten_for_csv(
        self,
        data: Mapping[str, Any] | list[Mapping[str, Any]],
    ) -> list[dict[str, Any]]:
        """
        Flatten structured data into CSV-compatible rows.

        Args:
            data: Structured data.

        Returns:
            CSV-compatible rows.
        """

        if isinstance(data, Mapping):
            return [self._flatten_mapping(data)]

        return [self._flatten_mapping(row) for row in data]

    def _flatten_mapping(
        self,
        data: Mapping[str, Any],
        prefix: str = "",
    ) -> dict[str, Any]:
        """
        Flatten nested mapping.

        Args:
            data: Mapping to flatten.
            prefix: Nested key prefix.

        Returns:
            Flat mapping.
        """

        flattened: dict[str, Any] = {}

        for key, value in data.items():
            new_key = f"{prefix}.{key}" if prefix else str(key)

            if isinstance(value, Mapping):
                flattened.update(self._flatten_mapping(value, new_key))
            elif isinstance(value, list):
                flattened[new_key] = json.dumps(
                    value,
                    ensure_ascii=False,
                    default=str,
                )
            else:
                flattened[new_key] = value

        return flattened

    def _validate_export_format(self, export_format: str) -> None:
        """
        Validate export format.

        Args:
            export_format: Export format.

        Raises:
            ValueError: If export format is unsupported.
        """

        if export_format not in self.SUPPORTED_FORMATS:
            raise ValueError(
                f"export_format must be one of {sorted(self.SUPPORTED_FORMATS)}."
            )

    def _validate_text(self, value: Any, *, field_name: str) -> None:
        """
        Validate required text.

        Args:
            value: Text value.
            field_name: Field name used in error messages.
        """

        if value is None or not str(value).strip():
            raise ValueError(f"{field_name} is required.")

    def _success(self, tool_name: str, data: Any) -> dict[str, Any]:
        """Build successful tool response."""

        return {
            "success": True,
            "tool": tool_name,
            "data": data,
            "error": None,
        }

    def _failure(self, tool_name: str, error: Exception) -> dict[str, Any]:
        """Build failed tool response."""

        self._logger.exception("Export tool failed: %s", tool_name)

        return {
            "success": False,
            "tool": tool_name,
            "data": None,
            "error": {
                "type": error.__class__.__name__,
                "message": str(error),
            },
        }
