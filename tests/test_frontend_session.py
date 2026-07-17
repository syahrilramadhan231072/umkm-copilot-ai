from __future__ import annotations

from app.frontend.session import (
    build_business_preferences,
    ensure_frontend_session,
    has_active_product,
    has_business_profile,
    set_active_product_from_response,
    set_business_from_response,
)


def test_set_business_from_response() -> None:
    state = {}
    set_business_from_response(
        state,
        {
            "business_id": "11111111-1111-4111-8111-111111111111",
            "business_name": "Demo Coffee",
            "owner_name": "Sari",
            "business_type": "Kuliner",
            "currency": "IDR",
            "timezone": "Asia/Jakarta",
            "language": "Bahasa Indonesia",
        },
    )
    assert has_business_profile(state) is True
    assert build_business_preferences(state)["business_name"] == "Demo Coffee"


def test_set_active_product_from_response() -> None:
    state = {}
    ensure_frontend_session(state)
    set_active_product_from_response(
        state,
        {"product_id": "product-1", "name": "Kopi Susu"},
    )
    assert has_active_product(state) is True
    assert state["active_product_name"] == "Kopi Susu"
