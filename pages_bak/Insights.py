"""Streamlit Insights page."""

from __future__ import annotations

from typing import Any, Mapping

from app.frontend.assets import load_frontend_assets
from app.frontend.session import ensure_frontend_session, get_api_client_from_session_state

PAGE_NAME = 'insights'


def build_insight_context_payload(*, business_id: str, limit: int = 100, session_id: str | None = None) -> dict[str, Any]:
    _required_text(business_id, 'business_id')
    _positive_int(limit, 'limit')
    return {'business_id': business_id.strip(), 'limit': limit, 'session_id': _optional(session_id)}


def build_create_insight_payload(*, business_id: str, title: str, insight_category: str, content: str, priority: str = 'medium', session_id: str | None = None) -> dict[str, Any]:
    for field, value in {'business_id': business_id, 'title': title, 'insight_category': insight_category, 'content': content, 'priority': priority}.items():
        _required_text(value, field)
    return {'business_id': business_id.strip(), 'insight_data': {'title': title.strip(), 'insight_category': insight_category.strip(), 'content': content.strip(), 'priority': priority.strip()}, 'session_id': _optional(session_id)}


def render_page(api_client: Any | None = None) -> None:
    st = _get_streamlit()
    st.set_page_config(page_title='Insights', page_icon='Insights', layout='wide')
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)
    client = api_client or get_api_client_from_session_state(st.session_state)
    business_id = st.text_input('Business ID', value=str(st.session_state['business_id']))
    session_id = str(st.session_state['session_id'])
    limit = st.number_input('Limit', min_value=1, value=100, step=10)

    col1, col2 = st.columns(2)
    with col1:
        if st.button('Load Insight Context', type='primary'):
            _show(st, client.get_insight_context(build_insight_context_payload(business_id=business_id, limit=int(limit), session_id=session_id)), 'Insight Context')
    with col2:
        keyword = st.text_input('Search Keyword', value='')
        category = st.text_input('Insight Category', value='')
        if st.button('Review Insights'):
            _show(st, client.get_insight_review(business_id, keyword or None, category or None, int(limit)), 'Insight Review')

    st.divider()
    with st.form('create_insight_form'):
        title = st.text_input('Title')
        category_new = st.text_input('Category', value='general')
        priority = st.selectbox('Priority', ['low', 'medium', 'high'])
        content = st.text_area('Content')
        submitted = st.form_submit_button('Save Insight')
    if submitted:
        payload = build_create_insight_payload(business_id=business_id, title=title, insight_category=category_new, content=content, priority=str(priority), session_id=session_id)
        _show(st, client.create_insight(payload), 'Create Insight')


def _show(st: Any, response: Mapping[str, Any], title: str) -> None:
    st.subheader(title)
    if response.get('success'):
        st.success('Request successful.')
    else:
        st.error(_error(response))
    st.json(dict(response))


def _error(response: Mapping[str, Any]) -> str:
    error = response.get('error')
    return str(error.get('message', 'Insight request failed.')) if isinstance(error, Mapping) else 'Insight request failed.'


def _required_text(value: Any, field: str) -> None:
    if value is None or not str(value).strip():
        raise ValueError(f'{field} is required.')


def _positive_int(value: Any, field: str) -> None:
    if not isinstance(value, int) or value <= 0:
        raise ValueError(f'{field} must be a positive integer.')


def _optional(value: str | None) -> str | None:
    if value is None:
        return None
    text = str(value).strip()
    return text or None


def _get_streamlit() -> Any:
    import streamlit as st
    return st


if __name__ == '__main__':
    render_page()
