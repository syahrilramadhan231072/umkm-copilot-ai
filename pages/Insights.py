"""
Insights Page
=============

Streamlit insights page for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.frontend.assets import load_frontend_assets

PAGE_NAME = "insights"


def build_insight_context_payload(
    *,
    business_id: str,
    limit: int = 100,
    session_id: str | None = None,
) -> dict[str, Any]:
    """Build insight context payload."""

    _validate_text(business_id, field_name="business_id")
    _validate_positive_int(limit, field_name="limit")

    return {
        "business_id": business_id.strip(),
        "limit": limit,
        "session_id": _optional_text(session_id),
    }


def build_create_insight_payload(
    *,
    business_id: str,
    title: str,
    insight_category: str,
    content: str,
    priority: str = "medium",
    session_id: str | None = None,
) -> dict[str, Any]:
    """Build create insight payload."""

    _validate_text(business_id, field_name="business_id")
    _validate_text(title, field_name="title")
    _validate_text(insight_category, field_name="insight_category")
    _validate_text(content, field_name="content")
    _validate_text(priority, field_name="priority")

    return {
        "business_id": business_id.strip(),
        "insight_data": {
            "title": title.strip(),
            "insight_category": insight_category.strip(),
            "content": content.strip(),
            "priority": priority.strip(),
        },
        "session_id": _optional_text(session_id),
    }


def extract_insights(response: Mapping[str, Any]) -> list[dict[str, Any]]:
    """Extract insight records from API response."""

    if not response.get("success"):
        return []

    data = response.get("data", {})
    if not isinstance(data, Mapping):
        return []

    insights = data.get("insights") or data.get("recent_insights")
    if isinstance(insights, list):
        return list(insights)

    context = data.get("insight_context")
    if isinstance(context, Mapping):
        context_insights = context.get("recent_insights")
        if isinstance(context_insights, list):
            return list(context_insights)

    return []


def render_page(api_client: Any | None = None) -> None:
    """Render insights page."""

    st = _get_streamlit()
    st.set_page_config(page_title="Insights", page_icon="💡", layout="wide")
    load_frontend_assets(st, page_name=PAGE_NAME)

    business_id = st.session_state.get("business_id", "")
    session_id = st.session_state.get("session_id", "")

    business_id = st.text_input("Business ID", value=business_id)
    limit = st.number_input("Limit", min_value=1, value=100, step=10)

    if api_client is None:
        st.info("Hubungkan API client untuk memuat insight.")
        return

    if st.button("Load Insight Context"):
        payload = build_insight_context_payload(
            business_id=business_id,
            limit=int(limit),
            session_id=session_id,
        )
        response = api_client.get_insight_context(payload)
        if response.get("success"):
            st.json(response.get("data", {}))
        else:
            st.error(_error_message(response))

    with st.form("create_insight_form"):
        title = st.text_input("Title")
        category = st.text_input("Category", value="general")
        priority = st.selectbox("Priority", ["low", "medium", "high"])
        content = st.text_area("Content")
        submitted = st.form_submit_button("Save Insight")

    if submitted:
        payload = build_create_insight_payload(
            business_id=business_id,
            title=title,
            insight_category=category,
            content=content,
            priority=str(priority),
            session_id=session_id,
        )
        response = api_client.create_insight(payload)
        if response.get("success"):
            st.success("Insight saved.")
            st.json(response.get("data", {}))
        else:
            st.error(_error_message(response))


def _error_message(response: Mapping[str, Any]) -> str:
    """Return error message."""

    error = response.get("error")
    if isinstance(error, Mapping):
        return str(error.get("message", "Insight request failed."))

    return "Insight request failed."


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
