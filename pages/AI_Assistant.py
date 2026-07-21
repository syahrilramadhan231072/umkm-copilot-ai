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
    reset_frontend_session_identity,
)
from app.frontend.ui_components import (
    error_message,
    render_business_header,
    render_hero,
    render_locked_page,
)


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
        eyebrow="Asisten AI",
        title="Tanya Copilot Bisnis Anda",
        description=(
            "Ajukan pertanyaan umum atau pertanyaan tentang penjualan, produk, "
            "stok, pemasaran, dan strategi bisnis."
        ),
    )

    if state.business_profile_ready:
        render_business_header(st, preferences)

    if not state.business_profile_ready:
        render_locked_page(
            st,
            message="Asisten AI memerlukan business aktif agar konteks workspace tersedia.",
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
        with st.spinner("Gemini sedang menyusun jawaban..."):
            response = client.route(
                user_input=user_input,
                payload={
                    "business_id": business_id,
                    "session_id": session_id,
                    "user_message": user_input,
                    "business_profile": preferences,
                    "limit": limit,
                },
            )
        answer = _answer(response)
        st.session_state["chat_messages"].append({"role": "assistant", "content": answer})
        st.rerun()

    col_a, col_b = st.columns(2)
    with col_a:
        if st.button("Hapus Percakapan"):
            st.session_state["chat_messages"] = []
            st.rerun()
    with col_b:
        if st.button("Buat Sesi Baru"):
            reset_frontend_session_identity(st.session_state)
            st.session_state["chat_messages"] = []
            st.success("Sesi percakapan baru dibuat.")
            st.rerun()


def _answer(response: Mapping[str, Any]) -> str:
    """Ambil jawaban AI dari response backend."""

    if not response.get("success"):
        return f"Maaf, terjadi kendala: {error_message(dict(response))}"

    answer = _find_text_value(
        response,
        keys=("answer", "text", "message", "response", "content"),
    )
    if answer:
        return answer

    return "Permintaan berhasil diproses, tetapi backend belum mengembalikan teks jawaban."


def _find_text_value(value: Any, *, keys: tuple[str, ...]) -> str:
    """Cari field teks pada response secara rekursif."""

    if isinstance(value, Mapping):
        for key in keys:
            item = value.get(key)
            if isinstance(item, str) and item.strip():
                return item.strip()

        preferred_children = (
            value.get("data"),
            value.get("route_response"),
            value.get("workflow"),
        )
        for child in preferred_children:
            found = _find_text_value(child, keys=keys)
            if found:
                return found

        for item in value.values():
            found = _find_text_value(item, keys=keys)
            if found:
                return found

    if isinstance(value, list):
        for item in value:
            found = _find_text_value(item, keys=keys)
            if found:
                return found

    return ""


def _get_streamlit() -> Any:
    """Import Streamlit."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_page()
