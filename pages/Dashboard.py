"""
Dashboard Page
==============

Streamlit dashboard page for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any, Mapping

from app.frontend.assets import load_frontend_assets

DEFAULT_BUSINESS_ID = "default-business"
DEFAULT_LIMIT = 1000
PAGE_NAME = "dashboard"


class FrontendApiClientProtocol:
    """Runtime protocol-like documentation for dashboard API client."""

    def get_dashboard(
        self, business_id: str, limit: int = DEFAULT_LIMIT
    ) -> dict[str, Any]:
        """Return dashboard payload."""

    def get_sales_summary(
        self, business_id: str, limit: int = DEFAULT_LIMIT
    ) -> dict[str, Any]:
        """Return sales summary."""

    def get_inventory_summary(
        self, business_id: str, limit: int = DEFAULT_LIMIT
    ) -> dict[str, Any]:
        """Return inventory summary."""


def get_page_config() -> dict[str, Any]:
    """
    Return Streamlit page config.

    Returns:
        Page configuration.
    """

    return {
        "page_title": "UMKM Copilot AI - Dashboard",
        "page_icon": "📊",
        "layout": "wide",
    }


def build_dashboard_request(
    business_id: str,
    limit: int = DEFAULT_LIMIT,
) -> dict[str, Any]:
    """
    Build dashboard request payload.

    Args:
        business_id: Business identifier.
        limit: Maximum records read.

    Returns:
        Request payload.
    """

    _validate_text(business_id, field_name="business_id")
    _validate_positive_int(limit, field_name="limit")

    return {
        "business_id": business_id.strip(),
        "limit": limit,
    }


def extract_dashboard_cards(response: Mapping[str, Any]) -> list[dict[str, Any]]:
    """
    Extract KPI cards from dashboard response.

    Args:
        response: API response.

    Returns:
        KPI cards.
    """

    if not response.get("success"):
        return []

    data = response.get("data", {})
    if not isinstance(data, Mapping):
        return []

    if "kpi_cards" in data and isinstance(data["kpi_cards"], list):
        return list(data["kpi_cards"])

    dashboard = data.get("dashboard")
    if isinstance(dashboard, Mapping) and isinstance(dashboard.get("kpi_cards"), list):
        return list(dashboard["kpi_cards"])

    return []


def extract_alerts(response: Mapping[str, Any]) -> list[dict[str, Any]]:
    """
    Extract dashboard alerts.

    Args:
        response: API response.

    Returns:
        Alert records.
    """

    if not response.get("success"):
        return []

    data = response.get("data", {})
    if not isinstance(data, Mapping):
        return []

    alerts = data.get("alerts")
    if isinstance(alerts, list):
        return list(alerts)

    dashboard = data.get("dashboard")
    if isinstance(dashboard, Mapping) and isinstance(dashboard.get("alerts"), list):
        return list(dashboard["alerts"])

    return []


def get_error_message(response: Mapping[str, Any]) -> str:
    """
    Extract user-facing error message.

    Args:
        response: API response.

    Returns:
        Error message.
    """

    error = response.get("error")
    if isinstance(error, Mapping):
        return str(error.get("message", "Terjadi kesalahan."))

    return "Terjadi kesalahan."


def render_page(api_client: FrontendApiClientProtocol | None = None) -> None:
    """
    Render dashboard page.

    Args:
        api_client: Optional injected API client.
    """

    st = _get_streamlit()
    st.set_page_config(**get_page_config())
    load_frontend_assets(st, page_name=PAGE_NAME)

    business_id = st.session_state.get("business_id", DEFAULT_BUSINESS_ID)
    limit = int(st.session_state.get("dashboard_limit", DEFAULT_LIMIT))

    with st.sidebar:
        st.subheader("Filter")
        business_id = st.text_input("Business ID", value=business_id)
        limit = st.number_input("Limit", min_value=1, value=limit, step=100)

    if api_client is None:
        st.info("Hubungkan API client untuk memuat dashboard.")
        return

    request = build_dashboard_request(business_id, int(limit))
    response = api_client.get_dashboard(**request)

    if not response.get("success"):
        st.error(get_error_message(response))
        return

    cards = extract_dashboard_cards(response)
    if cards:
        columns = st.columns(len(cards))
        for index, card in enumerate(cards):
            with columns[index]:
                st.metric(
                    label=str(card.get("label", card.get("key", "KPI"))),
                    value=card.get("value", 0),
                )

    alerts = extract_alerts(response)
    if alerts:
        st.subheader("Alerts")
        for alert in alerts:
            st.warning(str(alert.get("message", alert)))


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


if __name__ == "__main__":
    render_page()
