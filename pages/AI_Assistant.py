"""
AI Assistant Page
=================

Streamlit AI assistant page for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.frontend.assets import load_frontend_assets

DEFAULT_EXPLICIT_ROUTE = None
PAGE_NAME = "ai_assistant"


def initialize_chat_state(session_state: dict[str, Any]) -> None:
    """Initialize chat session state."""

    if "chat_messages" not in session_state:
        session_state["chat_messages"] = []


def append_chat_message(
    session_state: dict[str, Any],
    *,
    role: str,
    content: str,
) -> None:
    """Append chat message to session state."""

    _validate_role(role)
    _validate_text(content, field_name="content")
    initialize_chat_state(session_state)

    session_state["chat_messages"].append(
        {
            "role": role,
            "content": content.strip(),
        }
    )


def build_route_payload(
    *,
    business_id: str,
    session_id: str,
    user_input: str,
    explicit_route: str | None = DEFAULT_EXPLICIT_ROUTE,
) -> dict[str, Any]:
    """Build router request payload."""

    _validate_text(business_id, field_name="business_id")
    _validate_text(session_id, field_name="session_id")
    _validate_text(user_input, field_name="user_input")

    return {
        "user_input": user_input.strip(),
        "payload": {
            "business_id": business_id.strip(),
            "session_id": session_id.strip(),
            "user_message": user_input.strip(),
        },
        "explicit_route": explicit_route,
    }


def extract_assistant_text(response: Mapping[str, Any]) -> str:
    """Extract assistant display text from router response."""

    if not response.get("success"):
        error = response.get("error")
        if isinstance(error, Mapping):
            return f"Maaf, terjadi kendala: {error.get('message', 'Unknown error')}"
        return "Maaf, terjadi kendala."

    data = response.get("data", {})
    if not isinstance(data, Mapping):
        return "Permintaan berhasil diproses."

    route = data.get("route")
    route_response = data.get("route_response")

    if isinstance(route_response, Mapping):
        nested_data = route_response.get("data")
        if isinstance(nested_data, Mapping):
            return f"Permintaan berhasil diproses melalui route {route}: {nested_data}"

    return f"Permintaan berhasil diproses melalui route {route}."


def render_page(api_client: Any | None = None) -> None:
    """Render AI Assistant page."""

    st = _get_streamlit()
    st.set_page_config(page_title="AI Assistant", page_icon="🤖", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)

    initialize_chat_state(st.session_state)

    business_id = st.session_state.get("business_id", "")
    session_id = st.session_state.get("session_id", "default-session")

    for message in st.session_state["chat_messages"]:
        with st.chat_message(message["role"]):
            st.write(message["content"])

    if api_client is None:
        st.info("Hubungkan API client untuk memakai AI Assistant.")
        return

    user_input = st.chat_input("Tanyakan sesuatu tentang bisnis Anda...")
    if user_input:
        append_chat_message(st.session_state, role="user", content=user_input)
        request = build_route_payload(
            business_id=business_id,
            session_id=session_id,
            user_input=user_input,
        )
        response = api_client.route(**request)
        assistant_text = extract_assistant_text(response)
        append_chat_message(
            st.session_state,
            role="assistant",
            content=assistant_text,
        )
        st.rerun()


def _get_streamlit() -> Any:
    """Import Streamlit lazily."""

    import streamlit as st

    return st


def _validate_text(value: Any, *, field_name: str) -> None:
    """Validate required text."""

    if value is None or not str(value).strip():
        raise ValueError(f"{field_name} is required.")


def _validate_role(role: str) -> None:
    """Validate chat role."""

    if role not in {"user", "assistant", "system"}:
        raise ValueError("role must be one of ['assistant', 'system', 'user'].")


if __name__ == "__main__":
    render_page()
