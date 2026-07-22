"""
Export
======
"""

from __future__ import annotations

import json
from collections.abc import Callable, Mapping
from typing import Any

from app.frontend.assets import load_frontend_assets
from app.frontend.navigation import render_navigation
from app.frontend.onboarding import build_onboarding_state, is_valid_uuid
from app.frontend.session import (
    DEFAULT_LIMIT,
    build_business_preferences,
    ensure_frontend_session,
    get_api_client_from_session_state,
)
from app.frontend.ui_components import (
    error_message,
    render_action_card,
    render_business_header,
    render_empty_state,
    render_locked_page,
    render_metric_card,
    render_page_header,
    render_section_header,
    safe_text,
)

PAGE_NAME = "export"


def render_page() -> None:
    """Render export/download center."""

    st = _get_streamlit()
    st.set_page_config(page_title="Go-UMKM AI · Export", page_icon="⬇️", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)

    client = get_api_client_from_session_state(st.session_state)
    business_id = str(st.session_state.get("business_id", ""))
    product_id = str(st.session_state.get("active_product_id", ""))
    session_id = str(st.session_state.get("session_id", ""))
    preferences = build_business_preferences(st.session_state)
    limit = int(st.session_state.get("dashboard_limit", DEFAULT_LIMIT))

    dashboard_response = (
        client.get_dashboard(business_id=business_id, limit=limit)
        if is_valid_uuid(business_id)
        else None
    )
    state = build_onboarding_state(
        business_id=business_id,
        product_id=product_id,
        dashboard_response=dashboard_response,
    )
    render_navigation(st, state)

    render_page_header(
        st,
        eyebrow="Reports",
        title="Download Center",
        description=(
            "Unduh laporan dashboard, sales summary, inventory summary, dan structured data."
        ),
        icon="⬇️",
    )

    if state.business_profile_ready:
        render_business_header(st, preferences)

    if not state.dashboard_ready:
        render_locked_page(
            st,
            message="Export aktif setelah dashboard memiliki data.",
            state=state,
            next_action_label="Buka Dashboard",
            next_page="pages/Dashboard.py",
        )
        return

    _render_export_metrics(st)
    _render_report_cards(st, client, business_id, session_id, limit)
    _render_export_history(st)


def _render_export_metrics(st: Any) -> None:
    """Render export metrics."""

    cols = st.columns(4)
    with cols[0]:
        render_metric_card(
            st,
            label="Formats",
            value="CSV",
            caption="Excel/PDF ready UI badges",
            icon="📄",
        )
    with cols[1]:
        render_metric_card(
            st,
            label="Reports",
            value="4",
            caption="dashboard, sales, inventory, structured",
            icon="📊",
            tone="indigo",
        )
    with cols[2]:
        render_metric_card(
            st,
            label="Status",
            value="Ready",
            caption="download center",
            icon="🟢",
            tone="success",
        )
    with cols[3]:
        render_metric_card(
            st,
            label="Data",
            value="Live",
            caption="from FastAPI backend",
            icon="⚡",
            tone="warning",
        )


def _render_report_cards(
    st: Any, client: Any, business_id: str, session_id: str, limit: int
) -> None:
    """Render report cards."""

    render_section_header(
        st,
        eyebrow="Reports",
        title="Choose Report",
        description="Pilih laporan yang dibutuhkan. Backend contract tetap sama.",
    )

    report_options: list[dict[str, Any]] = [
        {
            "title": "Dashboard Report",
            "description": "Ringkasan dashboard bisnis.",
            "icon": "📊",
            "badge": "CSV",
            "key": "dashboard",
            "handler": client.export_dashboard,
        },
        {
            "title": "Sales Summary",
            "description": "Ringkasan penjualan dan transaksi.",
            "icon": "💰",
            "badge": "CSV",
            "key": "sales_summary",
            "handler": client.export_sales_summary,
        },
        {
            "title": "Inventory Summary",
            "description": "Ringkasan produk dan persediaan.",
            "icon": "📦",
            "badge": "CSV",
            "key": "inventory_summary",
            "handler": client.export_inventory_summary,
        },
        {
            "title": "Structured Data",
            "description": "Data terstruktur untuk analisis lanjutan.",
            "icon": "🧩",
            "badge": "JSON",
            "key": "structured",
            "handler": client.export_structured_data,
        },
    ]

    cols = st.columns(4)
    for index, option in enumerate(report_options):
        with cols[index % 4]:
            render_action_card(
                st,
                title=str(option["title"]),
                description=str(option["description"]),
                icon=str(option["icon"]),
                badge=str(option["badge"]),
            )
            if st.button(
                f"Generate {option['badge']}",
                key=f"export_{option['key']}",
                use_container_width=True,
            ):
                _generate_download(
                    st=st,
                    handler=option["handler"],
                    business_id=business_id,
                    session_id=session_id,
                    report_key=str(option["key"]),
                    file_format="csv" if option["badge"] == "CSV" else "json",
                    limit=limit,
                )


def _generate_download(
    *,
    st: Any,
    handler: Callable[[Mapping[str, Any]], Mapping[str, Any]],
    business_id: str,
    session_id: str,
    report_key: str,
    file_format: str,
    limit: int,
) -> None:
    """Generate download payload."""

    response = handler(
        {
            "business_id": business_id,
            "session_id": session_id,
            "file_format": file_format,
            "limit": limit,
        }
    )
    if not response.get("success"):
        st.error(error_message(response))
        return

    data = response.get("data", {})
    file_content = _extract_file_content(data)
    filename = _extract_filename(data, report_key, file_format)

    st.success("Laporan siap diunduh.")
    st.download_button(
        label=f"Download {filename}",
        data=file_content,
        file_name=filename,
        mime=_mime(file_format),
        use_container_width=True,
    )


def _render_export_history(st: Any) -> None:
    """Render visual export history placeholder."""

    render_section_header(
        st,
        eyebrow="History",
        title="Export History",
        description="Riwayat export lokal akan tampil selama sesi berjalan.",
    )
    render_empty_state(
        st,
        title="Belum ada histori export permanen",
        description="File yang baru dibuat dapat langsung diunduh dari kartu report di atas.",
        icon="📁",
    )


def _extract_file_content(data: Any) -> str:
    """Extract file content."""

    if isinstance(data, Mapping):
        content = (
            data.get("content") or data.get("file_content") or data.get("csv") or data.get("json")
        )
        if isinstance(content, str):
            return content
        return json.dumps(data, ensure_ascii=False, default=str, indent=2)

    return safe_text(data, "")


def _extract_filename(data: Any, report_key: str, file_format: str) -> str:
    """Extract filename."""

    if isinstance(data, Mapping):
        filename = data.get("filename") or data.get("file_name")
        if isinstance(filename, str) and filename.strip():
            return filename.strip()

    return f"go_umkm_{report_key}.{file_format}"


def _mime(file_format: str) -> str:
    """Resolve MIME type."""

    if file_format == "csv":
        return "text/csv"

    if file_format == "xlsx":
        return "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"

    if file_format == "pdf":
        return "application/pdf"

    return "application/json"


def _get_streamlit() -> Any:
    """Import Streamlit."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_page()
