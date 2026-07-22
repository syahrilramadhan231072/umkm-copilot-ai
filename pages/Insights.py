"""
Insights
========
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

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
    find_items,
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
)

PAGE_NAME = "insights"


def render_page() -> None:
    """Render insights workspace."""

    st = _get_streamlit()
    st.set_page_config(page_title="Go-UMKM AI · Insights", page_icon="💡", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)

    client = get_api_client_from_session_state(st.session_state)
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
        eyebrow="Insights",
        title="Business Insights & Recommendations",
        description=(
            "Ubah data operasional menjadi rekomendasi, forecast, dan sinyal kesehatan bisnis."
        ),
        icon="💡",
    )

    if state.business_profile_ready:
        render_business_header(st, preferences)

    if not state.insights_ready:
        render_locked_page(
            st,
            message="Insights aktif setelah profil, produk, dan data transaksi tersedia.",
            state=state,
            next_action_label="Buka Dashboard",
            next_page="pages/Dashboard.py",
        )
        return

    context_response = client.get_insight_context(
        {
            "business_id": business_id,
            "product_id": product_id,
            "session_id": session_id,
            "business_profile": preferences,
        }
    )
    review_response = client.get_insight_review(business_id=business_id, limit=100)

    _render_insight_metrics(st, context_response, review_response)
    _render_forecast_cards(st, context_response)
    _render_recommendation_cards(st, review_response)
    _render_create_insight(st, client, business_id, product_id, session_id)


def _render_insight_metrics(
    st: Any,
    context_response: Mapping[str, Any],
    review_response: Mapping[str, Any],
) -> None:
    """Render insight metrics."""

    context = response_data(context_response)
    review = response_data(review_response)
    recommendations = find_items(review, ("insights", "recommendations", "records", "items"))
    forecasts = find_items(context, ("forecasts", "forecast", "trends"))

    cols = st.columns(4)
    with cols[0]:
        render_metric_card(
            st,
            label="Insights",
            value=format_number(len(recommendations)),
            caption="saved recommendations",
            icon="💡",
        )
    with cols[1]:
        render_metric_card(
            st,
            label="Forecasts",
            value=format_number(len(forecasts)),
            caption="trend signals",
            icon="📈",
            tone="indigo",
        )
    with cols[2]:
        render_metric_card(
            st,
            label="Risk",
            value="Low",
            caption="current quick signal",
            icon="🛡️",
            tone="success",
        )
    with cols[3]:
        render_metric_card(
            st,
            label="Priority",
            value="Action",
            caption="review next steps",
            icon="⚡",
            tone="warning",
        )


def _render_forecast_cards(st: Any, response: Mapping[str, Any]) -> None:
    """Render forecast/insight context cards."""

    render_section_header(
        st,
        eyebrow="Forecast",
        title="Smart Forecasts",
        description="Sinyal perkiraan bisnis dari konteks backend yang tersedia.",
    )

    if not response.get("success"):
        render_empty_state(
            st,
            title="Forecast belum tersedia",
            description=error_message(response),
            icon="📈",
        )
        return

    data = response_data(response)
    forecasts = find_items(data, ("forecasts", "forecast", "trends", "signals"))
    if not forecasts:
        forecasts = [
            {
                "title": "Demand Signal",
                "description": (
                    "Pantau produk dengan penjualan meningkat untuk menentukan stok dan promosi."
                ),
            },
            {
                "title": "Inventory Signal",
                "description": "Periksa item low stock sebelum membuat campaign besar.",
            },
            {
                "title": "Revenue Signal",
                "description": "Gunakan tren revenue harian untuk memilih waktu promosi terbaik.",
            },
        ]

    cols = st.columns(3)
    for index, forecast in enumerate(forecasts[:6]):
        with cols[index % 3]:
            render_action_card(
                st,
                title=safe_text(
                    forecast.get("title") or forecast.get("name") or f"Forecast {index + 1}"
                ),
                description=safe_text(
                    forecast.get("description")
                    or forecast.get("message")
                    or forecast.get("summary"),
                    "Trend signal available.",
                ),
                icon="📈",
                badge="Forecast",
            )


def _render_recommendation_cards(st: Any, response: Mapping[str, Any]) -> None:
    """Render recommendation cards."""

    render_section_header(
        st,
        eyebrow="Recommendations",
        title="Actionable Business Recommendations",
        description="Prioritaskan keputusan berdasarkan insight yang tersimpan.",
    )

    if not response.get("success"):
        render_empty_state(
            st,
            title="Rekomendasi belum tersedia",
            description=error_message(response),
            icon="💡",
        )
        return

    records = find_items(
        response_data(response), ("insights", "recommendations", "records", "items")
    )
    if not records:
        render_empty_state(
            st,
            title="Belum ada rekomendasi tersimpan",
            description="Gunakan tombol Generate Insight untuk menyimpan rekomendasi baru.",
            icon="💡",
        )
        return

    cols = st.columns(3)
    for index, record in enumerate(records[:9]):
        with cols[index % 3]:
            render_action_card(
                st,
                title=safe_text(
                    record.get("title") or record.get("insight_title") or f"Insight {index + 1}"
                ),
                description=safe_text(
                    record.get("description")
                    or record.get("recommendation")
                    or record.get("summary"),
                    "-",
                ),
                icon="💡",
                badge=safe_text(
                    record.get("category") or record.get("insight_category"), "Insight"
                ),
            )


def _render_create_insight(
    st: Any, client: Any, business_id: str, product_id: str, session_id: str
) -> None:
    """Render create insight action."""

    render_section_header(
        st,
        eyebrow="Generate",
        title="Create New Insight",
        description="Simpan rekomendasi baru dari konteks bisnis saat ini.",
    )

    with st.form("go_insight_form"):
        category = st.selectbox("Category", ["sales", "inventory", "marketing", "growth", "risk"])
        title = st.text_input("Insight title", value="Rekomendasi Bisnis Harian")
        recommendation = st.text_area(
            "Recommendation",
            value="Tinjau produk terlaris dan stok rendah sebelum menjalankan promosi.",
        )
        submitted = st.form_submit_button("Save Insight", type="primary", use_container_width=True)

    if submitted:
        response = client.create_insight(
            {
                "business_id": business_id,
                "product_id": product_id,
                "session_id": session_id,
                "insight_data": {
                    "insight_category": category,
                    "title": title,
                    "recommendation": recommendation,
                },
            }
        )
        if response.get("success"):
            st.success("Insight berhasil disimpan.")
        else:
            st.error(error_message(response))


def _get_streamlit() -> Any:
    """Import Streamlit."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_page()
