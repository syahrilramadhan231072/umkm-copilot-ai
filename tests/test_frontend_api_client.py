"""Tests for frontend API client."""

from __future__ import annotations

import json
from typing import Any

from app.frontend.api_client import FrontendApiClient


class FakeTransport:
    def __init__(self, status: int = 200, response: dict[str, Any] | None = None) -> None:
        self.status = status
        self.response = response or {"success": True, "data": {"ok": True}, "error": None}
        self.calls: list[dict[str, Any]] = []

    def __call__(
        self,
        method: str,
        url: str,
        headers: dict[str, str],
        body: bytes | None,
        timeout: float,
    ) -> tuple[int, str]:
        self.calls.append(
            {
                "method": method,
                "url": url,
                "headers": headers,
                "body": body.decode("utf-8") if body else None,
                "timeout": timeout,
            }
        )
        return self.status, json.dumps(self.response)


def test_health_endpoint() -> None:
    transport = FakeTransport()
    client = FrontendApiClient("http://api.test", transport=transport)
    assert client.health_check()["success"] is True
    assert transport.calls[0]["url"] == "http://api.test/health"


def test_dashboard_endpoint_with_query() -> None:
    transport = FakeTransport()
    client = FrontendApiClient("http://api.test/", transport=transport)
    client.get_dashboard("business-1", 25)
    assert (
        transport.calls[0]["url"]
        == "http://api.test/api/v1/analytics/dashboard/business-1?limit=25"
    )


def test_record_transaction_posts_body() -> None:
    transport = FakeTransport()
    client = FrontendApiClient("http://api.test", transport=transport)
    client.record_transaction({"business_id": "b1", "product_id": "p1", "quantity": 2})
    body = json.loads(transport.calls[0]["body"])
    assert transport.calls[0]["method"] == "POST"
    assert transport.calls[0]["url"] == "http://api.test/api/v1/transactions/record"
    assert body["quantity"] == 2


def test_router_endpoint() -> None:
    transport = FakeTransport()
    client = FrontendApiClient("http://api.test", transport=transport)
    client.route("lihat dashboard", {"business_id": "b1"}, "business")
    body = json.loads(transport.calls[0]["body"])
    assert transport.calls[0]["url"] == "http://api.test/api/v1/router/route"
    assert body["explicit_route"] == "business"


def test_non_2xx_response() -> None:
    transport = FakeTransport(
        400,
        {
            "success": False,
            "data": {},
            "error": {"message": "Bad request."},
        },
    )
    client = FrontendApiClient("http://api.test", transport=transport)
    response = client.get_sales_summary("b1")
    assert response["success"] is False
    assert response["_http_status"] == 400
