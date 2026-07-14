"""Tests for frontend session helpers."""

from __future__ import annotations

from app.frontend.api_client import FrontendApiClient
from app.frontend.session import DEFAULT_API_BASE_URL, DEFAULT_BUSINESS_ID, DEFAULT_LIMIT, DEFAULT_SESSION_ID, build_common_payload, ensure_frontend_session, get_api_client_from_session_state


def test_session_defaults() -> None:
    state = {}
    ensure_frontend_session(state)
    assert state['api_base_url'] == DEFAULT_API_BASE_URL
    assert state['business_id'] == DEFAULT_BUSINESS_ID
    assert state['session_id'] == DEFAULT_SESSION_ID
    assert state['dashboard_limit'] == DEFAULT_LIMIT


def test_api_client_from_session() -> None:
    state = {'api_base_url': 'http://api.test'}
    client = get_api_client_from_session_state(state)
    assert isinstance(client, FrontendApiClient)
    assert client.api_base_url == 'http://api.test'


def test_common_payload() -> None:
    state = {'business_id': 'b1', 'session_id': 's1'}
    assert build_common_payload(state, {'user_message': 'hi'}) == {'business_id': 'b1', 'session_id': 's1', 'user_message': 'hi'}
