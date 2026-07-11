"""
API Health Tests
================

Pytest tests for health endpoint.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from fastapi.testclient import TestClient

from app.api.main import create_app


def test_health_check_returns_healthy_status() -> None:
    """Assert health endpoint returns healthy status."""

    client = TestClient(create_app())
    response = client.get("/health")

    assert response.status_code == 200
    payload = response.json()
    assert payload["success"] is True
    assert payload["status"] == "healthy"
