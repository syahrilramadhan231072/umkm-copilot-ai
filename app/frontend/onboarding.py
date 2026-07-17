"""
Status Onboarding
=================
"""

from __future__ import annotations

from dataclasses import dataclass
from decimal import Decimal, InvalidOperation
from typing import Any, Mapping
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
    """Bangun status onboarding."""

    business_profile_ready = is_valid_uuid(business_id)
    product_ready = bool(str(product_id).strip())
    has_transactions = _has_transactions_from_dashboard(dashboard_response)
    dashboard_ready = business_profile_ready and product_ready and has_transactions

    if not business_profile_ready:
        next_step = "business_profile"
    elif not product_ready:
        next_step = "products"
    elif not has_transactions:
        next_step = "first_transaction"
    else:
        next_step = "dashboard"

    completed_steps = (
        int(business_profile_ready)
        + int(product_ready)
        + int(has_transactions)
    )
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


def _has_transactions_from_dashboard(
    dashboard_response: Mapping[str, Any] | None,
) -> bool:
    """Deteksi transaksi dari response dashboard."""

    if not dashboard_response or not dashboard_response.get("success"):
        return False

    data = dashboard_response.get("data")
    if not isinstance(data, Mapping):
        return False

    sales_summary = data.get("sales_summary")
    if isinstance(sales_summary, Mapping):
        return _mapping_has_positive_value(
            sales_summary,
            keywords=("transaction", "revenue", "sales", "quantity", "order", "total"),
        )

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
