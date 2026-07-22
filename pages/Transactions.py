"""
Transaksi
=========

Production transaction workspace.
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
    set_active_product_from_response,
    set_backend_products,
    set_onboarding_step,
)
from app.frontend.ui_components import (
    error_message,
    find_items,
    format_currency,
    render_action_card,
    render_business_header,
    render_empty_state,
    render_locked_page,
    render_metric_card,
    render_page_header,
    render_section_header,
    response_data,
    safe_text,
)

PAGE_NAME = "transactions"


def render_page() -> None:
    """Render transaction page."""

    st = _get_streamlit()
    st.set_page_config(page_title="Go-UMKM AI · Transactions", page_icon="🧾", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)
    set_onboarding_step(st.session_state, "transactions")

    client = get_api_client_from_session_state(st.session_state)

    if not bool(st.session_state.get("create_new_business_mode")):
        with st.spinner("Memuat workspace bisnis..."):
            hydrate_business_from_backend(st.session_state, client)

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
        eyebrow="Sales",
        title="Transactions Workspace",
        description=(
            "Catat penjualan, pantau riwayat transaksi, dan jaga operasional harian tetap rapi."
        ),
        icon="🧾",
    )

    if state.business_profile_ready:
        render_business_header(st, preferences)

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
    if not products:
        render_locked_page(
            st,
            message="Produk belum tersedia. Tambahkan produk terlebih dahulu.",
            state=state,
            next_action_label="Buka Products",
            next_page="pages/Products.py",
        )
        return

    summary_response = (
        client.get_transaction_summary(business_id=business_id, limit=limit)
        if is_valid_uuid(business_id)
        else {}
    )
    summary_data = response_data(summary_response)
    dashboard_data = response_data(dashboard_response)

    _render_transaction_metrics(st, summary_data or dashboard_data)
    _render_transaction_form(
        st=st,
        client=client,
        business_id=business_id,
        session_id=session_id,
        products=products,
    )
    _render_transaction_history(st, summary_data or dashboard_data)


def _render_transaction_metrics(st: Any, data: Mapping[str, Any]) -> None:
    """Render transaction metrics."""

    records = find_items(data, ("transactions", "recent_transactions", "items", "records"))
    completed = len(
        [
            item
            for item in records
            if safe_text(item.get("status"), "completed").lower() == "completed"
        ]
    )
    total_amount = sum(
        float(item.get("amount") or item.get("total") or item.get("revenue") or 0)
        for item in records
        if isinstance(item, Mapping)
    )
    cols = st.columns(4)
    with cols[0]:
        render_metric_card(
            st,
            label="Completed",
            value=str(completed),
            caption="successful sales",
            icon="✅",
        )
    with cols[1]:
        render_metric_card(
            st,
            label="Revenue",
            value=format_currency(total_amount),
            caption="from loaded history",
            icon="💰",
        )
    with cols[2]:
        render_metric_card(
            st,
            label="Pending",
            value="0",
            caption="requires review",
            icon="⏳",
            tone="warning",
        )
    with cols[3]:
        render_metric_card(
            st,
            label="Status",
            value="Operational",
            caption="transaction module",
            icon="🟢",
            tone="success",
        )


def _render_transaction_form(
    *,
    st: Any,
    client: Any,
    business_id: str,
    session_id: str,
    products: list[dict[str, Any]],
) -> None:
    """Render professional transaction form."""

    render_section_header(
        st,
        eyebrow="New Sale",
        title="Record Transaction",
        description="Pilih produk, jumlah penjualan, dan metode pembayaran.",
    )

    form_col, preview_col = st.columns([0.58, 0.42])
    with form_col:
        with st.form("go_transaction_form"):
            selected_product = _select_product(st, products)
            quantity = st.number_input("Quantity sold", min_value=1, value=1, step=1)
            payment_method = st.selectbox(
                "Payment method",
                ["cash", "qris", "transfer", "credit_card", "other"],
                format_func=_payment_label,
            )
            notes = st.text_area("Notes", value="Transaksi penjualan")
            submitted = st.form_submit_button(
                "Record Transaction", type="primary", use_container_width=True
            )

    with preview_col:
        selling_price = selected_product.get("selling_price")
        price = selected_product.get("price")
        price_text = format_currency(selling_price or price or 0)
        stock_text = safe_text(selected_product.get("stock"), "-")

        render_action_card(
            st,
            title=_get_product_name(selected_product),
            description=f"Price {price_text} · Stock {stock_text}",
            icon="🛍️",
            badge="Selected Product",
        )

    if submitted:
        product_id = _get_product_id(selected_product)
        if not product_id:
            st.error("Produk terpilih belum memiliki product_id backend.")
            return

        set_active_product_from_response(
            st.session_state,
            {"product_id": product_id, "name": _get_product_name(selected_product)},
        )

        response = client.record_transaction(
            {
                "business_id": business_id,
                "product_id": product_id,
                "quantity": int(quantity),
                "payment_method": str(payment_method),
                "status": "completed",
                "notes": notes,
                "session_id": session_id,
            }
        )

        if response.get("success"):
            st.success("Transaksi berhasil dicatat.")
            if st.button("Open Dashboard", type="primary"):
                switch_page(st, "pages/Dashboard.py")
        else:
            st.error(error_message(response))


def _render_transaction_history(st: Any, data: Mapping[str, Any]) -> None:
    """Render transaction table, filters, sorting, and empty states."""

    render_section_header(
        st,
        eyebrow="History",
        title="Transaction Table",
        description="Filter dan urutkan transaksi tanpa mengekspos raw JSON backend.",
    )

    records = find_items(data, ("transactions", "recent_transactions", "items", "records"))
    if not records:
        render_empty_state(
            st,
            title="Belum ada riwayat transaksi",
            description="Riwayat akan tampil setelah transaksi dicatat.",
            icon="🧾",
        )
        return

    filter_col, sort_col = st.columns([0.65, 0.35])
    with filter_col:
        keyword = st.text_input(
            "Filter by product/status",
            value="",
            placeholder="Cari produk, status, metode pembayaran...",
        )
    with sort_col:
        sort_by = st.selectbox("Sort by", ["Newest", "Product", "Amount"])

    filtered = _filter_records(records, keyword)
    sorted_records = _sort_records(filtered, sort_by)

    st.dataframe(_display_records(sorted_records), use_container_width=True, hide_index=True)


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
    """Render product selectbox."""

    options = {_product_label(product): product for product in products if _get_product_id(product)}
    if not options:
        return {}

    selected_label = st.selectbox("Product", list(options.keys()))
    return options[selected_label]


def _product_label(product: Mapping[str, Any]) -> str:
    """Build product label."""

    parts = [_get_product_name(product)]
    price = product.get("selling_price") or product.get("price")
    stock = product.get("stock")
    if price is not None:
        parts.append(format_currency(price))
    if stock is not None:
        parts.append(f"stock {stock}")
    return " · ".join(parts)


def _get_product_id(product: Mapping[str, Any]) -> str:
    """Get product id."""

    return str(product.get("product_id") or product.get("id") or "").strip()


def _get_product_name(product: Mapping[str, Any]) -> str:
    """Get product name."""

    return safe_text(
        product.get("name") or product.get("product_name") or product.get("id"),
        "Product",
    )


def _payment_label(value: str) -> str:
    """Render payment method label."""

    labels = {
        "cash": "Tunai",
        "qris": "QRIS",
        "transfer": "Transfer",
        "credit_card": "Kartu Kredit",
        "other": "Lainnya",
    }
    return labels.get(value, value)


def _filter_records(records: list[dict[str, Any]], keyword: str) -> list[dict[str, Any]]:
    """Filter records."""

    if not keyword.strip():
        return records

    lowered = keyword.lower()
    return [
        record
        for record in records
        if lowered in " ".join(str(value).lower() for value in record.values())
    ]


def _sort_records(records: list[dict[str, Any]], sort_by: str) -> list[dict[str, Any]]:
    """Sort records."""

    if sort_by == "Product":
        return sorted(
            records,
            key=lambda item: safe_text(
                item.get("product_name") or item.get("product") or item.get("name")
            ),
        )

    if sort_by == "Amount":
        return sorted(
            records,
            key=lambda item: float(item.get("amount") or item.get("total") or 0),
            reverse=True,
        )

    return list(records)


def _display_records(records: list[dict[str, Any]]) -> list[dict[str, Any]]:
    """Format records for table."""

    rows: list[dict[str, Any]] = []
    for record in records[:100]:
        rows.append(
            {
                "Date": safe_text(
                    record.get("date")
                    or record.get("transaction_date")
                    or record.get("created_at"),
                    "-",
                ),
                "Product": safe_text(
                    record.get("product_name") or record.get("product") or record.get("name"),
                    "-",
                ),
                "Qty": safe_text(record.get("quantity") or record.get("qty"), "-"),
                "Amount": format_currency(
                    record.get("amount") or record.get("total") or record.get("revenue") or 0
                ),
                "Payment": safe_text(record.get("payment_method"), "-").title(),
                "Status": safe_text(record.get("status"), "completed").title(),
            }
        )
    return rows


def _get_streamlit() -> Any:
    """Import Streamlit."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_page()
