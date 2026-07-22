"""
Komponen UI Frontend
====================

Reusable Streamlit UI helpers for Go-UMKM AI.

This module is frontend-only. It does not call backend services directly and
does not contain business logic.
"""

from __future__ import annotations

import json
from collections.abc import Mapping, Sequence
from decimal import Decimal, InvalidOperation
from html import escape
from typing import Any

from app.frontend.navigation import switch_page
from app.frontend.onboarding import OnboardingState, get_current_step_number


def render_hero(
    st: Any,
    *,
    eyebrow: str,
    title: str,
    description: str,
) -> None:
    """Render hero section."""

    render_page_header(
        st,
        eyebrow=eyebrow,
        title=title,
        description=description,
    )


def render_page_header(
    st: Any,
    *,
    eyebrow: str,
    title: str,
    description: str,
    icon: str = "✨",
) -> None:
    """Render a production SaaS page header."""

    st.markdown(
        f"""
        <section class="go-page-header">
          <div class="go-page-header__icon">{escape(icon)}</div>
          <div>
            <p class="go-page-header__eyebrow">{escape(eyebrow)}</p>
            <h1>{escape(title)}</h1>
            <p>{escape(description)}</p>
          </div>
        </section>
        """,
        unsafe_allow_html=True,
    )


def render_business_header(st: Any, preferences: Mapping[str, Any]) -> None:
    """Render ringkasan profil bisnis."""

    business_name = safe_text(preferences.get("business_name"), "Bisnis Anda")
    business_type = safe_text(preferences.get("business_type"), "Jenis usaha belum diisi")
    currency = safe_text(preferences.get("currency"), "IDR")

    st.markdown(
        f"""
        <section class="go-business-header">
          <div>
            <span>Active Workspace</span>
            <h2>{escape(business_name)}</h2>
            <p>{escape(business_type)} · Mata uang {escape(currency)}</p>
          </div>
          <div class="go-business-header__badge">Ready</div>
        </section>
        """,
        unsafe_allow_html=True,
    )


def render_progress_indicator(st: Any, state: OnboardingState) -> None:
    """Render indikator progres."""

    current_step = get_current_step_number(state)
    progress = min(max(state.completion_percent, 0), 100)

    st.markdown(
        f"""
        <div class="go-progress-card">
          <div class="go-progress-card__head">
            <strong>Setup Progress</strong>
            <span>Langkah {current_step} dari 4</span>
          </div>
          <div class="go-progress-track">
            <div class="go-progress-fill" style="width: {progress:.0f}%;"></div>
          </div>
        </div>
        """,
        unsafe_allow_html=True,
    )


def render_locked_page(
    st: Any,
    *,
    message: str,
    state: OnboardingState,
    next_action_label: str,
    next_page: str,
) -> None:
    """Render halaman terkunci."""

    render_empty_state(
        st,
        title="Workspace belum siap",
        description=message,
        icon="🔒",
    )
    render_progress_indicator(st, state)

    if st.button(next_action_label, type="primary"):
        switch_page(st, next_page)


def render_metric_card(
    st: Any,
    *,
    label: str,
    value: str,
    caption: str = "",
    icon: str = "📊",
    tone: str = "primary",
) -> None:
    """Render SaaS metric card."""

    st.markdown(
        f"""
        <article class="go-metric-card go-metric-card--{escape(tone)}">
          <div class="go-metric-card__icon">{escape(icon)}</div>
          <div>
            <span>{escape(label)}</span>
            <strong>{escape(value)}</strong>
            <small>{escape(caption)}</small>
          </div>
        </article>
        """,
        unsafe_allow_html=True,
    )


def render_action_card(
    st: Any,
    *,
    title: str,
    description: str,
    icon: str = "✨",
    badge: str = "",
) -> None:
    """Render action/information card."""

    badge_html = f'<span class="go-card-badge">{escape(badge)}</span>' if badge else ""
    st.markdown(
        f"""
        <article class="go-action-card">
          <div class="go-action-card__icon">{escape(icon)}</div>
          {badge_html}
          <h3>{escape(title)}</h3>
          <p>{escape(description)}</p>
        </article>
        """,
        unsafe_allow_html=True,
    )


def render_empty_state(
    st: Any,
    *,
    title: str,
    description: str,
    icon: str = "📭",
) -> None:
    """Render empty state."""

    st.markdown(
        f"""
        <section class="go-empty-state">
          <div class="go-empty-state__icon">{escape(icon)}</div>
          <h3>{escape(title)}</h3>
          <p>{escape(description)}</p>
        </section>
        """,
        unsafe_allow_html=True,
    )


def render_status_badge(
    st: Any,
    *,
    label: str,
    tone: str = "success",
) -> None:
    """Render status badge."""

    st.markdown(
        f'<span class="go-status go-status--{escape(tone)}">{escape(label)}</span>',
        unsafe_allow_html=True,
    )


def render_section_header(
    st: Any,
    *,
    eyebrow: str,
    title: str,
    description: str = "",
) -> None:
    """Render section header."""

    description_html = f"<p>{escape(description)}</p>" if description else ""
    st.markdown(
        f"""
        <div class="go-section-heading">
          <span>{escape(eyebrow)}</span>
          <h2>{escape(title)}</h2>
          {description_html}
        </div>
        """,
        unsafe_allow_html=True,
    )


def render_response_table(st: Any, data: Any) -> None:
    """Render response safely as a user-facing table/card."""

    rows = normalize_table_rows(data)
    if rows:
        st.dataframe(rows, use_container_width=True, hide_index=True)
        return

    if isinstance(data, Mapping):
        for key, value in data.items():
            render_action_card(
                st,
                title=humanize_key(str(key)),
                description=safe_text(value, "-"),
                icon="•",
            )
        return

    st.write(data)


def normalize_table_rows(data: Any) -> list[dict[str, Any]]:
    """Normalize arbitrary list/dict into table rows."""

    if isinstance(data, list):
        rows = [dict(item) for item in data if isinstance(item, Mapping)]
        return rows

    if isinstance(data, Mapping):
        for key in ("items", "records", "results", "data", "transactions", "products"):
            value = data.get(key)
            if isinstance(value, list):
                return [dict(item) for item in value if isinstance(item, Mapping)]

    return []


def response_data(response: Mapping[str, Any] | None) -> dict[str, Any]:
    """Extract data dict from API response."""

    if not isinstance(response, Mapping):
        return {}

    data = response.get("data")
    if isinstance(data, Mapping):
        return dict(data)

    if "success" in response:
        return {}

    return dict(response)


def error_message(response: Mapping[str, Any]) -> str:
    """Ambil pesan error dari response backend."""

    error = response.get("error")

    if isinstance(error, Mapping):
        message = error.get("message") or error.get("detail")
        if isinstance(message, str) and message.strip():
            return _user_safe_error(message)

    message = response.get("message")
    if isinstance(message, str) and message.strip():
        return _user_safe_error(message)

    return "Layanan belum dapat memproses permintaan. Silakan coba beberapa saat lagi."


def _user_safe_error(message: str) -> str:
    """Hide raw provider/server details from user-facing pages."""

    lowered = message.lower()
    technical_markers = (
        "quota",
        "resourceexhausted",
        "generativelanguage",
        "traceback",
        "stack",
        "429",
        "500",
        "502",
        "503",
    )
    if any(marker in lowered for marker in technical_markers):
        return "Layanan sedang sibuk. Silakan coba lagi beberapa saat."

    return message


def safe_text(value: Any, default: str = "") -> str:
    """Convert value to display-safe text."""

    if value is None:
        return default

    if isinstance(value, (str, int, float, Decimal)):
        text = str(value).strip()
        return text if text else default

    if isinstance(value, Mapping):
        return json.dumps(value, ensure_ascii=False, default=str)

    return str(value).strip() or default


def find_numeric(
    data: Mapping[str, Any], keys: Sequence[str], default: Decimal = Decimal("0")
) -> Decimal:
    """Find first numeric value by recursively scanning keys."""

    for key in keys:
        value = _find_key_recursive(data, key)
        number = to_decimal(value)
        if number is not None:
            return number

    return default


def find_items(data: Mapping[str, Any], keys: Sequence[str]) -> list[dict[str, Any]]:
    """Find first list of mapping items by recursively scanning keys."""

    for key in keys:
        value = _find_key_recursive(data, key)
        rows = normalize_table_rows(value)
        if rows:
            return rows

    return []


def _find_key_recursive(value: Any, target_key: str, *, depth: int = 0) -> Any:
    """Find key recursively in nested mappings/lists."""

    if depth > 5:
        return None

    if isinstance(value, Mapping):
        for key, item in value.items():
            if str(key).lower() == target_key.lower():
                return item

        for item in value.values():
            found = _find_key_recursive(item, target_key, depth=depth + 1)
            if found is not None:
                return found

    if isinstance(value, list):
        for item in value:
            found = _find_key_recursive(item, target_key, depth=depth + 1)
            if found is not None:
                return found

    return None


def to_decimal(value: Any) -> Decimal | None:
    """Convert value to Decimal."""

    if isinstance(value, bool):
        return None

    try:
        return Decimal(str(value))
    except (InvalidOperation, ValueError, TypeError):
        return None


def format_currency(value: Any, prefix: str = "Rp") -> str:
    """Format value as Indonesian currency."""

    number = to_decimal(value)
    if number is None:
        return f"{prefix}0"

    return f"{prefix}{number:,.0f}".replace(",", ".")


def format_number(value: Any) -> str:
    """Format numeric value."""

    number = to_decimal(value)
    if number is None:
        return "0"

    return f"{number:,.0f}".replace(",", ".")


def humanize_key(key: str) -> str:
    """Humanize key."""

    return key.replace("_", " ").replace("-", " ").title()
