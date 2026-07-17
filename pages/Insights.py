"""
Rekomendasi
===========
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
from app.frontend.ui_components import (
    error_message,
    render_business_header,
    render_hero,
    render_locked_page,
    render_response_table,
)


PAGE_NAME = "insights"


def render_page() -> None:
    """Render rekomendasi."""

    st = _get_streamlit()
    st.set_page_config(page_title="Rekomendasi", page_icon="💡", layout="wide")
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
        eyebrow="Rekomendasi",
        title="Rekomendasi Bisnis",
        description="Lihat rekomendasi berbasis transaksi, produk, persediaan, dan pemasaran.",
    )

    if state.business_profile_ready:
        render_business_header(st, preferences)

    if not state.insights_ready:
        render_locked_page(
            st,
            message="Rekomendasi akan aktif setelah transaksi pertama masuk backend.",
            state=state,
            next_action_label="Catat Transaksi Pertama",
            next_page="pages/First_Transaction.py",
        )
        return

    tab_context, tab_review = st.tabs(["Konteks", "Daftar Rekomendasi"])

    with tab_context:
        if st.button("Muat Konteks Rekomendasi", type="primary"):
            response = client.get_insight_context(
                {
                    "business_id": business_id,
                    "limit": limit,
                    "session_id": session_id,
                    "business_profile": preferences,
                }
            )
            _render_response(st, response)

    with tab_review:
        keyword = st.text_input("Kata Kunci")
        category = st.text_input("Kategori")
        if st.button("Muat Rekomendasi"):
            response = client.get_insight_review(
                business_id=business_id,
                keyword=keyword or None,
                insight_category=category or None,
                limit=limit,
            )
            _render_response(st, response)


def _render_response(st: Any, response: Mapping[str, Any]) -> None:
    """Render response."""

    if not response.get("success"):
        st.error(error_message(dict(response)))
        return

    st.success("Berhasil.")
    render_response_table(st, response.get("data"))


def _get_streamlit() -> Any:
    """Import Streamlit."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_page()
