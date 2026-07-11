"""
Settings Page
=============

Streamlit settings page for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, MutableMapping

from app.frontend.assets import load_frontend_assets

DEFAULT_API_BASE_URL = "http://localhost:8000"
DEFAULT_BUSINESS_ID = "default-business"
DEFAULT_SESSION_ID = "default-session"
PAGE_NAME = "settings"


def build_settings_state(
    *,
    api_base_url: str,
    business_id: str,
    session_id: str,
) -> dict[str, str]:
    """Build settings state."""

    _validate_text(api_base_url, field_name="api_base_url")
    _validate_text(business_id, field_name="business_id")
    _validate_text(session_id, field_name="session_id")

    return {
        "api_base_url": api_base_url.strip().rstrip("/"),
        "business_id": business_id.strip(),
        "session_id": session_id.strip(),
    }


def apply_settings(
    session_state: MutableMapping[str, Any],
    settings: dict[str, str],
) -> None:
    """Apply settings to Streamlit session state."""

    required_keys = {"api_base_url", "business_id", "session_id"}
    missing_keys = required_keys.difference(settings)

    if missing_keys:
        raise ValueError(f"Missing settings keys: {sorted(missing_keys)}.")

    for key in required_keys:
        _validate_text(settings[key], field_name=key)
        session_state[key] = settings[key]


def get_current_settings(session_state: MutableMapping[str, Any]) -> dict[str, str]:
    """Get current settings from session state."""

    return {
        "api_base_url": str(session_state.get("api_base_url", DEFAULT_API_BASE_URL)),
        "business_id": str(session_state.get("business_id", DEFAULT_BUSINESS_ID)),
        "session_id": str(session_state.get("session_id", DEFAULT_SESSION_ID)),
    }


def render_page() -> None:
    """Render settings page."""

    st = _get_streamlit()
    st.set_page_config(page_title="Settings", page_icon="⚙️", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)

    current = get_current_settings(st.session_state)

    with st.form("settings_form"):
        api_base_url = st.text_input("API Base URL", value=current["api_base_url"])
        business_id = st.text_input("Business ID", value=current["business_id"])
        session_id = st.text_input("Session ID", value=current["session_id"])
        submitted = st.form_submit_button("Save Settings")

    if submitted:
        settings = build_settings_state(
            api_base_url=api_base_url,
            business_id=business_id,
            session_id=session_id,
        )
        apply_settings(st.session_state, settings)
        st.success("Settings saved.")

    st.subheader("Current Settings")
    st.json(get_current_settings(st.session_state))


def _get_streamlit() -> Any:
    """Import Streamlit lazily."""

    import streamlit as st

    return st


def _validate_text(value: Any, *, field_name: str) -> None:
    """Validate required text."""

    if value is None or not str(value).strip():
        raise ValueError(f"{field_name} is required.")


if __name__ == "__main__":
    render_page()
