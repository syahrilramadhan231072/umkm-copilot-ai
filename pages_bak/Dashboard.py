"""Streamlit Dashboard page."""

from __future__ import annotations

from typing import Any, Mapping

from app.frontend.assets import load_frontend_assets
from app.frontend.session import DEFAULT_LIMIT, ensure_frontend_session, get_api_client_from_session_state

PAGE_NAME = 'dashboard'


def build_dashboard_request(business_id: str, limit: int = DEFAULT_LIMIT) -> dict[str, Any]:
    _required_text(business_id, 'business_id')
    _positive_int(limit, 'limit')
    return {'business_id': business_id.strip(), 'limit': limit}


def get_error_message(response: Mapping[str, Any]) -> str:
    error = response.get('error')
    if isinstance(error, Mapping):
        return str(error.get('message', 'Terjadi kesalahan.'))
    return 'Terjadi kesalahan.'


def render_page(api_client: Any | None = None) -> None:
    st = _get_streamlit()
    st.set_page_config(page_title='Dashboard', page_icon='Dashboard', layout='wide')
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)
    client = api_client or get_api_client_from_session_state(st.session_state)

    with st.sidebar:
        st.subheader('Dashboard Filter')
        business_id = st.text_input('Business ID', value=str(st.session_state['business_id']))
        limit = st.number_input('Limit', min_value=1, value=int(st.session_state['dashboard_limit']), step=100)
        st.session_state['business_id'] = business_id
        st.session_state['dashboard_limit'] = int(limit)

    req = build_dashboard_request(business_id, int(limit))
    col1, col2 = st.columns(2)
    with col1:
        if st.button('Load Dashboard', type='primary'):
            _show(st, client.get_dashboard(**req), 'Dashboard Payload')
    with col2:
        if st.button('Business Health Check'):
            _show(st, client.business_health_check(business_id, int(limit), str(st.session_state['session_id'])), 'Business Health Check')

    st.divider()
    st.subheader('Detailed Analytics')
    tab_sales, tab_inventory, tab_products, tab_customers = st.tabs(['Sales', 'Inventory', 'Products', 'Customers'])
    with tab_sales:
        if st.button('Load Sales Summary'):
            _show(st, client.get_sales_summary(**req), 'Sales Summary')
    with tab_inventory:
        if st.button('Load Inventory Summary'):
            _show(st, client.get_inventory_summary(**req), 'Inventory Summary')
    with tab_products:
        if st.button('Load Product Summary'):
            _show(st, client.get_product_summary(**req), 'Product Summary')
    with tab_customers:
        if st.button('Load Customer Summary'):
            _show(st, client.get_customer_summary(**req), 'Customer Summary')


def _show(st: Any, response: Mapping[str, Any], title: str) -> None:
    st.subheader(title)
    if response.get('success'):
        st.success('Request successful.')
    else:
        st.error(get_error_message(response))
    st.json(dict(response))


def _required_text(value: Any, field: str) -> None:
    if value is None or not str(value).strip():
        raise ValueError(f'{field} is required.')


def _positive_int(value: Any, field: str) -> None:
    if not isinstance(value, int) or value <= 0:
        raise ValueError(f'{field} must be a positive integer.')


def _get_streamlit() -> Any:
    import streamlit as st
    return st


if __name__ == '__main__':
    render_page()
