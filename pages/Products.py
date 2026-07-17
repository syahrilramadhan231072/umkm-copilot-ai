"""
Produk
======
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
    get_backend_products,
    set_active_product_from_response,
    set_backend_products,
)
from app.frontend.ui_components import (
    error_message,
    render_business_header,
    render_hero,
    render_locked_page,
    render_progress_indicator,
)


PAGE_NAME = "products"


def render_page() -> None:
    """Render halaman produk."""

    st = _get_streamlit()
    st.set_page_config(page_title="Produk", page_icon="📦", layout="wide")
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
        eyebrow="Langkah 2",
        title="Produk",
        description="Simpan produk ke backend agar transaksi dapat dicatat dengan data operasional.",
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

    if st.button("Muat Produk Tersimpan"):
        response = client.list_products(business_id=business_id)
        if response.get("success"):
            data = response.get("data", {})
            products = data.get("products", []) if isinstance(data, dict) else []
            if isinstance(products, list):
                set_backend_products(st.session_state, products)
                st.success("Produk berhasil dimuat.")
        else:
            st.error(error_message(response))

    products = get_backend_products(st.session_state)
    if products:
        st.subheader("Produk tersimpan")
        st.dataframe(products, use_container_width=True, hide_index=True)

        product_options = {
            str(product.get("name") or product.get("product_name") or product.get("id")): product
            for product in products
        }
        selected_label = st.selectbox("Pilih Produk Aktif", list(product_options.keys()))
        if st.button("Gunakan Produk Ini"):
            selected = product_options[selected_label]
            set_active_product_from_response(
                st.session_state,
                {
                    "product_id": selected.get("product_id") or selected.get("id"),
                    "name": selected.get("name") or selected.get("product_name"),
                },
            )
            st.success("Produk aktif berhasil dipilih.")
            st.rerun()

    st.subheader("Tambah Produk")
    with st.form("product_form"):
        name = st.text_input("Nama Produk", placeholder="Contoh: Kopi Susu Gula Aren")
        selling_price = st.number_input("Harga Jual", min_value=0.0, value=0.0, step=1000.0)
        cost_price = st.number_input("Harga Modal", min_value=0.0, value=0.0, step=1000.0)
        initial_stock = st.number_input("Stok Awal", min_value=0, value=0, step=1)
        unit = st.text_input("Satuan", value="pcs")
        category = st.text_input("Kategori", value="Umum")
        submitted = st.form_submit_button("Simpan Produk", type="primary")

    if submitted:
        if not name.strip():
            st.warning("Nama produk wajib diisi.")
            return

        payload = {
            "business_id": business_id,
            "name": name,
            "selling_price": float(selling_price),
            "cost_price": float(cost_price),
            "initial_stock": int(initial_stock),
            "unit": unit,
            "category": category,
        }
        with st.spinner("Menyimpan produk..."):
            response = client.create_product(payload)

        if response.get("success"):
            data = response.get("data")
            if isinstance(data, dict):
                set_active_product_from_response(st.session_state, data)
                st.success("Produk berhasil disimpan.")
                st.rerun()
            else:
                st.error("Response produk tidak sesuai.")
        else:
            st.error(error_message(response))

    if str(st.session_state.get("active_product_id", "")).strip():
        if st.button("Lanjut ke Transaksi Pertama", type="primary"):
            switch_page(st, "pages/First_Transaction.py")


def _get_streamlit() -> Any:
    """Import Streamlit."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_page()
