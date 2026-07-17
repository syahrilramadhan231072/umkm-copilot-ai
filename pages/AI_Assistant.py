"""
Asisten AI
==========
"""

from __future__ import annotations

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
from app.frontend.ui_components import error_message, render_business_header, render_hero, render_locked_page


PAGE_NAME = "ai_assistant"


def render_page() -> None:
    """Render asisten AI."""

    st = _get_streamlit()
    st.set_page_config(page_title="Asisten AI", page_icon="🤖", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)
    st.session_state.setdefault("chat_messages", [])

    client = get_api_client_from_session_state(st.session_state)
    business_id = str(st.session_state.get("business_id", ""))
    product_id = str(st.session_state.get("active_product_id", ""))
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
        eyebrow="Asisten AI",
        title="Tanya Copilot Bisnis Anda",
        description="Ajukan pertanyaan tentang penjualan, produk, stok, dan promosi.",
    )

    if state.business_profile_ready:
        render_business_header(st, preferences)

    if not state.ai_ready:
        render_locked_page(
            st,
            message="Asisten AI akan aktif setelah transaksi pertama masuk backend.",
            state=state,
            next_action_label="Lanjutkan Penyiapan",
            next_page="app.py",
        )
        return

    for message in st.session_state["chat_messages"]:
        with st.chat_message(str(message["role"])):
            st.write(str(message["content"]))

    user_input = st.chat_input("Tulis pertanyaan Anda...")
    if user_input:
        st.session_state["chat_messages"].append({"role": "user", "content": user_input})
        with st.spinner("Asisten sedang membaca data bisnis..."):
            response = client.route(
                user_input=user_input,
                payload={
                    "business_id": business_id,
                    "session_id": session_id,
                    "user_message": user_input,
                    "business_profile": preferences,
                },
            )
        answer = _answer(response)
        st.session_state["chat_messages"].append({"role": "assistant", "content": answer})
        st.rerun()

    if st.button("Hapus Percakapan"):
        st.session_state["chat_messages"] = []
        st.rerun()


def _answer(response: Mapping[str, Any]) -> str:
    """Extract answer."""

    if not response.get("success"):
        return f"Maaf, terjadi kendala: {error_message(dict(response))}"

    data = response.get("data")
    if isinstance(data, Mapping):
        return str(data.get("answer") or data.get("message") or data.get("route_response") or "Permintaan berhasil diproses.")

    return "Permintaan berhasil diproses."


def _get_streamlit() -> Any:
    """Import Streamlit."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_page()
