"""Streamlit Marketing page."""

from __future__ import annotations

from typing import Any, Mapping

from app.frontend.assets import load_frontend_assets
from app.frontend.session import ensure_frontend_session, get_api_client_from_session_state

PAGE_NAME = 'marketing'


def build_marketing_context_payload(*, product_id: str, business_id: str | None = None, session_id: str | None = None) -> dict[str, Any]:
    _required_text(product_id, 'product_id')
    return {'product_id': product_id.strip(), 'business_id': _optional(business_id), 'session_id': _optional(session_id)}


def build_marketing_record_payload(*, business_id: str, platform: str, caption: str, campaign_name: str | None = None, product_id: str | None = None, session_id: str | None = None) -> dict[str, Any]:
    _required_text(business_id, 'business_id')
    _required_text(platform, 'platform')
    _required_text(caption, 'caption')
    return {'business_id': business_id.strip(), 'marketing_data': {'platform': platform.strip(), 'caption': caption.strip(), 'campaign_name': _optional(campaign_name), 'product_id': _optional(product_id)}, 'session_id': _optional(session_id)}


def render_page(api_client: Any | None = None) -> None:
    st = _get_streamlit()
    st.set_page_config(page_title='Marketing', page_icon='Marketing', layout='wide')
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)
    client = api_client or get_api_client_from_session_state(st.session_state)
    business_id = str(st.session_state['business_id'])
    session_id = str(st.session_state['session_id'])
    tab1, tab2, tab3 = st.tabs(['Product Context', 'Save Record', 'History'])
    with tab1:
        product_id = st.text_input('Product ID')
        if st.button('Build Marketing Context', type='primary'):
            _show(st, client.get_marketing_context(build_marketing_context_payload(product_id=product_id, business_id=business_id, session_id=session_id)), 'Marketing Context')
    with tab2:
        with st.form('marketing_record_form'):
            platform = st.text_input('Platform', value='Instagram')
            record_product_id = st.text_input('Product ID', value='')
            campaign_name = st.text_input('Campaign Name')
            caption = st.text_area('Caption')
            submitted = st.form_submit_button('Save Marketing Record')
        if submitted:
            payload = build_marketing_record_payload(business_id=business_id, platform=platform, caption=caption, campaign_name=campaign_name, product_id=record_product_id, session_id=session_id)
            _show(st, client.create_marketing_record(payload), 'Create Marketing Record')
    with tab3:
        keyword = st.text_input('Keyword')
        limit = st.number_input('History Limit', min_value=1, value=100, step=10)
        if st.button('Load Marketing History'):
            _show(st, client.get_marketing_history(business_id, keyword or None, int(limit)), 'Marketing History')


def _show(st: Any, response: Mapping[str, Any], title: str) -> None:
    st.subheader(title)
    if response.get('success'):
        st.success('Request successful.')
    else:
        st.error(_error(response))
    st.json(dict(response))


def _error(response: Mapping[str, Any]) -> str:
    error = response.get('error')
    return str(error.get('message', 'Marketing request failed.')) if isinstance(error, Mapping) else 'Marketing request failed.'


def _required_text(value: Any, field: str) -> None:
    if value is None or not str(value).strip():
        raise ValueError(f'{field} is required.')


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
