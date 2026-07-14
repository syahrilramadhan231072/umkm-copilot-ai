"""Streamlit AI Assistant page."""

from __future__ import annotations

from typing import Any, Mapping

from app.frontend.assets import load_frontend_assets
from app.frontend.session import ensure_frontend_session, get_api_client_from_session_state

PAGE_NAME = 'ai_assistant'


def initialize_chat_state(session_state: dict[str, Any]) -> None:
    if 'chat_messages' not in session_state:
        session_state['chat_messages'] = []


def append_chat_message(session_state: dict[str, Any], *, role: str, content: str) -> None:
    if role not in {'user', 'assistant', 'system'}:
        raise ValueError("role must be one of ['assistant', 'system', 'user'].")
    if not content.strip():
        raise ValueError('content is required.')
    initialize_chat_state(session_state)
    session_state['chat_messages'].append({'role': role, 'content': content.strip()})


def build_route_payload(*, business_id: str, session_id: str, user_input: str, explicit_route: str | None = None) -> dict[str, Any]:
    for name, value in {'business_id': business_id, 'session_id': session_id, 'user_input': user_input}.items():
        if not str(value).strip():
            raise ValueError(f'{name} is required.')
    return {'user_input': user_input.strip(), 'payload': {'business_id': business_id.strip(), 'session_id': session_id.strip(), 'user_message': user_input.strip()}, 'explicit_route': explicit_route}


def extract_assistant_text(response: Mapping[str, Any]) -> str:
    if not response.get('success'):
        error = response.get('error')
        return f"Maaf, terjadi kendala: {error.get('message', 'Unknown error')}" if isinstance(error, Mapping) else 'Maaf, terjadi kendala.'
    data = response.get('data', {})
    if isinstance(data, Mapping):
        return f"Permintaan berhasil diproses melalui route {data.get('route', 'unknown')}: {data.get('route_response', data)}"
    return 'Permintaan berhasil diproses.'


def render_page(api_client: Any | None = None) -> None:
    st = _get_streamlit()
    st.set_page_config(page_title='AI Assistant', page_icon='AI', layout='wide')
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)
    initialize_chat_state(st.session_state)
    client = api_client or get_api_client_from_session_state(st.session_state)
    business_id = str(st.session_state['business_id'])
    session_id = str(st.session_state['session_id'])
    explicit_route = st.sidebar.selectbox('Explicit Route', ['auto', 'business', 'transaction', 'marketing', 'insight', 'export'])
    for message in st.session_state['chat_messages']:
        with st.chat_message(message['role']):
            st.write(message['content'])
    user_input = st.chat_input('Tanyakan sesuatu tentang bisnis Anda...')
    if user_input:
        append_chat_message(st.session_state, role='user', content=user_input)
        request = build_route_payload(business_id=business_id, session_id=session_id, user_input=user_input, explicit_route=None if explicit_route == 'auto' else str(explicit_route))
        response = client.route(**request)
        append_chat_message(st.session_state, role='assistant', content=extract_assistant_text(response))
        st.rerun()
    if st.button('Clear Chat'):
        st.session_state['chat_messages'] = []
        st.rerun()


def _get_streamlit() -> Any:
    import streamlit as st
    return st


if __name__ == '__main__':
    render_page()
