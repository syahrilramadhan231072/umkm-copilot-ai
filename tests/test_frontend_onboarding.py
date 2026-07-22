from __future__ import annotations

from app.frontend.onboarding import build_onboarding_state, is_valid_uuid

VALID_UUID = "11111111-1111-4111-8111-111111111111"


def test_business_profile_step_without_business_id() -> None:
    state = build_onboarding_state(business_id="", product_id="")
    assert state.next_step == "business_profile"
    assert state.business_profile_ready is False


def test_products_step_after_business_created() -> None:
    state = build_onboarding_state(business_id=VALID_UUID, product_id="")
    assert state.next_step == "products"
    assert state.business_profile_ready is True
    assert state.product_ready is False


def test_first_transaction_step_after_product_created() -> None:
    state = build_onboarding_state(business_id=VALID_UUID, product_id="product-1")
    assert state.next_step == "first_transaction"
    assert state.product_ready is True
    assert state.has_transactions is False


def test_dashboard_ready_after_dashboard_has_transactions() -> None:
    response = {
        "success": True,
        "data": {"sales_summary": {"total_transactions": 1}},
        "error": None,
    }
    state = build_onboarding_state(
        business_id=VALID_UUID,
        product_id="product-1",
        dashboard_response=response,
    )
    assert state.dashboard_ready is True
    assert state.ai_ready is True
    assert state.next_step == "dashboard"


def test_valid_uuid_detection() -> None:
    assert is_valid_uuid(VALID_UUID) is True
    assert is_valid_uuid("wrong") is False
