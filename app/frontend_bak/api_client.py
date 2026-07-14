"""Frontend HTTP API client for the Streamlit layer."""

from __future__ import annotations

import json
from typing import Any, Callable, Mapping
from urllib.error import HTTPError, URLError
from urllib.parse import urlencode
from urllib.request import Request, urlopen

Transport = Callable[[str, str, dict[str, str], bytes | None, float], tuple[int, str]]


class FrontendApiClient:
    """Small HTTP client that connects Streamlit pages to FastAPI endpoints."""

    def __init__(
        self,
        api_base_url: str = 'http://127.0.0.1:8000',
        *,
        timeout: float = 20.0,
        transport: Transport | None = None,
    ) -> None:
        if not isinstance(api_base_url, str) or not api_base_url.strip():
            raise ValueError('api_base_url is required.')
        if not isinstance(timeout, (int, float)) or timeout <= 0:
            raise ValueError('timeout must be a positive number.')
        self.api_base_url = api_base_url.strip().rstrip('/')
        self.timeout = float(timeout)
        self._transport = transport or self._urllib_transport

    def health_check(self) -> dict[str, Any]:
        return self._request('GET', '/health')

    def get_dashboard(self, business_id: str, limit: int = 1000) -> dict[str, Any]:
        return self._request('GET', f'/api/v1/analytics/dashboard/{self._path(business_id)}', query={'limit': limit})

    def get_sales_summary(self, business_id: str, limit: int = 1000) -> dict[str, Any]:
        return self._request('GET', f'/api/v1/analytics/sales/{self._path(business_id)}', query={'limit': limit})

    def get_inventory_summary(self, business_id: str, limit: int = 1000) -> dict[str, Any]:
        return self._request('GET', f'/api/v1/analytics/inventory/{self._path(business_id)}', query={'limit': limit})

    def get_product_summary(self, business_id: str, limit: int = 1000) -> dict[str, Any]:
        return self._request('GET', f'/api/v1/analytics/products/{self._path(business_id)}', query={'limit': limit})

    def get_customer_summary(self, business_id: str, limit: int = 1000) -> dict[str, Any]:
        return self._request('GET', f'/api/v1/analytics/customers/{self._path(business_id)}', query={'limit': limit})

    def business_overview(self, business_id: str, limit: int = 1000, session_id: str | None = None) -> dict[str, Any]:
        return self._request('POST', '/api/v1/business/overview', json_body={'business_id': business_id, 'limit': limit, 'session_id': session_id})

    def business_health_check(self, business_id: str, limit: int = 1000, session_id: str | None = None) -> dict[str, Any]:
        return self._request('POST', '/api/v1/business/health-check', json_body={'business_id': business_id, 'limit': limit, 'session_id': session_id})

    def record_transaction(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        return self._request('POST', '/api/v1/transactions/record', json_body=dict(payload))

    def record_transaction_payload(self, transaction_data: Mapping[str, Any]) -> dict[str, Any]:
        return self._request('POST', '/api/v1/transactions/record-payload', json_body={'transaction_data': dict(transaction_data)})

    def get_transaction_summary(self, business_id: str, limit: int = 1000) -> dict[str, Any]:
        return self._request('GET', f'/api/v1/transactions/summary/{self._path(business_id)}', query={'limit': limit})

    def get_marketing_context(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        return self._request('POST', '/api/v1/marketing/context', json_body=dict(payload))

    def create_marketing_record(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        return self._request('POST', '/api/v1/marketing/records', json_body=dict(payload))

    def get_marketing_history(self, business_id: str, keyword: str | None = None, limit: int = 100) -> dict[str, Any]:
        return self._request('GET', f'/api/v1/marketing/history/{self._path(business_id)}', query={'keyword': keyword, 'limit': limit})

    def get_insight_context(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        return self._request('POST', '/api/v1/insights/context', json_body=dict(payload))

    def create_insight(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        return self._request('POST', '/api/v1/insights/records', json_body=dict(payload))

    def get_insight_review(self, business_id: str, keyword: str | None = None, insight_category: str | None = None, limit: int = 100) -> dict[str, Any]:
        return self._request('GET', f'/api/v1/insights/review/{self._path(business_id)}', query={'keyword': keyword, 'insight_category': insight_category, 'limit': limit})

    def export_dashboard(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        return self._request('POST', '/api/v1/exports/dashboard', json_body=dict(payload))

    def export_sales_summary(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        return self._request('POST', '/api/v1/exports/sales-summary', json_body=dict(payload))

    def export_inventory_summary(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        return self._request('POST', '/api/v1/exports/inventory-summary', json_body=dict(payload))

    def export_structured_data(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        return self._request('POST', '/api/v1/exports/structured', json_body=dict(payload))

    def route(self, user_input: str, payload: Mapping[str, Any], explicit_route: str | None = None) -> dict[str, Any]:
        return self._request('POST', '/api/v1/router/route', json_body={'user_input': user_input, 'payload': dict(payload), 'explicit_route': explicit_route})

    def _request(self, method: str, path: str, *, json_body: Mapping[str, Any] | None = None, query: Mapping[str, Any] | None = None) -> dict[str, Any]:
        try:
            url = self._url(path, query)
            headers = {'Accept': 'application/json'}
            body = None
            if json_body is not None:
                body = json.dumps(self._clean(dict(json_body)), ensure_ascii=False, default=str).encode('utf-8')
                headers['Content-Type'] = 'application/json'
            status, text = self._transport(method.upper(), url, headers, body, self.timeout)
            parsed = self._parse(text)
            if 200 <= status < 300:
                return parsed
            parsed.setdefault('success', False)
            parsed['_http_status'] = status
            return parsed
        except HTTPError as exc:
            return self._http_error(exc)
        except URLError as exc:
            return self._failure('ConnectionError', f'Unable to connect to API backend: {exc.reason}')
        except Exception as exc:
            return self._failure(exc.__class__.__name__, str(exc))

    def _urllib_transport(self, method: str, url: str, headers: dict[str, str], body: bytes | None, timeout: float) -> tuple[int, str]:
        request = Request(url=url, data=body, headers=headers, method=method)
        with urlopen(request, timeout=timeout) as response:
            return int(response.status), response.read().decode('utf-8')

    def _url(self, path: str, query: Mapping[str, Any] | None = None) -> str:
        if not path.startswith('/'):
            raise ValueError("path must start with '/'.")
        url = f'{self.api_base_url}{path}'
        query_data = self._clean(dict(query or {}))
        if query_data:
            url = f'{url}?{urlencode(query_data)}'
        return url

    def _parse(self, text: str) -> dict[str, Any]:
        if not text.strip():
            return {'success': True, 'data': {}, 'error': None}
        data = json.loads(text)
        if isinstance(data, dict):
            return data
        return {'success': True, 'data': data, 'error': None}

    def _http_error(self, exc: HTTPError) -> dict[str, Any]:
        try:
            parsed = self._parse(exc.read().decode('utf-8'))
            parsed.setdefault('success', False)
            parsed['_http_status'] = int(exc.code)
            return parsed
        except Exception:
            return self._failure('HTTPError', f'API returned status code {exc.code}.', int(exc.code))

    def _failure(self, error_type: str, message: str, status: int | None = None) -> dict[str, Any]:
        response: dict[str, Any] = {'success': False, 'data': {}, 'error': {'type': error_type, 'message': message}}
        if status is not None:
            response['_http_status'] = status
        return response

    def _path(self, value: str) -> str:
        if not isinstance(value, str) or not value.strip():
            raise ValueError('path value is required.')
        value = value.strip()
        if '/' in value or '\\' in value:
            raise ValueError('path value must not contain slashes.')
        return value

    def _clean(self, data: dict[str, Any]) -> dict[str, Any]:
        return {key: value for key, value in data.items() if value is not None}
