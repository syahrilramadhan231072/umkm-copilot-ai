"""Streamlit Export page."""

from __future__ import annotations

import json
from typing import Any, Mapping

from app.frontend.assets import load_frontend_assets
from app.frontend.session import ensure_frontend_session, get_api_client_from_session_state

PAGE_NAME = 'export'
SUPPORTED_FORMATS = {'json', 'csv'}


def build_export_payload(*, business_id: str, export_type: str, export_format: str = 'json', limit: int = 1000, session_id: str | None = None) -> dict[str, Any]:
    _required_text(business_id, 'business_id')
    if export_format not in SUPPORTED_FORMATS:
        raise ValueError("export_format must be one of ['csv', 'json'].")
    return {'business_id': business_id.strip(), 'export_type': export_type, 'export_format': export_format, 'limit': limit, 'session_id': _optional(session_id)}


def extract_export_file(response: Mapping[str, Any]) -> dict[str, Any]:
    if not response.get('success'):
        return {}
    data = response.get('data', {})
    if isinstance(data, Mapping) and isinstance(data.get('export'), Mapping):
        return dict(data['export'])
    return dict(data) if isinstance(data, Mapping) else {}


def render_page(api_client: Any | None = None) -> None:
    st = _get_streamlit()
    st.set_page_config(page_title='Export', page_icon='Export', layout='wide')
    load_frontend_assets(st, page_name=PAGE_NAME)
    ensure_frontend_session(st.session_state)
    client = api_client or get_api_client_from_session_state(st.session_state)
    business_id = str(st.session_state['business_id'])
    session_id = str(st.session_state['session_id'])
    export_type = st.selectbox('Export Type', ['dashboard', 'sales_summary', 'inventory_summary'])
    export_format = st.selectbox('Format', ['json', 'csv'])
    limit = st.number_input('Limit', min_value=1, value=1000, step=100)
    if st.button('Generate Export', type='primary'):
        payload = build_export_payload(business_id=business_id, export_type=str(export_type), export_format=str(export_format), limit=int(limit), session_id=session_id)
        if export_type == 'dashboard':
            response = client.export_dashboard(payload)
        elif export_type == 'sales_summary':
            response = client.export_sales_summary(payload)
        else:
            response = client.export_inventory_summary(payload)
        _render_export(st, response, str(export_format))

    st.divider()
    with st.form('structured_export_form'):
        filename_prefix = st.text_input('Filename Prefix', value='structured_export')
        structured_format = st.selectbox('Structured Format', ['json', 'csv'])
        json_text = st.text_area('Data JSON', value='[{"name": "Sample Product", "value": 100}]')
        submitted = st.form_submit_button('Export Structured Data')
    if submitted:
        payload = {'data_to_export': json.loads(json_text), 'export_format': structured_format, 'filename_prefix': filename_prefix}
        _render_export(st, client.export_structured_data(payload), str(structured_format))


def _render_export(st: Any, response: Mapping[str, Any], export_format: str) -> None:
    if not response.get('success'):
        st.error(_error(response))
        st.json(dict(response))
        return
    export_file = extract_export_file(response)
    st.success('Export ready.')
    st.json(dict(response))
    st.download_button(label='Download Export', data=str(export_file.get('content', '')), file_name=str(export_file.get('filename', f'export.{export_format}')), mime=str(export_file.get('content_type', 'text/csv' if export_format == 'csv' else 'application/json')))


def _error(response: Mapping[str, Any]) -> str:
    error = response.get('error')
    return str(error.get('message', 'Export request failed.')) if isinstance(error, Mapping) else 'Export request failed.'


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
