"""
Status Onboarding
=================
"""

from __future__ import annotations

from collections.abc import Mapping
from dataclasses import dataclass
from decimal import Decimal, InvalidOperation
from typing import Any
from uuid import UUID


@dataclass(frozen=True)
class OnboardingState:
    """Status perjalanan onboarding."""

    business_profile_ready: bool
    product_ready: bool
    has_transactions: bool
    dashboard_ready: bool
    ai_ready: bool
    marketing_ready: bool
    insights_ready: bool
    next_step: str
    completion_percent: int


def build_onboarding_state(
    *,
    business_id: str,
    product_id: str,
    dashboard_response: Mapping[str, Any] | None = None,
) -> OnboardingState:
    """
    Bangun status onboarding.

    Backend dashboard menjadi sumber validasi tambahan agar frontend tidak
    berhenti hanya karena session_state kehilangan active_product_id.
    """

    business_profile_ready = is_valid_uuid(business_id)
    dashboard_data = _extract_dashboard_data(dashboard_response)

    product_ready = bool(str(product_id).strip()) or _has_products_from_dashboard(dashboard_data)
    has_transactions = _has_transactions_from_dashboard_data(dashboard_data)

    dashboard_ready = business_profile_ready and has_transactions

    if not business_profile_ready:
        next_step = "business_profile"
    elif not product_ready:
        next_step = "products"
    elif not has_transactions:
        next_step = "first_transaction"
    else:
        next_step = "dashboard"

    completed_steps = int(business_profile_ready) + int(product_ready) + int(has_transactions)
    completion_percent = int((completed_steps / 3) * 100)

    return OnboardingState(
        business_profile_ready=business_profile_ready,
        product_ready=product_ready,
        has_transactions=has_transactions,
        dashboard_ready=dashboard_ready,
        ai_ready=dashboard_ready,
        marketing_ready=business_profile_ready and product_ready,
        insights_ready=has_transactions,
        next_step=next_step,
        completion_percent=completion_percent,
    )


def is_valid_uuid(value: str) -> bool:
    """Periksa apakah nilai adalah UUID valid."""

    if not isinstance(value, str) or not value.strip():
        return False

    try:
        UUID(value.strip())
    except (ValueError, AttributeError, TypeError):
        return False

    return True


def get_current_step_number(state: OnboardingState) -> int:
    """Ambil nomor langkah aktif."""

    if not state.business_profile_ready:
        return 1

    if not state.product_ready:
        return 2

    if not state.has_transactions:
        return 3

    return 4


def _extract_dashboard_data(
    dashboard_response: Mapping[str, Any] | None,
) -> Mapping[str, Any]:
    """
    Ambil data dashboard dari beberapa bentuk response backend.

    Bentuk yang didukung:
    - response["data"]["dashboard"]
    - response["data"]
    - response["dashboard"]
    - response langsung sebagai dashboard dict
    """

    if not dashboard_response:
        return {}

    if dashboard_response.get("success") is False:
        return {}

    data = dashboard_response.get("data")

    if isinstance(data, Mapping):
        nested_dashboard = data.get("dashboard")
        if isinstance(nested_dashboard, Mapping):
            return nested_dashboard

        if _looks_like_dashboard(data):
            return data

    direct_dashboard = dashboard_response.get("dashboard")
    if isinstance(direct_dashboard, Mapping):
        return direct_dashboard

    if _looks_like_dashboard(dashboard_response):
        return dashboard_response

    return {}


def _looks_like_dashboard(value: Mapping[str, Any]) -> bool:
    """Periksa apakah mapping terlihat seperti payload dashboard."""

    dashboard_keys = (
        "kpi_cards",
        "sales_summary",
        "inventory_summary",
        "product_summary",
        "customer_summary",
        "top_products_by_revenue",
        "top_products_by_quantity",
    )

    return any(key in value for key in dashboard_keys)


def _has_products_from_dashboard(
    dashboard_data: Mapping[str, Any],
) -> bool:
    """Deteksi produk dari data dashboard backend."""

    if not dashboard_data:
        return False

    product_summary = dashboard_data.get("product_summary")
    if isinstance(product_summary, Mapping):
        if _mapping_has_positive_value(
            product_summary,
            keywords=("product", "active", "total"),
        ):
            return True

    inventory_summary = dashboard_data.get("inventory_summary")
    if isinstance(inventory_summary, Mapping):
        if _mapping_has_positive_value(
            inventory_summary,
            keywords=("inventory", "stock", "item", "unit"),
        ):
            return True

    kpi_cards = dashboard_data.get("kpi_cards")
    if isinstance(kpi_cards, list):
        for card in kpi_cards:
            if not isinstance(card, Mapping):
                continue

            key = str(card.get("key", "")).lower()
            label = str(card.get("label", "")).lower()
            value = card.get("value")

            if "product" in key or "product" in label:
                number = _to_decimal(value)
                if number is not None and number > 0:
                    return True

    return False


def _has_transactions_from_dashboard_data(
    dashboard_data: Mapping[str, Any],
) -> bool:
    """Deteksi transaksi dari data dashboard yang sudah dinormalisasi."""

    if not dashboard_data:
        return False

    sales_summary = dashboard_data.get("sales_summary")
    if isinstance(sales_summary, Mapping):
        return _mapping_has_positive_value(
            sales_summary,
            keywords=(
                "transaction",
                "revenue",
                "sales",
                "quantity",
                "order",
                "total",
            ),
        )

    kpi_cards = dashboard_data.get("kpi_cards")
    if isinstance(kpi_cards, list):
        for card in kpi_cards:
            if not isinstance(card, Mapping):
                continue

            key = str(card.get("key", "")).lower()
            label = str(card.get("label", "")).lower()
            value = card.get("value")

            has_transaction_label = (
                "transaction" in key
                or "transaction" in label
                or "revenue" in key
                or "revenue" in label
            )

            if has_transaction_label:
                number = _to_decimal(value)
                if number is not None and number > 0:
                    return True

    return False


def _mapping_has_positive_value(
    mapping: Mapping[str, Any],
    *,
    keywords: tuple[str, ...],
) -> bool:
    """Cari nilai numerik positif pada mapping."""

    for key, value in mapping.items():
        normalized_key = str(key).lower()

        if any(keyword in normalized_key for keyword in keywords):
            number = _to_decimal(value)
            if number is not None and number > 0:
                return True

        if isinstance(value, Mapping) and _mapping_has_positive_value(
            value,
            keywords=keywords,
        ):
            return True

    return False


def _to_decimal(value: Any) -> Decimal | None:
    """Konversi ke Decimal."""

    if isinstance(value, bool):
        return None

    try:
        return Decimal(str(value))
    except (InvalidOperation, ValueError, TypeError):
        return None
