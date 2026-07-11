"""
Transactions Page
=================

Streamlit transaction page for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.frontend.assets import load_frontend_assets

DEFAULT_PAYMENT_METHOD = "cash"
DEFAULT_STATUS = "completed"
PAGE_NAME = "transactions"


def build_transaction_payload(
    *,
    business_id: str,
    product_id: str,
    quantity: int,
    payment_method: str = DEFAULT_PAYMENT_METHOD,
    status: str = DEFAULT_STATUS,
    notes: str | None = None,
    session_id: str | None = None,
) -> dict[str, Any]:
    """Build transaction payload."""

    _validate_text(business_id, field_name="business_id")
    _validate_text(product_id, field_name="product_id")
    _validate_positive_int(quantity, field_name="quantity")
    _validate_text(payment_method, field_name="payment_method")
    _validate_text(status, field_name="status")

    return {
        "business_id": business_id.strip(),
        "product_id": product_id.strip(),
        "quantity": quantity,
        "payment_method": payment_method.strip(),
        "status": status.strip(),
        "notes": _optional_text(notes),
        "session_id": _optional_text(session_id),
    }


def extract_transaction_result(response: Mapping[str, Any]) -> dict[str, Any]:
    """Extract transaction result from API response."""

    if not response.get("success"):
        return {}

    data = response.get("data", {})
    if not isinstance(data, Mapping):
        return {}

    transaction = data.get("transaction")
    if isinstance(transaction, Mapping):
        return dict(transaction)

    return dict(data)


def build_summary_request(business_id: str, limit: int = 1000) -> dict[str, Any]:
    """Build transaction summary request."""

    _validate_text(business_id, field_name="business_id")
    _validate_positive_int(limit, field_name="limit")

    return {
        "business_id": business_id.strip(),
        "limit": limit,
    }


def get_error_message(response: Mapping[str, Any]) -> str:
    """Extract error message."""

    error = response.get("error")
    if isinstance(error, Mapping):
        return str(error.get("message", "Transaksi gagal diproses."))

    return "Transaksi gagal diproses."


def render_page(api_client: Any | None = None) -> None:
    """Render transactions page."""

    st = _get_streamlit()
    st.set_page_config(page_title="Transactions", page_icon="🧾", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)

    business_id = st.session_state.get("business_id", "")
    session_id = st.session_state.get("session_id", "")

    with st.form("transaction_form"):
        business_id = st.text_input("Business ID", value=business_id)
        product_id = st.text_input("Product ID")
        quantity = st.number_input("Quantity", min_value=1, value=1, step=1)
        payment_method = st.selectbox("Payment Method", ["cash", "transfer", "qris"])
        status = st.selectbox("Status", ["completed", "pending", "cancelled"])
        notes = st.text_area("Notes")
        submitted = st.form_submit_button("Record Transaction")

    if api_client is None:
        st.info("Hubungkan API client untuk mencatat transaksi.")
        return

    if submitted:
        payload = build_transaction_payload(
            business_id=business_id,
            product_id=product_id,
            quantity=int(quantity),
            payment_method=str(payment_method),
            status=str(status),
            notes=notes,
            session_id=session_id,
        )
        response = api_client.record_transaction(payload)

        if response.get("success"):
            st.success("Transaction recorded successfully.")
            st.json(extract_transaction_result(response))
        else:
            st.error(get_error_message(response))


def _get_streamlit() -> Any:
    """Import Streamlit lazily."""

    import streamlit as st

    return st


def _validate_text(value: Any, *, field_name: str) -> None:
    """Validate required text."""

    if value is None or not str(value).strip():
        raise ValueError(f"{field_name} is required.")


def _validate_positive_int(value: Any, *, field_name: str) -> None:
    """Validate positive integer."""

    if not isinstance(value, int) or value <= 0:
        raise ValueError(f"{field_name} must be a positive integer.")


def _optional_text(value: str | None) -> str | None:
    """Normalize optional text."""

    if value is None:
        return None

    text = str(value).strip()

    return text or None


if __name__ == "__main__":
    render_page()
