"""
Dashboard
=========
"""

from __future__ import annotations

from decimal import Decimal, InvalidOperation
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
)


PAGE_NAME = "dashboard"
CURRENCY_PREFIX = "Rp"


def render_page() -> None:
    """Render dashboard."""

    st = _get_streamlit()
    st.set_page_config(page_title="Dashboard", page_icon="📊", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)

    client = get_api_client_from_session_state(st.session_state)
    business_id = str(st.session_state.get("business_id", ""))
    product_id = str(st.session_state.get("active_product_id", ""))
    preferences = build_business_preferences(st.session_state)
    limit = int(st.session_state.get("dashboard_limit", DEFAULT_LIMIT))

    dashboard_response = None
    if is_valid_uuid(business_id):
        with st.spinner("Memuat dashboard..."):
            dashboard_response = client.get_dashboard(business_id=business_id, limit=limit)

    state = build_onboarding_state(
        business_id=business_id,
        product_id=product_id,
        dashboard_response=dashboard_response,
    )
    render_navigation(st, state)

    render_hero(
        st,
        eyebrow="Dashboard",
        title="Ringkasan Bisnis",
        description="Pantau penjualan, produk, persediaan, pelanggan, dan peluang bisnis.",
    )

    if state.business_profile_ready:
        render_business_header(st, preferences)

    if not state.dashboard_ready:
        render_locked_page(
            st,
            message="Dashboard akan tersedia setelah profil bisnis, produk, dan transaksi pertama siap.",
            state=state,
            next_action_label="Lanjutkan Penyiapan",
            next_page="app.py",
        )
        return

    if not dashboard_response or not dashboard_response.get("success"):
        st.error(error_message(dashboard_response or {}))
        return

    data = _ensure_mapping(dashboard_response.get("data"))
    _render_kpi_cards(st, _extract_list(data, "kpi_cards"))
    _render_alerts(st, _extract_list(data, "alerts"))

    tabs = st.tabs(
        ["Penjualan", "Persediaan", "Produk", "Pelanggan", "Produk Teratas"]
    )

    with tabs[0]:
        _render_summary(st, "Ringkasan Penjualan", _ensure_mapping(data.get("sales_summary")))
    with tabs[1]:
        _render_summary(st, "Ringkasan Persediaan", _ensure_mapping(data.get("inventory_summary")))
    with tabs[2]:
        _render_summary(st, "Ringkasan Produk", _ensure_mapping(data.get("product_summary")))
    with tabs[3]:
        _render_summary(st, "Ringkasan Pelanggan", _ensure_mapping(data.get("customer_summary")))
    with tabs[4]:
        col_a, col_b = st.columns(2)
        with col_a:
            _render_table(st, "Produk Berdasarkan Pendapatan", _extract_list(data, "top_products_by_revenue"))
        with col_b:
            _render_table(st, "Produk Berdasarkan Jumlah Terjual", _extract_list(data, "top_products_by_quantity"))


def _render_kpi_cards(st: Any, cards: list[dict[str, Any]]) -> None:
    """Render KPI."""

    if not cards:
        st.info("KPI belum tersedia.")
        return

    columns = st.columns(min(len(cards), 4))
    for index, card in enumerate(cards):
        with columns[index % len(columns)]:
            label = str(card.get("label") or card.get("title") or card.get("key") or "Indikator")
            value = _format_value(card.get("value"), label)
            delta = card.get("delta") or card.get("change") or card.get("trend")
            st.metric(label=label, value=value, delta=str(delta) if delta else None)


def _render_alerts(st: Any, alerts: list[dict[str, Any]]) -> None:
    """Render alerts."""

    if not alerts:
        return

    st.subheader("Perlu Perhatian")
    for alert in alerts:
        message = str(alert.get("message") or alert.get("title") or alert)
        severity = str(alert.get("severity") or alert.get("level") or "info").lower()
        if severity in {"danger", "error", "critical", "high"}:
            st.error(message)
        elif severity in {"warning", "warn", "medium"}:
            st.warning(message)
        else:
            st.info(message)


def _render_summary(st: Any, title: str, data: dict[str, Any]) -> None:
    """Render summary."""

    st.subheader(title)
    if not data:
        st.info("Data belum tersedia.")
        return

    scalar_items = [(key, value) for key, value in data.items() if _is_scalar(value)]
    if scalar_items:
        columns = st.columns(min(len(scalar_items), 4))
        for index, (key, value) in enumerate(scalar_items):
            with columns[index % len(columns)]:
                st.metric(_humanize(key), _format_value(value, key))

    nested_rows = []
    for key, value in data.items():
        if isinstance(value, Mapping):
            row = {"Bagian": _humanize(str(key))}
            row.update(dict(value))
            nested_rows.append(row)
        elif isinstance(value, list):
            for item in value:
                if isinstance(item, Mapping):
                    row = {"Bagian": _humanize(str(key))}
                    row.update(dict(item))
                    nested_rows.append(row)

    if nested_rows:
        st.dataframe(nested_rows, use_container_width=True, hide_index=True)


def _render_table(st: Any, title: str, rows: list[dict[str, Any]]) -> None:
    """Render table."""

    st.subheader(title)
    if not rows:
        st.info("Data belum tersedia.")
        return

    st.dataframe(rows, use_container_width=True, hide_index=True)


def _extract_list(data: Mapping[str, Any], key: str) -> list[dict[str, Any]]:
    """Extract list."""

    value = data.get(key)
    if not isinstance(value, list):
        return []
    return [dict(item) if isinstance(item, Mapping) else {"Nilai": item} for item in value]


def _ensure_mapping(value: Any) -> dict[str, Any]:
    """Ensure mapping."""

    return dict(value) if isinstance(value, Mapping) else {}


def _is_scalar(value: Any) -> bool:
    """Check scalar."""

    return value is None or isinstance(value, (str, int, float, bool, Decimal))


def _format_value(value: Any, key: str) -> str:
    """Format value."""

    if value is None:
        return "-"

    number = _to_decimal(value)
    if number is not None:
        if number == number.to_integral():
            formatted = f"{int(number):,}".replace(",", ".")
        else:
            formatted = f"{float(number):,.2f}".replace(",", "_").replace(".", ",").replace("_", ".")
        if any(word in key.lower() for word in ["revenue", "sales", "price", "cost", "amount", "value"]):
            return f"{CURRENCY_PREFIX}{formatted}"
        return formatted

    return str(value)


def _to_decimal(value: Any) -> Decimal | None:
    """Convert decimal."""

    if isinstance(value, bool):
        return None
    try:
        return Decimal(str(value))
    except (InvalidOperation, ValueError, TypeError):
        return None


def _humanize(key: str) -> str:
    """Humanize key."""

    return key.replace("_", " ").replace("-", " ").title()


def _get_streamlit() -> Any:
    """Import Streamlit."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_page()
