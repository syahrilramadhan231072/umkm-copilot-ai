"""
Marketing Page
==============

Streamlit marketing page for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.frontend.assets import load_frontend_assets

PAGE_NAME = "marketing"


def build_marketing_context_payload(
    *,
    product_id: str,
    business_id: str | None = None,
    session_id: str | None = None,
) -> dict[str, Any]:
    """Build marketing context payload."""

    _validate_text(product_id, field_name="product_id")

    return {
        "product_id": product_id.strip(),
        "business_id": _optional_text(business_id),
        "session_id": _optional_text(session_id),
    }


def build_marketing_record_payload(
    *,
    business_id: str,
    platform: str,
    caption: str,
    campaign_name: str | None = None,
    product_id: str | None = None,
    session_id: str | None = None,
) -> dict[str, Any]:
    """Build create marketing record payload."""

    _validate_text(business_id, field_name="business_id")
    _validate_text(platform, field_name="platform")
    _validate_text(caption, field_name="caption")

    return {
        "business_id": business_id.strip(),
        "marketing_data": {
            "platform": platform.strip(),
            "caption": caption.strip(),
            "campaign_name": _optional_text(campaign_name),
            "product_id": _optional_text(product_id),
        },
        "session_id": _optional_text(session_id),
    }


def extract_marketing_records(response: Mapping[str, Any]) -> list[dict[str, Any]]:
    """Extract marketing records."""

    if not response.get("success"):
        return []

    data = response.get("data", {})
    if not isinstance(data, Mapping):
        return []

    records = data.get("marketing_records") or data.get("marketing_history")
    if isinstance(records, list):
        return list(records)

    return []


def render_page(api_client: Any | None = None) -> None:
    """Render marketing page."""

    st = _get_streamlit()
    st.set_page_config(page_title="Marketing", page_icon="📣", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)

    business_id = st.session_state.get("business_id", "")
    session_id = st.session_state.get("session_id", "")

    tab_context, tab_record, tab_history = st.tabs(
        ["Product Context", "Save Record", "History"]
    )

    if api_client is None:
        st.info("Hubungkan API client untuk fitur marketing.")
        return

    with tab_context:
        product_id = st.text_input("Product ID")
        if st.button("Build Marketing Context"):
            payload = build_marketing_context_payload(
                product_id=product_id,
                business_id=business_id,
                session_id=session_id,
            )
            response = api_client.get_marketing_context(payload)
            if response.get("success"):
                st.json(response.get("data", {}))
            else:
                st.error(_error_message(response))

    with tab_record:
        with st.form("marketing_record_form"):
            platform = st.text_input("Platform", value="Instagram")
            campaign_name = st.text_input("Campaign Name")
            caption = st.text_area("Caption")
            submitted = st.form_submit_button("Save Marketing Record")

        if submitted:
            payload = build_marketing_record_payload(
                business_id=business_id,
                platform=platform,
                caption=caption,
                campaign_name=campaign_name,
                session_id=session_id,
            )
            response = api_client.create_marketing_record(payload)
            if response.get("success"):
                st.success("Marketing record saved.")
                st.json(response.get("data", {}))
            else:
                st.error(_error_message(response))

    with tab_history:
        keyword = st.text_input("Keyword")
        limit = st.number_input("History Limit", min_value=1, value=100, step=10)
        if st.button("Load Marketing History"):
            response = api_client.get_marketing_history(
                business_id=business_id,
                keyword=keyword or None,
                limit=int(limit),
            )
            if response.get("success"):
                st.json(extract_marketing_records(response))
            else:
                st.error(_error_message(response))


def _error_message(response: Mapping[str, Any]) -> str:
    """Return error message."""

    error = response.get("error")
    if isinstance(error, Mapping):
        return str(error.get("message", "Marketing request failed."))

    return "Marketing request failed."


def _get_streamlit() -> Any:
    """Import Streamlit lazily."""

    import streamlit as st

    return st


def _validate_text(value: Any, *, field_name: str) -> None:
    """Validate required text."""

    if value is None or not str(value).strip():
        raise ValueError(f"{field_name} is required.")


def _optional_text(value: str | None) -> str | None:
    """Normalize optional text."""

    if value is None:
        return None

    text = str(value).strip()

    return text or None


if __name__ == "__main__":
    render_page()
