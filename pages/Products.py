"""
Produk
======

Halaman untuk melihat, memilih, dan menambahkan produk pada business aktif.
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
    get_business_profiles,
    hydrate_business_from_backend,
    refresh_business_profiles_from_backend,
    return_to_welcome,
    set_active_product_from_response,
    set_backend_products,
    set_business_from_response,
    set_onboarding_step,
    start_create_new_business_flow,
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
    set_onboarding_step(st.session_state, "products")

    client = get_api_client_from_session_state(st.session_state)

    if not bool(st.session_state.get("create_new_business_mode")):
        with st.spinner("Memuat workspace bisnis..."):
            hydrate_business_from_backend(st.session_state, client)

    business_id = str(st.session_state.get("business_id", "")).strip()
    product_id = str(st.session_state.get("active_product_id", "")).strip()
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
        title="Kelola Produk",
        description=(
            "Tambah produk baru, pilih produk aktif, dan pastikan produk tersimpan "
            "pada business_id yang sedang aktif."
        ),
    )

    _render_step_navigation(st)
    _render_business_workspace_controls(st, client)

    if state.business_profile_ready:
        render_business_header(st, preferences)

    render_progress_indicator(st, state)

    if not state.business_profile_ready:
        render_locked_page(
            st,
            message=(
                "Belum ada business aktif. Pilih business existing atau buat "
                "business baru terlebih dahulu."
            ),
            state=state,
            next_action_label="Kembali ke Profil Bisnis",
            next_page="pages/Business_Profile.py",
        )
        return

    st.divider()
    _render_existing_products(st, client, business_id)
    st.divider()
    _render_create_product_form(st, client, business_id)


def _render_step_navigation(st: Any) -> None:
    """Render navigasi mundur/maju pada step produk."""

    col_welcome, col_back, col_next = st.columns(3)
    with col_welcome:
        if st.button("← Welcome / Dashboard Awal"):
            return_to_welcome(st.session_state)
            switch_page(st, "app.py")
    with col_back:
        if st.button("← Profil Bisnis"):
            switch_page(st, "pages/Business_Profile.py")
    with col_next:
        if st.button("Transaksi →"):
            switch_page(st, "pages/Transactions.py")


def _render_business_workspace_controls(st: Any, client: Any) -> None:
    """Render kontrol business aktif pada halaman produk."""

    with st.expander("Kelola Business Workspace", expanded=False):
        profiles = get_business_profiles(st.session_state)
        if not profiles:
            profiles = refresh_business_profiles_from_backend(st.session_state, client)

        if profiles:
            current_business_id = str(st.session_state.get("business_id", "")).strip()
            options = {_business_option_label(profile): profile for profile in profiles}
            labels = list(options.keys())

            current_index = 0
            for index, profile in enumerate(profiles):
                if str(profile.get("business_id", "")).strip() == current_business_id:
                    current_index = index
                    break

            selected_label = st.selectbox(
                "Business aktif",
                labels,
                index=current_index if current_index < len(labels) else 0,
            )
            selected_profile = options[selected_label]
            selected_business_id = str(selected_profile.get("business_id", "")).strip()

            if selected_business_id != current_business_id:
                set_business_from_response(st.session_state, selected_profile)
                st.success("Business aktif berhasil diganti.")
                st.rerun()

        col_a, col_b = st.columns(2)
        with col_a:
            if st.button("Refresh Daftar Business"):
                refresh_business_profiles_from_backend(st.session_state, client)
                st.rerun()
        with col_b:
            if st.button("Buat Business Baru"):
                start_create_new_business_flow(st.session_state)
                switch_page(st, "pages/Business_Profile.py")


def _render_existing_products(st: Any, client: Any, business_id: str) -> None:
    """Render daftar produk existing dan pilihan produk aktif."""

    st.subheader("Produk Tersimpan")

    col_a, col_b = st.columns(2)
    with col_a:
        if st.button("Muat Ulang Produk"):
            _refresh_products(st, client, business_id)
            st.rerun()
    with col_b:
        if st.button("Lanjut ke Transaksi"):
            switch_page(st, "pages/Transactions.py")

    products = get_backend_products(st.session_state)
    if not products:
        products = _refresh_products(st, client, business_id)

    if not products:
        st.info("Belum ada produk pada business aktif. Tambahkan produk baru di form bawah.")
        return

    table_rows = [_product_table_row(product) for product in products]
    st.dataframe(table_rows, use_container_width=True, hide_index=True)

    product_options = {
        _product_label(product): product for product in products if _get_product_id(product)
    }
    if not product_options:
        st.warning("Produk ditemukan, tetapi tidak ada product_id yang valid.")
        return

    selected_label = st.selectbox("Pilih Produk Aktif", list(product_options.keys()))
    selected_product = product_options[selected_label]

    if st.button("Gunakan Produk Ini", type="primary"):
        set_active_product_from_response(st.session_state, selected_product)
        st.success("Produk aktif berhasil dipilih.")
        st.rerun()


def _render_create_product_form(st: Any, client: Any, business_id: str) -> None:
    """Render form tambah produk baru."""

    st.subheader("Tambah Produk Baru")

    with st.form("create_product_form", clear_on_submit=False):
        name = st.text_input("Nama Produk", placeholder="Contoh: Kopi Susu Gula Aren")
        category = st.text_input("Kategori", value="Umum")
        selling_price = st.number_input("Harga Jual", min_value=0, value=0, step=1000)
        cost_price = st.number_input("Harga Modal", min_value=0, value=0, step=1000)
        initial_stock = st.number_input("Stok Awal", min_value=0, value=0, step=1)
        unit = st.text_input("Satuan", value="pcs")
        sku = st.text_input("SKU", placeholder="Opsional")
        barcode = st.text_input("Barcode", placeholder="Opsional")

        submitted = st.form_submit_button("Simpan Produk Baru", type="primary")

    if not submitted:
        return

    clean_name = name.strip()
    if not clean_name:
        st.warning("Nama produk wajib diisi.")
        return

    payload = {
        "business_id": business_id,
        "name": clean_name,
        "selling_price": int(selling_price),
        "cost_price": int(cost_price),
        "initial_stock": int(initial_stock),
        "unit": unit.strip() or "pcs",
        "category": category.strip() or "Umum",
        "sku": sku.strip() or None,
        "barcode": barcode.strip() or None,
    }

    with st.spinner("Menyimpan produk baru ke backend..."):
        response = client.create_product(payload)

    if not response.get("success"):
        st.error(error_message(response))
        attempts = response.get("_path_attempts")
        if attempts:
            with st.expander("Detail endpoint yang dicoba"):
                for attempt in attempts:
                    st.code(str(attempt))
        return

    data = response.get("data")
    if not isinstance(data, Mapping):
        st.error("Response produk tidak sesuai.")
        return

    set_active_product_from_response(st.session_state, data)
    _refresh_products(st, client, business_id)
    st.success("Produk baru berhasil disimpan dan dijadikan produk aktif.")

    col_a, col_b = st.columns(2)
    with col_a:
        if st.button("Tambah Produk Lain"):
            st.rerun()
    with col_b:
        if st.button("Catat Transaksi Produk Ini"):
            switch_page(st, "pages/Transactions.py")


def _refresh_products(st: Any, client: Any, business_id: str) -> list[dict[str, Any]]:
    """Refresh daftar produk dari backend."""

    response = client.list_products(business_id=business_id, limit=100)

    if not response.get("success"):
        st.warning(error_message(response))
        return get_backend_products(st.session_state)

    data = response.get("data", {})
    raw_products: Any
    if isinstance(data, Mapping):
        raw_products = data.get("products") or data.get("items") or data.get("data") or []
    elif isinstance(data, list):
        raw_products = data
    else:
        raw_products = []

    if isinstance(raw_products, Mapping):
        raw_products = [raw_products]

    products = [dict(product) for product in raw_products if isinstance(product, Mapping)]
    set_backend_products(st.session_state, products)
    return products


def _product_table_row(product: Mapping[str, Any]) -> dict[str, Any]:
    """Bentuk row tabel produk."""

    return {
        "Product ID": _get_product_id(product),
        "Nama": _get_product_name(product),
        "Kategori": product.get("category") or "",
        "Harga Jual": product.get("selling_price") or product.get("price") or 0,
        "Harga Modal": product.get("cost_price") or 0,
        "Stok": product.get("stock") or product.get("current_stock") or 0,
        "Satuan": product.get("unit") or "",
        "Aktif": product.get("is_active", True),
    }


def _product_label(product: Mapping[str, Any]) -> str:
    """Label pilihan produk."""

    name = _get_product_name(product)
    price = product.get("selling_price") or product.get("price")
    stock = product.get("stock") or product.get("current_stock")
    product_id = _get_product_id(product)
    short_id = product_id[:8] if product_id else "-"

    label = f"{name} · {short_id}"
    if price is not None:
        label = f"{label} · Rp{price}"
    if stock is not None:
        label = f"{label} · stok {stock}"

    return label


def _business_option_label(profile: Mapping[str, Any]) -> str:
    """Label pilihan business."""

    business_name = str(profile.get("business_name") or "Tanpa Nama").strip()
    business_type = str(profile.get("business_type") or "Jenis belum diisi").strip()
    business_id = str(profile.get("business_id") or "").strip()
    short_id = business_id[:8] if business_id else "-"

    return f"{business_name} · {business_type} · {short_id}"


def _get_product_id(product: Mapping[str, Any]) -> str:
    """Ambil product id."""

    return str(product.get("product_id") or product.get("id") or "").strip()


def _get_product_name(product: Mapping[str, Any]) -> str:
    """Ambil product name."""

    return str(
        product.get("name") or product.get("product_name") or product.get("id") or "Produk"
    ).strip()


def _get_streamlit() -> Any:
    """Import Streamlit."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_page()
