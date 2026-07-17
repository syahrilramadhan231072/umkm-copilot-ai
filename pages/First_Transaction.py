"""
Transaksi Pertama
=================
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
)
from app.frontend.ui_components import (
    error_message,
    render_business_header,
    render_hero,
    render_locked_page,
    render_progress_indicator,
)


PAGE_NAME = "first_transaction"


def render_page() -> None:
    """Render halaman transaksi pertama."""

    st = _get_streamlit()
    st.set_page_config(page_title="Transaksi Pertama", page_icon="🧾", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)

    client = get_api_client_from_session_state(st.session_state)
    business_id = str(st.session_state.get("business_id", ""))
    product_id = str(st.session_state.get("active_product_id", ""))
    product_name = str(st.session_state.get("active_product_name", "Produk Aktif"))
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
        eyebrow="Langkah 3",
        title="Transaksi Pertama",
        description="Catat penjualan pertama ke backend agar fitur penuh langsung aktif.",
    )

    if state.business_profile_ready:
        render_business_header(st, preferences)

    render_progress_indicator(st, state)

    if not state.business_profile_ready:
        render_locked_page(
            st,
            message="Profil bisnis belum tersedia.",
            state=state,
            next_action_label="Isi Profil Bisnis",
            next_page="pages/Business_Profile.py",
        )
        return

    if not state.product_ready:
        render_locked_page(
            st,
            message="Produk belum tersedia.",
            state=state,
            next_action_label="Tambah Produk",
            next_page="pages/Products.py",
        )
        return

    if state.has_transactions:
        st.success("Transaksi sudah tersedia. Dashboard siap digunakan.")
        if st.button("Buka Dashboard", type="primary"):
            switch_page(st, "pages/Dashboard.py")
        return

    st.info(f"Produk aktif: {product_name}")

    with st.form("first_transaction_form"):
        quantity = st.number_input("Jumlah Terjual", min_value=1, value=1, step=1)
        payment_method = st.selectbox(
            "Metode Pembayaran",
            ["cash", "qris", "transfer", "credit_card", "other"],
            format_func=_payment_label,
        )
        notes = st.text_area("Catatan", value="Transaksi pertama")
        submitted = st.form_submit_button("Catat Transaksi", type="primary")

    if submitted:
        payload = {
            "business_id": business_id,
            "product_id": product_id,
            "quantity": int(quantity),
            "payment_method": str(payment_method),
            "status": "completed",
            "notes": notes,
            "session_id": session_id,
        }
        with st.spinner("Mencatat transaksi..."):
            response = client.record_transaction(payload)

        if response.get("success"):
            st.success("Transaksi berhasil dicatat.")
            st.rerun()
        else:
            st.error(error_message(response))


def _payment_label(value: str) -> str:
    """Ubah label metode pembayaran."""

    labels = {
        "cash": "Tunai",
        "qris": "QRIS",
        "transfer": "Transfer",
        "credit_card": "Kartu Kredit",
        "other": "Lainnya",
    }

    return labels.get(value, value)


def _get_streamlit() -> Any:
    """Import Streamlit."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_page()
