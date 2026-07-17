"""
Unduh Laporan
=============
"""

from __future__ import annotations

from typing import Any, Mapping

from app.frontend.assets import load_frontend_assets
from app.frontend.navigation import render_navigation
from app.frontend.onboarding import build_onboarding_state, is_valid_uuid
from app.frontend.session import (
    DEFAULT_LIMIT,
    build_business_preferences,
    ensure_frontend_session,
    get_api_client_from_session_state,
)
from app.frontend.ui_components import error_message, render_business_header, render_hero, render_locked_page


PAGE_NAME = "export"


def render_page() -> None:
    """Render unduh laporan."""

    st = _get_streamlit()
    st.set_page_config(page_title="Unduh Laporan", page_icon="⬇️", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)

    client = get_api_client_from_session_state(st.session_state)
    business_id = str(st.session_state.get("business_id", ""))
    product_id = str(st.session_state.get("active_product_id", ""))
    session_id = str(st.session_state.get("session_id", "sesi-utama"))
    preferences = build_business_preferences(st.session_state)
    limit = int(st.session_state.get("dashboard_limit", DEFAULT_LIMIT))

    dashboard_response = None
    if is_valid_uuid(business_id):
        dashboard_response = client.get_dashboard(business_id=business_id, limit=limit)

    state = build_onboarding_state(
        business_id=business_id,
        product_id=product_id,
        dashboard_response=dashboard_response,
    )
    render_navigation(st, state)

    render_hero(
        st,
        eyebrow="Unduh Laporan",
        title="Laporan Bisnis",
        description="Unduh laporan dashboard, penjualan, dan persediaan.",
    )

    if state.business_profile_ready:
        render_business_header(st, preferences)

    if not state.dashboard_ready:
        render_locked_page(
            st,
            message="Laporan akan tersedia setelah dashboard aktif.",
            state=state,
            next_action_label="Lanjutkan Penyiapan",
            next_page="app.py",
        )
        return

    report_type = st.selectbox(
        "Jenis Laporan",
        ["dashboard", "sales_summary", "inventory_summary"],
        format_func=_report_label,
    )
    file_format = st.selectbox(
        "Format File",
        ["json", "csv"],
        format_func=lambda value: value.upper(),
    )

    if st.button("Buat Laporan", type="primary"):
        payload = {
            "business_id": business_id,
            "export_format": file_format,
            "limit": limit,
            "session_id": session_id,
        }
        with st.spinner("Membuat laporan..."):
            if report_type == "dashboard":
                response = client.export_dashboard(payload)
            elif report_type == "sales_summary":
                response = client.export_sales_summary(payload)
            else:
                response = client.export_inventory_summary(payload)
        _render_download(st, response, str(file_format))


def _render_download(st: Any, response: Mapping[str, Any], file_format: str) -> None:
    """Render download."""

    if not response.get("success"):
        st.error(error_message(dict(response)))
        return

    data = response.get("data")
    export_file = data.get("export") if isinstance(data, Mapping) else {}
    if not isinstance(export_file, Mapping):
        export_file = data if isinstance(data, Mapping) else {}

    st.success("Laporan siap diunduh.")
    st.download_button(
        "Unduh Laporan",
        data=str(export_file.get("content", "")),
        file_name=str(export_file.get("filename", f"laporan.{file_format}")),
        mime=str(export_file.get("content_type") or _mime(file_format)),
    )


def _mime(file_format: str) -> str:
    """Resolve MIME."""

    if file_format == "csv":
        return "text/csv"

    return "application/json"


def _report_label(value: str) -> str:
    """Report label."""

    labels = {
        "dashboard": "Dashboard",
        "sales_summary": "Penjualan",
        "inventory_summary": "Persediaan",
    }

    return labels.get(value, value)


def _get_streamlit() -> Any:
    """Import Streamlit."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_page()
