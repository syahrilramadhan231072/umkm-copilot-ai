"""
AI Assistant
============
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
    reset_frontend_session_identity,
)
from app.frontend.ui_components import (
    error_message,
    render_action_card,
    render_business_header,
    render_empty_state,
    render_locked_page,
    render_metric_card,
    render_page_header,
    render_section_header,
    safe_text,
)

PAGE_NAME = "ai_assistant"


SUGGESTED_PROMPTS = [
    "Produk apa yang paling laku?",
    "Bagaimana kondisi bisnis saya hari ini?",
    "Apa rekomendasi stok minggu ini?",
    "Buatkan ide promosi untuk produk terlaris.",
    "Apa risiko bisnis yang perlu saya perhatikan?",
]


def render_page() -> None:
    """Render AI assistant page."""

    st = _get_streamlit()
    st.set_page_config(page_title="Go-UMKM AI · AI Assistant", page_icon="🤖", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)
    st.session_state.setdefault("chat_messages", [])

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
        eyebrow="AI Chat",
        title="AI Business Assistant",
        description=(
            "Ajukan pertanyaan bisnis, transaksi, produk, marketing, dan insight "
            "tanpa melihat raw provider errors."
        ),
        icon="🤖",
    )

    if state.business_profile_ready:
        render_business_header(st, preferences)

    if not state.ai_ready:
        render_locked_page(
            st,
            message="Asisten AI aktif setelah dashboard memiliki data bisnis.",
            state=state,
            next_action_label="Buka Dashboard",
            next_page="pages/Dashboard.py",
        )
        return

    _render_ai_metrics(st)
    _render_suggested_prompts(st)
    _render_chat(st, client, business_id, session_id, preferences, limit)
    _render_chat_controls(st)


def _render_ai_metrics(st: Any) -> None:
    """Render assistant status metrics."""

    cols = st.columns(4)
    with cols[0]:
        render_metric_card(st, label="Mode", value="Business", caption="context-aware", icon="🤖")
    with cols[1]:
        render_metric_card(
            st,
            label="Failover",
            value="Auto",
            caption="Multi-LLM provider layer",
            icon="🔁",
            tone="indigo",
        )
    with cols[2]:
        render_metric_card(
            st,
            label="Privacy",
            value="Backend",
            caption="API keys stay server-side",
            icon="🛡️",
            tone="success",
        )
    with cols[3]:
        render_metric_card(
            st,
            label="UX",
            value="Safe",
            caption="no raw provider errors",
            icon="✨",
            tone="warning",
        )


def _render_suggested_prompts(st: Any) -> None:
    """Render suggested prompts."""

    render_section_header(
        st,
        eyebrow="Suggested Prompts",
        title="Start with a useful business question",
    )
    cols = st.columns(len(SUGGESTED_PROMPTS))
    for index, prompt in enumerate(SUGGESTED_PROMPTS):
        with cols[index]:
            if st.button(prompt, key=f"suggested_prompt_{index}", use_container_width=True):
                st.session_state["go_pending_prompt"] = prompt
                st.rerun()


def _render_chat(
    st: Any,
    client: Any,
    business_id: str,
    session_id: str,
    preferences: Mapping[str, Any],
    limit: int,
) -> None:
    """Render chat interface."""

    render_section_header(
        st,
        eyebrow="Conversation",
        title="Ask Go-UMKM AI",
        description="Jawaban akan menggunakan konteks bisnis aktif bila tersedia.",
    )

    messages = st.session_state.get("chat_messages", [])
    if not messages:
        render_empty_state(
            st,
            title="Belum ada percakapan",
            description=(
                "Mulai dengan pertanyaan tentang produk, transaksi, insight, atau marketing."
            ),
            icon="💬",
        )

    for message in messages:
        role = safe_text(message.get("role"), "assistant")
        content = safe_text(message.get("content"), "")
        with st.chat_message(role):
            st.markdown(content)

    pending_prompt = str(st.session_state.pop("go_pending_prompt", "")).strip()
    user_input = pending_prompt or st.chat_input("Tanyakan sesuatu tentang bisnis Anda...")

    if user_input:
        st.session_state["chat_messages"].append({"role": "user", "content": user_input})
        with st.spinner("Go-UMKM AI sedang menyusun jawaban..."):
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


def _render_chat_controls(st: Any) -> None:
    """Render chat controls."""

    col_a, col_b, col_c = st.columns([0.25, 0.25, 0.5])
    with col_a:
        if st.button("Clear Conversation", use_container_width=True):
            st.session_state["chat_messages"] = []
            st.rerun()
    with col_b:
        if st.button("New Session", use_container_width=True):
            reset_frontend_session_identity(st.session_state)
            st.session_state["chat_messages"] = []
            st.success("Sesi percakapan baru dibuat.")
            st.rerun()
    with col_c:
        render_action_card(
            st,
            title="Helpful assistant",
            description=(
                "Gunakan bahasa natural. Sistem akan menyembunyikan error teknis "
                "provider dari user."
            ),
            icon="✨",
            badge="Safe UX",
        )


def _answer(response: Mapping[str, Any]) -> str:
    """Extract AI answer from backend response."""

    if not response.get("success"):
        return error_message(dict(response))

    answer = _find_text_value(response, keys=("answer", "text", "message", "response", "content"))
    if answer:
        return answer

    return "Permintaan berhasil diproses, tetapi belum ada teks jawaban yang dapat ditampilkan."


def _find_text_value(value: Any, *, keys: tuple[str, ...]) -> str:
    """Cari field teks pada response secara rekursif."""

    if isinstance(value, Mapping):
        for key in keys:
            item = value.get(key)
            if isinstance(item, str) and item.strip():
                return item.strip()

        for child_key in ("data", "route_response", "workflow"):
            found = _find_text_value(value.get(child_key), keys=keys)
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
