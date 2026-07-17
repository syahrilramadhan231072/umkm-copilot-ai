"""
Beranda UMKM Copilot AI
=======================
"""

from __future__ import annotations

from typing import Any

from app.frontend.assets import load_custom_css
from app.frontend.navigation import render_navigation, switch_page
from app.frontend.onboarding import build_onboarding_state, is_valid_uuid
from app.frontend.session import (
    DEFAULT_LIMIT,
    build_business_preferences,
    ensure_frontend_session,
    get_api_client_from_session_state,
)
from app.frontend.ui_components import (
    render_business_header,
    render_hero,
    render_progress_indicator,
)


def render_app() -> None:
    """Render halaman beranda."""

    st = _get_streamlit()
    st.set_page_config(
        page_title="UMKM Copilot AI",
        page_icon="🤖",
        layout="wide",
    )
    load_custom_css(st)
    ensure_frontend_session(st.session_state)

    client = get_api_client_from_session_state(st.session_state)
    business_id = str(st.session_state.get("business_id", ""))
    product_id = str(st.session_state.get("active_product_id", ""))
    preferences = build_business_preferences(st.session_state)
    limit = int(st.session_state.get("dashboard_limit", DEFAULT_LIMIT))

    dashboard_response: dict[str, Any] | None = None
    if is_valid_uuid(business_id):
        with st.spinner("Memeriksa kesiapan bisnis..."):
            dashboard_response = client.get_dashboard(
                business_id=business_id,
                limit=limit,
            )

    state = build_onboarding_state(
        business_id=business_id,
        product_id=product_id,
        dashboard_response=dashboard_response,
    )

    render_navigation(st, state)

    render_hero(
        st,
        eyebrow="Selamat datang",
        title="UMKM Copilot AI",
        description=(
            "Isi profil bisnis, tambahkan produk, lalu catat transaksi pertama. "
            "Setelah itu dashboard, asisten AI, dan pemasaran langsung aktif."
        ),
    )

    if state.business_profile_ready:
        render_business_header(st, preferences)

    render_progress_indicator(st, state)
    st.divider()

    if state.dashboard_ready:
        st.success("Bisnis sudah siap digunakan.")
        if st.button("Buka Dashboard", type="primary"):
            switch_page(st, "pages/Dashboard.py")
        return

    if state.next_step == "business_profile":
        st.markdown("### Lengkapi profil bisnis")
        st.caption("Profil bisnis akan disimpan ke backend dan menjadi acuan aplikasi.")
        if st.button("Isi Profil Bisnis", type="primary"):
            switch_page(st, "pages/Business_Profile.py")
        return

    if state.next_step == "products":
        st.markdown("### Tambahkan produk")
        st.caption("Produk akan disimpan ke backend agar transaksi dapat dicatat.")
        if st.button("Buka Produk", type="primary"):
            switch_page(st, "pages/Products.py")
        return

    if state.next_step == "first_transaction":
        st.markdown("### Catat transaksi pertama")
        st.caption("Transaksi pertama akan disimpan ke backend untuk membuka fitur penuh.")
        if st.button("Catat Transaksi Pertama", type="primary"):
            switch_page(st, "pages/First_Transaction.py")


def _get_streamlit() -> Any:
    """Import Streamlit secara lazy."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_app()
