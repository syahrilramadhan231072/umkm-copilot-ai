"""Streamlit Transactions page."""

from __future__ import annotations

from typing import Any, Mapping

from app.frontend.assets import load_frontend_assets
from app.frontend.session import ensure_frontend_session, get_api_client_from_session_state

PAGE_NAME = 'transactions'


def build_transaction_payload(*, business_id: str, product_id: str, quantity: int, payment_method: str = 'cash', status: str = 'completed', notes: str | None = None, session_id: str | None = None) -> dict[str, Any]:
    _required_text(business_id, 'business_id')
    _required_text(product_id, 'product_id')
    _positive_int(quantity, 'quantity')
    return {'business_id': business_id.strip(), 'product_id': product_id.strip(), 'quantity': quantity, 'payment_method': payment_method, 'status': status, 'notes': _optional(notes), 'session_id': _optional(session_id)}


def build_summary_request(business_id: str, limit: int = 1000) -> dict[str, Any]:
    _required_text(business_id, 'business_id')
    _positive_int(limit, 'limit')
    return {'business_id': business_id.strip(), 'limit': limit}


def get_error_message(response: Mapping[str, Any]) -> str:
    error = response.get('error')
    if isinstance(error, Mapping):
        return str(error.get('message', 'Transaksi gagal diproses.'))
    return 'Transaksi gagal diproses.'


def render_page(api_client: Any | None = None) -> None:
    st = _get_streamlit()
    st.set_page_config(page_title='Transactions', page_icon='Transactions', layout='wide')
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)
    client = api_client or get_api_client_from_session_state(st.session_state)
    business_id = str(st.session_state['business_id'])
    session_id = str(st.session_state['session_id'])

    with st.form('transaction_form'):
        business_id = st.text_input('Business ID', value=business_id)
        product_id = st.text_input('Product ID')
        quantity = st.number_input('Quantity', min_value=1, value=1, step=1)
        payment_method = st.selectbox('Payment Method', ['cash', 'qris', 'transfer', 'credit_card', 'other'])
        status = st.selectbox('Status', ['completed', 'cancelled', 'refunded'])
        notes = st.text_area('Notes')
        submitted = st.form_submit_button('Record Transaction')
    if submitted:
        payload = build_transaction_payload(business_id=business_id, product_id=product_id, quantity=int(quantity), payment_method=str(payment_method), status=str(status), notes=notes, session_id=session_id)
        _show(st, client.record_transaction(payload), 'Record Transaction')

    st.divider()
    limit = st.number_input('Summary Limit', min_value=1, value=1000, step=100)
    if st.button('Load Transaction Summary'):
        _show(st, client.get_transaction_summary(**build_summary_request(business_id, int(limit))), 'Transaction Summary')


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
