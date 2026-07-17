from __future__ import annotations

from fastapi.testclient import TestClient

from app.api.main import app


def test_onboarding_business_profile_validation() -> None:
    client = TestClient(app)
    response = client.post(
        "/api/v1/onboarding/business-profile",
        json={
            "business_name": "",
            "owner_name": "Sari",
            "business_type": "Kuliner",
        },
    )
    assert response.status_code == 422


def test_onboarding_product_validation() -> None:
    client = TestClient(app)
    response = client.post(
        "/api/v1/onboarding/products",
        json={
            "business_id": "not-uuid",
            "name": "Kopi Susu",
            "selling_price": 18000,
        },
    )
    assert response.status_code in {422, 500}
