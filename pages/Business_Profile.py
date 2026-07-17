"""
Profil Bisnis
=============
"""

from __future__ import annotations

from typing import Any

from app.frontend.assets import load_frontend_assets
from app.frontend.navigation import render_navigation, switch_page
from app.frontend.onboarding import build_onboarding_state, is_valid_uuid
from app.frontend.session import (
    DEFAULT_LIMIT,
    build_business_preferences,
    ensure_frontend_session,
    get_api_client_from_session_state,
    set_business_from_response,
)
from app.frontend.ui_components import (
    error_message,
    render_business_header,
    render_hero,
    render_progress_indicator,
)


PAGE_NAME = "business_profile"


def render_page() -> None:
    """Render halaman profil bisnis."""

    st = _get_streamlit()
    st.set_page_config(page_title="Profil Bisnis", page_icon="🏪", layout="wide")
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
        eyebrow="Langkah 1",
        title="Profil Bisnis",
        description="Simpan profil bisnis ke backend agar aplikasi memiliki identitas bisnis yang valid.",
    )

    if state.business_profile_ready:
        render_business_header(st, preferences)
        st.success("Profil bisnis sudah tersimpan.")
        if st.button("Lanjut ke Produk", type="primary"):
            switch_page(st, "pages/Products.py")
        return

    render_progress_indicator(st, state)

    with st.form("business_profile_form"):
        business_name = st.text_input("Nama Bisnis", placeholder="Contoh: Demo Coffee")
        owner_name = st.text_input("Nama Pemilik", placeholder="Contoh: Sari")
        business_type = st.text_input("Jenis Usaha", placeholder="Contoh: Kuliner")
        currency = st.selectbox("Mata Uang", ["IDR", "USD"])
        timezone = st.selectbox(
            "Zona Waktu",
            ["Asia/Jakarta", "Asia/Makassar", "Asia/Jayapura"],
        )
        submitted = st.form_submit_button("Simpan Profil Bisnis", type="primary")

    if submitted:
        if not business_name.strip() or not owner_name.strip() or not business_type.strip():
            st.warning("Lengkapi Nama Bisnis, Nama Pemilik, dan Jenis Usaha.")
            return

        payload = {
            "business_name": business_name,
            "owner_name": owner_name,
            "business_type": business_type,
            "currency": currency,
            "timezone": timezone,
            "language": "Bahasa Indonesia",
        }
        with st.spinner("Menyimpan profil bisnis..."):
            response = client.create_business_profile(payload)

        if response.get("success"):
            data = response.get("data")
            if isinstance(data, dict):
                set_business_from_response(st.session_state, data)
                st.success("Profil bisnis berhasil disimpan.")
                st.rerun()
            else:
                st.error("Response profil bisnis tidak sesuai.")
        else:
            st.error(error_message(response))


def _get_streamlit() -> Any:
    """Import Streamlit."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_page()
