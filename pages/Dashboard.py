"""
Dashboard
=========
"""

from __future__ import annotations

from collections.abc import Mapping
from decimal import Decimal
from typing import Any

from app.frontend.assets import load_frontend_assets
from app.frontend.navigation import render_navigation, switch_page
from app.frontend.onboarding import build_onboarding_state, is_valid_uuid
from app.frontend.session import (
    DEFAULT_LIMIT,
    build_business_preferences,
    ensure_frontend_session,
    get_api_client_from_session_state,
    get_business_profiles,
    hydrate_business_from_backend,
    refresh_business_profiles_from_backend,
    set_business_from_response,
    start_create_new_business_flow,
)
from app.frontend.ui_components import (
    error_message,
    find_items,
    find_numeric,
    format_currency,
    format_number,
    render_action_card,
    render_business_header,
    render_empty_state,
    render_locked_page,
    render_metric_card,
    render_page_header,
    render_section_header,
    response_data,
    safe_text,
    to_decimal,
)

PAGE_NAME = "dashboard"


def render_page() -> None:
    """Render production SaaS dashboard."""

    st = _get_streamlit()
    st.set_page_config(page_title="Go-UMKM AI · Dashboard", page_icon="📊", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)

    client = get_api_client_from_session_state(st.session_state)
    with st.spinner("Memuat workspace bisnis..."):
        hydrate_business_from_backend(st.session_state, client)

    business_id = str(st.session_state.get("business_id", ""))
    product_id = str(st.session_state.get("active_product_id", ""))
    preferences = build_business_preferences(st.session_state)
    limit = int(st.session_state.get("dashboard_limit", DEFAULT_LIMIT))

    dashboard_response: dict[str, Any] | None = None
    if is_valid_uuid(business_id):
        dashboard_response = client.get_dashboard(business_id=business_id, limit=limit)

    state = build_onboarding_state(
        business_id=business_id,
        product_id=product_id,
        dashboard_response=dashboard_response,
    )
    render_navigation(st, state)

    render_page_header(
        st,
        eyebrow="Dashboard",
        title="Ringkasan Bisnis Hari Ini",
        description=(
            "Pantau revenue, profit, transaksi, kesehatan bisnis, dan peluang "
            "pertumbuhan dalam satu workspace."
        ),
        icon="📊",
    )

    if state.business_profile_ready:
        _render_business_workspace_controls(st, client)
        render_business_header(st, preferences)

    if not state.dashboard_ready:
        render_locked_page(
            st,
            message="Dashboard akan aktif setelah profil, produk, dan transaksi pertama tersedia.",
            state=state,
            next_action_label="Lanjutkan Setup",
            next_page=_next_setup_page(state),
        )
        return

    if not dashboard_response or not dashboard_response.get("success"):
        st.error(error_message(dashboard_response or {}))
        return

    data = response_data(dashboard_response)

    _render_kpis(st, data)
    _render_charts(st, data)
    _render_dashboard_sections(st, data)


def _render_business_workspace_controls(st: Any, client: Any) -> None:
    """Render business workspace switcher and quick workspace actions."""

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
                key="dashboard_business_switcher",
            )
            selected_profile = options[selected_label]
            selected_business_id = str(selected_profile.get("business_id", "")).strip()

            if selected_business_id != current_business_id:
                set_business_from_response(st.session_state, selected_profile)
                st.session_state["chat_messages"] = []
                st.success("Business aktif berhasil diganti.")
                st.rerun()
        else:
            st.info("Belum ada business profile yang tersimpan di backend.")

        col_a, col_b, col_c = st.columns(3)
        with col_a:
            if st.button("Refresh Daftar Business", use_container_width=True):
                refresh_business_profiles_from_backend(st.session_state, client)
                st.rerun()
        with col_b:
            if st.button("Tambah Produk Baru", use_container_width=True):
                switch_page(st, "pages/Products.py")
        with col_c:
            if st.button(
                "Buat Business Baru",
                type="primary",
                use_container_width=True,
            ):
                start_create_new_business_flow(st.session_state)
                switch_page(st, "pages/Business_Profile.py")


def _business_option_label(profile: Mapping[str, Any]) -> str:
    """Build business option label for dashboard workspace switcher."""

    business_name = str(
        profile.get("business_name")
        or profile.get("name")
        or profile.get("nama_usaha")
        or "Tanpa Nama"
    ).strip()
    business_type = str(
        profile.get("business_type")
        or profile.get("category")
        or profile.get("jenis_usaha")
        or "Jenis usaha belum diisi"
    ).strip()
    business_id = str(profile.get("business_id") or profile.get("id") or "").strip()

    if business_id:
        return f"{business_name} · {business_type} · {business_id[:8]}"

    return f"{business_name} · {business_type}"


def _render_kpis(st: Any, data: Mapping[str, Any]) -> None:
    """Render KPI cards."""

    revenue = _revenue(data)
    expenses = _expenses(data)
    profit = _profit(data, revenue, expenses)
    cash_flow = _cash_flow(data, profit, revenue)
    transactions = find_numeric(
        data,
        ("total_transactions", "transaction_count", "completed_transactions"),
    )

    cols = st.columns(4)
    with cols[0]:
        render_metric_card(
            st,
            label="Revenue",
            value=format_currency(revenue),
            caption=f"{format_number(transactions)} completed transactions",
            icon="💰",
            tone="primary",
        )
    with cols[1]:
        render_metric_card(
            st,
            label="Expenses",
            value=format_currency(expenses),
            caption="Estimated operating cost",
            icon="📉",
            tone="warning",
        )
    with cols[2]:
        render_metric_card(
            st,
            label="Profit",
            value=format_currency(profit),
            caption="Revenue minus expenses",
            icon="📈",
            tone="success",
        )
    with cols[3]:
        render_metric_card(
            st,
            label="Cash Flow",
            value=format_currency(cash_flow),
            caption="Available business signal",
            icon="💳",
            tone="indigo",
        )


def _render_charts(st: Any, data: Mapping[str, Any]) -> None:
    """Render dashboard charts."""

    render_section_header(
        st,
        eyebrow="Analytics",
        title="Sales, Revenue, and Product Performance",
        description=(
            "Visual indicators are generated from available dashboard data "
            "without changing backend calls."
        ),
    )

    chart_a, chart_b = st.columns([0.56, 0.44])

    with chart_a:
        st.markdown('<div class="go-chart-card">', unsafe_allow_html=True)
        st.subheader("Sales Trend")
        sales_trend = find_items(
            data,
            ("sales_trend", "daily_sales", "revenue_trend", "transactions", "recent_transactions"),
        )
        chart_rows = _trend_rows(sales_trend)
        if chart_rows:
            st.line_chart(chart_rows, x="date", y=["revenue", "transactions"])
        else:
            render_empty_state(
                st,
                title="Belum ada tren penjualan",
                description="Grafik akan muncul setelah data transaksi tersedia.",
                icon="📈",
            )
        st.markdown("</div>", unsafe_allow_html=True)

    with chart_b:
        st.markdown('<div class="go-chart-card">', unsafe_allow_html=True)
        st.subheader("Product Performance")
        products = find_items(
            data,
            ("top_products_by_revenue", "top_products_by_quantity", "top_products", "products"),
        )
        performance_rows = _product_performance_rows(products)
        if performance_rows:
            st.bar_chart(performance_rows, x="product", y="value")
        else:
            render_empty_state(
                st,
                title="Belum ada performa produk",
                description="Produk teratas akan tampil setelah transaksi tercatat.",
                icon="📦",
            )
        st.markdown("</div>", unsafe_allow_html=True)


def _render_dashboard_sections(st: Any, data: Mapping[str, Any]) -> None:
    """Render lower dashboard sections."""

    left, right = st.columns([0.62, 0.38])

    with left:
        render_section_header(
            st,
            eyebrow="Operations",
            title="Recent Transactions",
            description="Ringkasan transaksi terbaru untuk pemantauan harian.",
        )
        transactions = find_items(
            data,
            ("recent_transactions", "transactions", "latest_transactions"),
        )
        if transactions:
            st.dataframe(
                _display_rows(transactions[:10]),
                use_container_width=True,
                hide_index=True,
            )
        else:
            render_empty_state(
                st,
                title="Belum ada transaksi terbaru",
                description="Catat penjualan untuk mulai membangun riwayat transaksi.",
                icon="🧾",
            )

    with right:
        render_section_header(
            st,
            eyebrow="AI Workspace",
            title="Business Health",
            description="Sinyal cepat untuk keputusan bisnis berikutnya.",
        )
        health_items = _business_health_items(data)
        for item in health_items:
            render_action_card(
                st,
                title=item["title"],
                description=item["description"],
                icon=item["icon"],
                badge=item["badge"],
            )

    render_section_header(
        st,
        eyebrow="Quick Actions",
        title="Move faster with Go-UMKM AI",
        description="Akses cepat ke aktivitas operasional utama.",
    )
    col_a, col_b, col_c, col_d = st.columns(4)
    with col_a:
        render_action_card(
            st,
            title="Record Sale",
            description="Catat transaksi penjualan baru.",
            icon="🧾",
        )
        if st.button("Open Transactions", use_container_width=True):
            switch_page(st, "pages/Transactions.py")
    with col_b:
        render_action_card(
            st,
            title="Ask AI",
            description="Tanyakan kondisi bisnis dan rekomendasi.",
            icon="🤖",
        )
        if st.button("Open AI Assistant", use_container_width=True):
            switch_page(st, "pages/AI_Assistant.py")
    with col_c:
        render_action_card(
            st,
            title="Marketing",
            description="Bangun campaign dan caption promosi.",
            icon="📣",
        )
        if st.button("Open Marketing", use_container_width=True):
            switch_page(st, "pages/Marketing.py")
    with col_d:
        render_action_card(
            st,
            title="Export Reports",
            description="Unduh laporan bisnis untuk analisis.",
            icon="⬇️",
        )
        if st.button("Open Export", use_container_width=True):
            switch_page(st, "pages/Export.py")


def _revenue(data: Mapping[str, Any]) -> Decimal:
    """Get revenue value."""

    return find_numeric(
        data,
        (
            "total_revenue",
            "revenue",
            "total_sales",
            "sales_revenue",
            "gross_revenue",
            "income",
        ),
    )


def _expenses(data: Mapping[str, Any]) -> Decimal:
    """Get expenses value."""

    return find_numeric(
        data,
        (
            "total_expenses",
            "expenses",
            "cost",
            "total_cost",
            "cogs",
            "operating_expenses",
        ),
    )


def _profit(data: Mapping[str, Any], revenue: Decimal, expenses: Decimal) -> Decimal:
    """Get profit value."""

    explicit = find_numeric(data, ("profit", "net_profit", "gross_profit"), default=Decimal("-1"))
    if explicit >= 0:
        return explicit

    return revenue - expenses


def _cash_flow(data: Mapping[str, Any], profit: Decimal, revenue: Decimal) -> Decimal:
    """Get cash flow value."""

    explicit = find_numeric(
        data,
        ("cash_flow", "net_cash_flow", "available_cash"),
        default=Decimal("-1"),
    )
    if explicit >= 0:
        return explicit

    if profit != 0:
        return profit

    return revenue


def _trend_rows(records: list[dict[str, Any]]) -> list[dict[str, Any]]:
    """Normalize trend rows."""

    rows: list[dict[str, Any]] = []
    for index, record in enumerate(records[:30], start=1):
        date = safe_text(
            record.get("date")
            or record.get("transaction_date")
            or record.get("day")
            or f"Data {index}"
        )
        rows.append(
            {
                "date": date,
                "revenue": float(
                    to_decimal(
                        record.get("revenue")
                        or record.get("total_revenue")
                        or record.get("amount")
                        or record.get("total")
                        or 0
                    )
                    or Decimal("0")
                ),
                "transactions": float(
                    to_decimal(
                        record.get("transactions")
                        or record.get("transaction_count")
                        or record.get("quantity")
                        or 0
                    )
                    or Decimal("0")
                ),
            }
        )
    return rows


def _product_performance_rows(products: list[dict[str, Any]]) -> list[dict[str, Any]]:
    """Normalize product performance rows."""

    rows: list[dict[str, Any]] = []
    for index, product in enumerate(products[:10], start=1):
        name = safe_text(
            product.get("name")
            or product.get("product_name")
            or product.get("product")
            or f"Product {index}"
        )
        value = to_decimal(
            product.get("revenue")
            or product.get("total_revenue")
            or product.get("quantity")
            or product.get("total_quantity")
            or product.get("value")
            or 0
        )
        rows.append({"product": name, "value": float(value or Decimal("0"))})
    return rows


def _business_health_items(data: Mapping[str, Any]) -> list[dict[str, str]]:
    """Build health cards."""

    low_stock = find_numeric(data, ("low_stock_count", "low_stock_items", "low_stock"))
    active_products = find_numeric(
        data,
        ("active_products", "active_product_count", "total_products"),
    )
    customers = find_numeric(data, ("unique_customers", "estimated_unique_customers", "customers"))

    return [
        {
            "title": "AI Insights",
            "description": (
                "Gunakan Asisten AI untuk membaca pola transaksi dan rekomendasi tindakan."
            ),
            "icon": "🤖",
            "badge": "Smart",
        },
        {
            "title": "Inventory Signal",
            "description": (
                f"{format_number(low_stock)} item berpotensi low stock dari "
                f"{format_number(active_products)} produk aktif."
            ),
            "icon": "📦",
            "badge": "Stock",
        },
        {
            "title": "Customer Signal",
            "description": (
                f"Estimasi {format_number(customers)} pelanggan unik terdeteksi "
                "dari data transaksi."
            ),
            "icon": "👥",
            "badge": "Growth",
        },
    ]


def _display_rows(records: list[dict[str, Any]]) -> list[dict[str, Any]]:
    """Build display rows."""

    display_rows: list[dict[str, Any]] = []
    for record in records:
        display_rows.append(
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
                "Quantity": safe_text(record.get("quantity") or record.get("qty"), "-"),
                "Amount": format_currency(
                    record.get("amount") or record.get("total") or record.get("revenue") or 0
                ),
                "Status": safe_text(record.get("status"), "completed").title(),
            }
        )
    return display_rows


def _next_setup_page(state: Any) -> str:
    """Return next setup page."""

    if state.next_step == "products":
        return "pages/Products.py"

    if state.next_step == "first_transaction":
        return "pages/First_Transaction.py"

    return "pages/Business_Profile.py"


def _get_streamlit() -> Any:
    """Import Streamlit."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_page()
