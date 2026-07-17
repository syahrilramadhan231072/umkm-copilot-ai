"""
Komponen UI Frontend
====================
"""

from __future__ import annotations

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

    st.markdown(
        f"""
        <section class="umkm-page-hero">
          <p class="umkm-page-hero__eyebrow">{eyebrow}</p>
          <h1 class="umkm-page-hero__title">{title}</h1>
          <p class="umkm-page-hero__description">{description}</p>
        </section>
        """,
        unsafe_allow_html=True,
    )


def render_business_header(st: Any, preferences: dict[str, str]) -> None:
    """Render ringkasan profil bisnis."""

    business_name = preferences.get("business_name") or "Bisnis Anda"
    business_type = preferences.get("business_type") or "Jenis usaha belum diisi"
    currency = preferences.get("currency") or "IDR"

    st.markdown(f"### {business_name}")
    st.caption(f"{business_type} · Mata uang {currency}")


def render_progress_indicator(st: Any, state: OnboardingState) -> None:
    """Render indikator progres."""

    current_step = get_current_step_number(state)
    progress = min(max(state.completion_percent, 0), 100)

    st.progress(progress, text=f"Langkah {current_step} dari 4")

    labels = ["Profil Bisnis", "Produk", "Transaksi Pertama", "Dashboard"]
    columns = st.columns(4)

    for index, label in enumerate(labels, start=1):
        with columns[index - 1]:
            if index < current_step:
                st.success(f"✓ {label}")
            elif index == current_step:
                st.info(f"• {label}")
            else:
                st.caption(label)


def render_locked_page(
    st: Any,
    *,
    message: str,
    state: OnboardingState,
    next_action_label: str,
    next_page: str,
) -> None:
    """Render halaman terkunci dengan arahan sederhana."""

    st.warning(message)
    render_progress_indicator(st, state)

    if st.button(next_action_label, type="primary"):
        switch_page(st, next_page)


def render_response_table(st: Any, data: Any) -> None:
    """Render data response tanpa JSON mentah."""

    if isinstance(data, list):
        st.dataframe(data, use_container_width=True, hide_index=True)
        return

    if isinstance(data, dict):
        rows = [
            {"Informasi": _humanize(str(key)), "Nilai": value}
            for key, value in data.items()
        ]
        st.dataframe(rows, use_container_width=True, hide_index=True)
        return

    if data is not None:
        st.write(str(data))


def error_message(response: dict[str, Any]) -> str:
    """Ambil pesan error yang ramah pengguna."""

    error = response.get("error")
    if isinstance(error, dict):
        message = error.get("message") or error.get("detail")
        if message:
            return str(message)

    detail = response.get("detail")
    if detail:
        return str(detail)

    return "Permintaan belum berhasil."


def _humanize(value: str) -> str:
    """Humanize key."""

    return value.replace("_", " ").replace("-", " ").title()
