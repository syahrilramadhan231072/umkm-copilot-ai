"""
Export Page
===========

Streamlit export page for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.frontend.assets import load_frontend_assets

PAGE_NAME = "export"
SUPPORTED_EXPORT_TYPES = {
    "dashboard",
    "sales_summary",
    "inventory_summary",
    "structured",
}
SUPPORTED_FORMATS = {
    "json",
    "csv",
}


def build_export_payload(
    *,
    business_id: str,
    export_type: str,
    export_format: str = "json",
    limit: int = 1000,
    session_id: str | None = None,
) -> dict[str, Any]:
    """Build export payload."""

    _validate_text(business_id, field_name="business_id")
    _validate_choice(export_type, SUPPORTED_EXPORT_TYPES, field_name="export_type")
    _validate_choice(export_format, SUPPORTED_FORMATS, field_name="export_format")
    _validate_positive_int(limit, field_name="limit")

    return {
        "business_id": business_id.strip(),
        "export_type": export_type,
        "export_format": export_format,
        "limit": limit,
        "session_id": _optional_text(session_id),
    }


def build_structured_export_payload(
    *,
    data_to_export: dict[str, Any] | list[dict[str, Any]],
    export_format: str,
    filename_prefix: str,
) -> dict[str, Any]:
    """Build structured export payload."""

    if not isinstance(data_to_export, (dict, list)):
        raise ValueError("data_to_export must be a dictionary or list.")

    _validate_choice(export_format, SUPPORTED_FORMATS, field_name="export_format")
    _validate_text(filename_prefix, field_name="filename_prefix")

    return {
        "data_to_export": data_to_export,
        "export_format": export_format,
        "filename_prefix": filename_prefix.strip(),
    }


def extract_export_file(response: Mapping[str, Any]) -> dict[str, Any]:
    """Extract export file payload."""

    if not response.get("success"):
        return {}

    data = response.get("data", {})
    if not isinstance(data, Mapping):
        return {}

    export_data = data.get("export")
    if isinstance(export_data, Mapping):
        return dict(export_data)

    return dict(data)


def get_download_mime(content_type: str | None, export_format: str) -> str:
    """Resolve download MIME type."""

    if content_type:
        return content_type

    if export_format == "csv":
        return "text/csv"

    return "application/json"


def render_page(api_client: Any | None = None) -> None:
    """Render export page."""

    st = _get_streamlit()
    st.set_page_config(page_title="Export", page_icon="⬇️", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)

    business_id = st.session_state.get("business_id", "")
    session_id = st.session_state.get("session_id", "")

    export_type = st.selectbox(
        "Export Type",
        ["dashboard", "sales_summary", "inventory_summary"],
    )
    export_format = st.selectbox("Format", ["json", "csv"])
    limit = st.number_input("Limit", min_value=1, value=1000, step=100)

    if api_client is None:
        st.info("Hubungkan API client untuk export.")
        return

    if st.button("Generate Export"):
        payload = build_export_payload(
            business_id=business_id,
            export_type=str(export_type),
            export_format=str(export_format),
            limit=int(limit),
            session_id=session_id,
        )

        if export_type == "dashboard":
            response = api_client.export_dashboard(payload)
        elif export_type == "sales_summary":
            response = api_client.export_sales_summary(payload)
        else:
            response = api_client.export_inventory_summary(payload)

        if not response.get("success"):
            st.error(_error_message(response))
            return

        export_file = extract_export_file(response)
        st.success("Export ready.")
        st.download_button(
            label="Download",
            data=str(export_file.get("content", "")),
            file_name=str(export_file.get("filename", "export.json")),
            mime=get_download_mime(
                export_file.get("content_type"),
                str(export_format),
            ),
        )


def _error_message(response: Mapping[str, Any]) -> str:
    """Return error message."""

    error = response.get("error")
    if isinstance(error, Mapping):
        return str(error.get("message", "Export request failed."))

    return "Export request failed."


def _get_streamlit() -> Any:
    """Import Streamlit lazily."""

    import streamlit as st

    return st


def _validate_text(value: Any, *, field_name: str) -> None:
    """Validate required text."""

    if value is None or not str(value).strip():
        raise ValueError(f"{field_name} is required.")


def _validate_positive_int(value: Any, *, field_name: str) -> None:
    """Validate positive integer."""

    if not isinstance(value, int) or value <= 0:
        raise ValueError(f"{field_name} must be a positive integer.")


def _validate_choice(value: str, choices: set[str], *, field_name: str) -> None:
    """Validate choice value."""

    if value not in choices:
        raise ValueError(f"{field_name} must be one of {sorted(choices)}.")


def _optional_text(value: str | None) -> str | None:
    """Normalize optional text."""

    if value is None:
        return None

    text = str(value).strip()

    return text or None


if __name__ == "__main__":
    render_page()
