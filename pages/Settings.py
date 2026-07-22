"""
Pengaturan
==========
"""

from __future__ import annotations

from typing import Any

from app.frontend.assets import load_frontend_assets
from app.frontend.navigation import render_navigation
from app.frontend.onboarding import build_onboarding_state, is_valid_uuid
from app.frontend.session import (
    DEFAULT_API_BASE_URL,
    DEFAULT_LIMIT,
    build_business_preferences,
    ensure_frontend_session,
    get_api_client_from_session_state,
)
from app.frontend.ui_components import render_business_header, render_hero

PAGE_NAME = "settings"


def render_page() -> None:
    """Render pengaturan."""

    st = _get_streamlit()
    st.set_page_config(page_title="Pengaturan", page_icon="⚙️", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)

    client = get_api_client_from_session_state(st.session_state)
    business_id = str(st.session_state.get("business_id", ""))
    product_id = str(st.session_state.get("active_product_id", ""))
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
        eyebrow="Pengaturan",
        title="Preferensi Bisnis",
        description="Atur preferensi tampilan dan pengalaman aplikasi.",
    )

    if state.business_profile_ready:
        render_business_header(st, preferences)

    with st.expander("Lanjutan"):
        st.caption("Bagian ini hanya untuk pengelola aplikasi.")
        api_base_url = st.text_input(
            "Alamat Layanan",
            value=str(st.session_state.get("api_base_url", DEFAULT_API_BASE_URL)),
        )
        data_limit = st.number_input(
            "Batas Data",
            min_value=1,
            max_value=10_000,
            value=int(st.session_state.get("dashboard_limit", DEFAULT_LIMIT)),
            step=100,
        )

        if st.button("Simpan Pengaturan Lanjutan"):
            st.session_state["api_base_url"] = api_base_url.strip().rstrip("/")
            st.session_state["dashboard_limit"] = int(data_limit)
            st.success("Pengaturan lanjutan tersimpan.")
            st.rerun()

        if st.button("Periksa Koneksi Layanan"):
            response = get_api_client_from_session_state(st.session_state).health_check()
            if response.get("success"):
                st.success("Layanan terhubung.")
            else:
                st.error("Layanan belum terhubung.")


def _get_streamlit() -> Any:
    """Import Streamlit."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_page()
