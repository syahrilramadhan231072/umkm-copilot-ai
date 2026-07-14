"""Streamlit Settings page."""

from __future__ import annotations

from typing import Any, MutableMapping

from app.frontend.assets import load_frontend_assets
from app.frontend.session import DEFAULT_API_BASE_URL, DEFAULT_BUSINESS_ID, DEFAULT_SESSION_ID, ensure_frontend_session, get_api_client_from_session_state

PAGE_NAME = 'settings'


def build_settings_state(*, api_base_url: str, business_id: str, session_id: str) -> dict[str, str]:
    for name, value in {'api_base_url': api_base_url, 'business_id': business_id, 'session_id': session_id}.items():
        if not str(value).strip():
            raise ValueError(f'{name} is required.')
    return {'api_base_url': api_base_url.strip().rstrip('/'), 'business_id': business_id.strip(), 'session_id': session_id.strip()}


def apply_settings(session_state: MutableMapping[str, Any], settings: dict[str, str]) -> None:
    for key in ['api_base_url', 'business_id', 'session_id']:
        if key not in settings or not settings[key].strip():
            raise ValueError(f'{key} is required.')
        session_state[key] = settings[key]


def get_current_settings(session_state: MutableMapping[str, Any]) -> dict[str, str]:
    return {'api_base_url': str(session_state.get('api_base_url', DEFAULT_API_BASE_URL)), 'business_id': str(session_state.get('business_id', DEFAULT_BUSINESS_ID)), 'session_id': str(session_state.get('session_id', DEFAULT_SESSION_ID))}


def render_page() -> None:
    st = _get_streamlit()
    st.set_page_config(page_title='Settings', page_icon='Settings', layout='wide')
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)
    current = get_current_settings(st.session_state)
    with st.form('settings_form'):
        api_base_url = st.text_input('API Base URL', value=current['api_base_url'])
        business_id = st.text_input('Business ID', value=current['business_id'])
        session_id = st.text_input('Session ID', value=current['session_id'])
        submitted = st.form_submit_button('Save Settings')
    if submitted:
        apply_settings(st.session_state, build_settings_state(api_base_url=api_base_url, business_id=business_id, session_id=session_id))
        st.success('Settings saved.')
    if st.button('Check API Health', type='primary'):
        response = get_api_client_from_session_state(st.session_state).health_check()
        if response.get('success'):
            st.success('Backend connected.')
        else:
            st.error(_error(response))
        st.json(response)
    st.subheader('Current Settings')
    st.json(get_current_settings(st.session_state))


def _error(response: dict[str, Any]) -> str:
    error = response.get('error')
    return str(error.get('message', 'Request failed.')) if isinstance(error, dict) else 'Request failed.'


def _get_streamlit() -> Any:
    import streamlit as st
    return st


if __name__ == '__main__':
    render_page()
