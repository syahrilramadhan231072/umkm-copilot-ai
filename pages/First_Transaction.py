"""
Transaksi
=========

Halaman untuk mencatat transaksi pada business aktif.
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.frontend.assets import load_frontend_assets
from app.frontend.navigation import render_navigation, switch_page
from app.frontend.onboarding import build_onboarding_state, is_valid_uuid
from app.frontend.session import (
    DEFAULT_LIMIT,
    build_business_preferences,
    ensure_frontend_session,
    get_api_client_from_session_state,
    get_backend_products,
    hydrate_business_from_backend,
    return_to_welcome,
    set_active_product_from_response,
    set_backend_products,
    set_onboarding_step,
)
from app.frontend.ui_components import (
    error_message,
    render_business_header,
    render_hero,
    render_locked_page,
    render_progress_indicator,
)

PAGE_NAME = "transactions"


def render_page() -> None:
    """Render halaman transaksi."""

    st = _get_streamlit()
    st.set_page_config(page_title="Transaksi", page_icon="🧾", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)
    set_onboarding_step(st.session_state, "transactions")

    client = get_api_client_from_session_state(st.session_state)

    if not bool(st.session_state.get("create_new_business_mode")):
        with st.spinner("Memuat workspace bisnis..."):
            hydrate_business_from_backend(st.session_state, client)

    business_id = str(st.session_state.get("business_id", ""))
    product_id = str(st.session_state.get("active_product_id", ""))
    product_name = str(st.session_state.get("active_product_name", "Produk Aktif"))
    session_id = str(st.session_state.get("session_id", ""))
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
        title="Catat Transaksi",
        description="Catat transaksi baru ke backend untuk business aktif.",
    )

    _render_step_navigation(st)

    if state.business_profile_ready:
        render_business_header(st, preferences)

    render_progress_indicator(st, state)

    if not state.business_profile_ready:
        render_locked_page(
            st,
            message="Business aktif belum tersedia.",
            state=state,
            next_action_label="Kembali ke Profil Bisnis",
            next_page="pages/Business_Profile.py",
        )
        return

    products = _load_products(st, client, business_id)
    if not products and product_id:
        products = [{"id": product_id, "name": product_name}]

    if not products:
        render_locked_page(
            st,
            message="Produk belum tersedia. Tambahkan produk terlebih dahulu.",
            state=state,
            next_action_label="Kembali ke Produk",
            next_page="pages/Products.py",
        )
        return

    selected_product = _select_product(st, products)
    selected_product_id = _get_product_id(selected_product)
    selected_product_name = _get_product_name(selected_product)

    if not selected_product_id:
        st.error("Produk terpilih belum memiliki product_id backend.")
        return

    set_active_product_from_response(
        st.session_state,
        {
            "product_id": selected_product_id,
            "name": selected_product_name,
        },
    )

    with st.form("transaction_form"):
        quantity = st.number_input("Jumlah Terjual", min_value=1, value=1, step=1)
        payment_method = st.selectbox(
            "Metode Pembayaran",
            ["cash", "qris", "transfer", "credit_card", "other"],
            format_func=_payment_label,
        )
        notes = st.text_area("Catatan", value="Transaksi penjualan")
        submitted = st.form_submit_button("Catat Transaksi", type="primary")

    if submitted:
        payload = {
            "business_id": business_id,
            "product_id": selected_product_id,
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
            col_a, col_b, col_c = st.columns(3)
            with col_a:
                if st.button("Catat Transaksi Lain"):
                    st.rerun()
            with col_b:
                if st.button("Kembali ke Produk"):
                    switch_page(st, "pages/Products.py")
            with col_c:
                if st.button("Buka Dashboard"):
                    switch_page(st, "pages/Dashboard.py")
        else:
            st.error(error_message(response))
            attempts = response.get("_path_attempts")
            if attempts:
                with st.expander("Detail endpoint yang dicoba"):
                    for attempt in attempts:
                        st.code(str(attempt))


def _render_step_navigation(st: Any) -> None:
    """Render navigasi mundur/maju pada transaksi."""

    col_welcome, col_back, col_dash = st.columns(3)
    with col_welcome:
        if st.button("← Welcome / Dashboard Awal"):
            return_to_welcome(st.session_state)
            switch_page(st, "app.py")
    with col_back:
        if st.button("← Produk"):
            switch_page(st, "pages/Products.py")
    with col_dash:
        if st.button("Dashboard →"):
            switch_page(st, "pages/Dashboard.py")


def _load_products(st: Any, client: Any, business_id: str) -> list[dict[str, Any]]:
    """Muat produk dari backend atau session."""

    products = get_backend_products(st.session_state)
    if products:
        return products

    response = client.list_products(business_id=business_id)
    if response.get("success"):
        data = response.get("data", {})
        loaded_products = data.get("products", []) if isinstance(data, Mapping) else []
        if isinstance(loaded_products, list):
            products = [
                dict(product) for product in loaded_products if isinstance(product, Mapping)
            ]
            set_backend_products(st.session_state, products)
            return products

    return []


def _select_product(st: Any, products: list[dict[str, Any]]) -> dict[str, Any]:
    """Render pilihan produk."""

    options = {_product_label(product): product for product in products if _get_product_id(product)}

    if not options:
        return {}

    selected_label = st.selectbox("Produk", list(options.keys()))
    return options[selected_label]


def _product_label(product: Mapping[str, Any]) -> str:
    """Label produk."""

    name = _get_product_name(product)
    stock = product.get("stock")
    price = product.get("selling_price") or product.get("price")

    parts = [name]
    if price is not None:
        parts.append(f"Rp{price}")
    if stock is not None:
        parts.append(f"stok {stock}")

    return " · ".join(parts)


def _get_product_id(product: Mapping[str, Any]) -> str:
    """Ambil product id."""

    return str(product.get("product_id") or product.get("id") or "").strip()


def _get_product_name(product: Mapping[str, Any]) -> str:
    """Ambil product name."""

    return str(
        product.get("name") or product.get("product_name") or product.get("id") or "Produk"
    ).strip()


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
