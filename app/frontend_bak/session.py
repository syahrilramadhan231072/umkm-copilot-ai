"""Streamlit session helpers for frontend integration."""

from __future__ import annotations

from typing import Any, MutableMapping

from app.frontend.api_client import FrontendApiClient

DEFAULT_API_BASE_URL = 'http://127.0.0.1:8000'
DEFAULT_BUSINESS_ID = 'default-business'
DEFAULT_SESSION_ID = 'default-session'
DEFAULT_LIMIT = 1000


def ensure_frontend_session(session_state: MutableMapping[str, Any]) -> None:
    """Ensure required frontend keys exist in session state."""

    session_state.setdefault('api_base_url', DEFAULT_API_BASE_URL)
    session_state.setdefault('business_id', DEFAULT_BUSINESS_ID)
    session_state.setdefault('session_id', DEFAULT_SESSION_ID)
    session_state.setdefault('dashboard_limit', DEFAULT_LIMIT)


def get_api_client_from_session_state(session_state: MutableMapping[str, Any]) -> FrontendApiClient:
    """Build API client from session state."""

    ensure_frontend_session(session_state)
    return FrontendApiClient(api_base_url=str(session_state['api_base_url']))


def build_common_payload(session_state: MutableMapping[str, Any], extra: dict[str, Any] | None = None) -> dict[str, Any]:
    """Build common payload using business_id and session_id."""

    ensure_frontend_session(session_state)
    payload = {'business_id': str(session_state['business_id']), 'session_id': str(session_state['session_id'])}
    if extra:
        payload.update(extra)
    return payload
