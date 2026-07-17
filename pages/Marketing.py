"""
Pemasaran
=========
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


PAGE_NAME = "marketing"


def render_page() -> None:
    """Render pemasaran."""

    st = _get_streamlit()
    st.set_page_config(page_title="Pemasaran", page_icon="📣", layout="wide")
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
        eyebrow="Pemasaran",
        title="Ruang Kerja Pemasaran",
        description="Bangun konteks promosi dan simpan riwayat campaign.",
    )

    if state.business_profile_ready:
        render_business_header(st, preferences)

    if not state.marketing_ready:
        render_locked_page(
            st,
            message="Pemasaran akan aktif setelah profil dan produk tersimpan di backend.",
            state=state,
            next_action_label="Buka Produk",
            next_page="pages/Products.py",
        )
        return

    tab_context, tab_save, tab_history = st.tabs(["Konteks Produk", "Simpan Campaign", "Riwayat"])

    with tab_context:
        if st.button("Bangun Konteks Pemasaran", type="primary"):
            response = client.get_marketing_context(
                {
                    "product_id": product_id,
                    "business_id": business_id,
                    "session_id": session_id,
                    "business_profile": preferences,
                }
            )
            _render_response(st, response)

    with tab_save:
        with st.form("marketing_form"):
            platform = st.text_input("Platform", value="Instagram")
            caption = st.text_area("Caption")
            campaign = st.text_input("Nama Campaign")
            submitted = st.form_submit_button("Simpan Campaign")
        if submitted:
            response = client.create_marketing_record(
                {
                    "business_id": business_id,
                    "marketing_data": {
                        "platform": platform,
                        "caption": caption,
                        "campaign_name": campaign,
                        "product_id": product_id,
                    },
                    "session_id": session_id,
                }
            )
            _render_response(st, response)

    with tab_history:
        keyword = st.text_input("Kata Kunci")
        if st.button("Muat Riwayat"):
            response = client.get_marketing_history(
                business_id=business_id,
                keyword=keyword or None,
                limit=100,
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
