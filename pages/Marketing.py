"""
Pemasaran
=========
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
    get_backend_products,
    set_active_product_from_response,
    set_backend_products,
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

PAGE_NAME = "marketing"


def render_page() -> None:
    """Render marketing workspace."""

    st = _get_streamlit()
    st.set_page_config(page_title="Go-UMKM AI · Marketing", page_icon="📣", layout="wide")
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
        eyebrow="Marketing",
        title="Campaign Workspace",
        description=(
            "Bangun konteks promosi, simpan campaign, dan pantau riwayat "
            "pemasaran dengan tampilan SaaS yang rapi."
        ),
        icon="📣",
    )

    if state.business_profile_ready:
        render_business_header(st, preferences)

    flash_message = st.session_state.pop("go_marketing_flash", "")
    if flash_message:
        st.success(str(flash_message))

    if not state.marketing_ready:
        render_locked_page(
            st,
            message="Marketing aktif setelah profil dan produk tersedia.",
            state=state,
            next_action_label="Buka Products",
            next_page="pages/Products.py",
        )
        return

    products = _load_products(st, client, business_id)
    selected_product = _render_product_selector(
        st,
        products,
        current_product_id=product_id,
        key="go_marketing_product_context",
    )
    if selected_product is None:
        render_empty_state(
            st,
            title="Produk belum tersedia",
            description=(
                "Tambahkan produk terlebih dahulu agar campaign dapat "
                "dikaitkan dengan produk yang jelas."
            ),
            icon="📦",
        )
        return

    product_id = _product_id(selected_product)
    context_response = client.get_marketing_context(
        {
            "product_id": product_id,
            "business_id": business_id,
            "session_id": session_id,
            "business_profile": preferences,
        }
    )
    history_response = client.get_marketing_history(
        business_id=business_id, keyword=None, limit=100
    )

    _render_marketing_metrics(st, context_response, history_response)
    _render_campaign_workspace(st, client, business_id, product_id, session_id)
    _render_recommendations(st, context_response)
    _render_history(st, history_response)


def _render_marketing_metrics(
    st: Any,
    context_response: Mapping[str, Any],
    history_response: Mapping[str, Any],
) -> None:
    """Render marketing metrics."""

    history = find_items(
        response_data(history_response),
        ("history", "records", "items", "marketing_history"),
    )
    context = response_data(context_response)
    recommendations = find_items(context, ("recommendations", "campaign_ideas", "suggestions"))

    cols = st.columns(4)
    with cols[0]:
        render_metric_card(
            st,
            label="Campaigns",
            value=format_number(len(history)),
            caption="saved records",
            icon="📣",
        )
    with cols[1]:
        render_metric_card(
            st,
            label="Ideas",
            value=format_number(len(recommendations)),
            caption="recommendations",
            icon="💡",
            tone="warning",
        )
    with cols[2]:
        render_metric_card(
            st,
            label="Channels",
            value="4",
            caption="Instagram, WA, TikTok, Email",
            icon="🌐",
            tone="indigo",
        )
    with cols[3]:
        render_metric_card(
            st,
            label="Status",
            value="Ready",
            caption="marketing workspace",
            icon="🟢",
            tone="success",
        )


def _render_campaign_workspace(
    st: Any,
    client: Any,
    business_id: str,
    product_id: str,
    session_id: str,
) -> None:
    """Render save campaign form."""

    render_section_header(
        st,
        eyebrow="Campaign Builder",
        title="Create Marketing Record",
        description="Simpan ide campaign agar dapat ditinjau kembali.",
    )

    form_col, guide_col = st.columns([0.6, 0.4])
    with form_col:
        with st.form("go_marketing_form"):
            platform = st.selectbox(
                "Platform", ["Instagram", "WhatsApp", "TikTok", "Facebook", "Email"]
            )
            campaign = st.text_input("Campaign name", value="Promo Mingguan")
            caption = st.text_area(
                "Caption / message",
                value="Tulis caption promosi yang jelas, singkat, dan menarik untuk pelanggan.",
                height=140,
            )
            submitted = st.form_submit_button(
                "Save Campaign", type="primary", use_container_width=True
            )

    with guide_col:
        render_action_card(
            st,
            title="Content checklist",
            description=(
                "Gunakan pesan yang spesifik, tawarkan manfaat, tambahkan CTA, "
                "dan sesuaikan channel."
            ),
            icon="✅",
            badge="Best Practice",
        )

    if submitted:
        response = client.create_marketing_record(
            {
                "business_id": business_id,
                "marketing_data": {
                    "platform": platform,
                    "caption": caption,
                    "prompt": campaign,
                    "product_id": product_id,
                },
                "session_id": session_id,
            }
        )
        if response.get("success"):
            st.session_state["go_marketing_flash"] = "Campaign berhasil disimpan."
            st.rerun()
        else:
            st.error(error_message(response))


def _render_recommendations(st: Any, response: Mapping[str, Any]) -> None:
    """Render marketing recommendations."""

    render_section_header(
        st,
        eyebrow="Recommendations",
        title="Marketing Recommendations",
        description="Kartu rekomendasi dari konteks produk dan campaign.",
    )

    if not response.get("success"):
        render_empty_state(
            st,
            title="Rekomendasi belum tersedia",
            description=error_message(response),
            icon="💡",
        )
        return

    data = response_data(response)
    recommendations = find_items(data, ("recommendations", "campaign_ideas", "suggestions"))
    if not recommendations:
        recommendations = [
            {
                "title": "Promosi produk unggulan",
                "description": "Gunakan produk paling aktif sebagai konten utama campaign.",
            },
            {
                "title": "Caption berbasis manfaat",
                "description": (
                    "Tekankan manfaat praktis, harga, dan alasan pelanggan perlu membeli hari ini."
                ),
            },
            {
                "title": "Channel mix",
                "description": "Mulai dari Instagram untuk awareness dan WhatsApp untuk closing.",
            },
        ]

    cols = st.columns(3)
    for index, recommendation in enumerate(recommendations[:6]):
        with cols[index % 3]:
            render_action_card(
                st,
                title=safe_text(
                    recommendation.get("title") or recommendation.get("name") or f"Idea {index + 1}"
                ),
                description=safe_text(
                    recommendation.get("description")
                    or recommendation.get("message")
                    or recommendation.get("caption"),
                    "Gunakan ide ini untuk campaign berikutnya.",
                ),
                icon="💡",
                badge="AI Suggestion",
            )


def _render_history(st: Any, response: Mapping[str, Any]) -> None:
    """Render campaign history."""

    render_section_header(
        st,
        eyebrow="History",
        title="Campaign History",
        description="Riwayat campaign tersimpan.",
    )

    if not response.get("success"):
        render_empty_state(
            st,
            title="Riwayat belum tersedia",
            description=error_message(response),
            icon="📭",
        )
        return

    history = find_items(
        response_data(response), ("history", "records", "items", "marketing_history")
    )
    if not history:
        render_empty_state(
            st,
            title="Belum ada campaign",
            description="Campaign yang disimpan akan muncul di sini.",
            icon="📣",
        )
        return

    st.dataframe(_display_history(history), use_container_width=True, hide_index=True)


def _display_history(history: list[dict[str, Any]]) -> list[dict[str, Any]]:
    """Build history table."""

    rows: list[dict[str, Any]] = []
    for item in history[:50]:
        rows.append(
            {
                "Campaign": safe_text(
                    item.get("campaign_name")
                    or item.get("campaign")
                    or item.get("title")
                    or item.get("prompt"),
                    "-",
                ),
                "Platform": safe_text(item.get("platform"), "-"),
                "Caption": safe_text(item.get("caption") or item.get("message"), "-")[:120],
                "Created": safe_text(item.get("created_at") or item.get("date"), "-"),
            }
        )
    return rows


def _load_products(st: Any, client: Any, business_id: str) -> list[dict[str, Any]]:
    """Load products for product-scoped marketing actions."""

    cached_products = get_backend_products(st.session_state)
    response = client.list_products(business_id=business_id, limit=100)
    if not response.get("success"):
        return cached_products

    products = find_items(response_data(response), ("products", "items", "records"))
    if products:
        set_backend_products(st.session_state, products)
        return products

    return cached_products


def _render_product_selector(
    st: Any,
    products: list[dict[str, Any]],
    *,
    current_product_id: str,
    key: str,
) -> dict[str, Any] | None:
    """Render product selector and return the selected product."""

    options = [product for product in products if _product_id(product)]
    if not options:
        return None

    selected_index = _selected_product_index(options, current_product_id)
    selected_product = st.selectbox(
        "Product context",
        options,
        index=selected_index,
        format_func=_product_label,
        key=key,
    )
    if not isinstance(selected_product, dict):
        return None

    set_active_product_from_response(st.session_state, selected_product)

    return selected_product


def _selected_product_index(
    products: list[dict[str, Any]],
    current_product_id: str,
) -> int:
    """Return selected product index."""

    for index, product in enumerate(products):
        if _product_id(product) == current_product_id:
            return index

    return 0


def _product_id(product: Mapping[str, Any]) -> str:
    """Return product identifier from flexible backend response keys."""

    return safe_text(
        product.get("product_id") or product.get("id") or product.get("uuid"),
        "",
    )


def _product_label(product: Mapping[str, Any]) -> str:
    """Return readable product label."""

    name = safe_text(
        product.get("name") or product.get("product_name"),
        "Produk",
    )
    stock = safe_text(
        product.get("stock") or product.get("current_stock") or product.get("stock_quantity"),
        "-",
    )

    return f"{name} · Stock {stock}"


def _get_streamlit() -> Any:
    """Import Streamlit."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_page()
