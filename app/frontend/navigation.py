"""
Navigasi Frontend
=================
"""

from __future__ import annotations

from typing import Any

from app.frontend.onboarding import OnboardingState


def render_navigation(st: Any, state: OnboardingState) -> None:
    """Render navigasi sidebar adaptif."""

    with st.sidebar:
        st.markdown("## UMKM Copilot AI")
        st.caption("Copilot bisnis untuk pelaku UMKM")

        if state.dashboard_ready:
            _render_full_navigation(st)
        else:
            _render_onboarding_navigation(st, state)


def _render_onboarding_navigation(st: Any, state: OnboardingState) -> None:
    """Render navigasi onboarding."""

    st.markdown("### Penyiapan")
    _page_button(st, "Beranda", "app.py", primary=True)
    _page_button(st, "Profil Bisnis", "pages/Business_Profile.py")
    _page_button(st, "Produk", "pages/Products.py", disabled=not state.business_profile_ready)
    _page_button(
        st,
        "Transaksi Pertama",
        "pages/First_Transaction.py",
        disabled=not state.product_ready,
    )
    _page_button(st, "Pengaturan", "pages/Settings.py")


def _render_full_navigation(st: Any) -> None:
    """Render navigasi aplikasi penuh."""

    st.markdown("### Aplikasi")
    _page_button(st, "Dashboard", "pages/Dashboard.py", primary=True)
    _page_button(st, "Asisten AI", "pages/AI_Assistant.py")
    _page_button(st, "Transaksi", "pages/Transactions.py")
    _page_button(st, "Pemasaran", "pages/Marketing.py")
    _page_button(st, "Rekomendasi", "pages/Insights.py")
    _page_button(st, "Unduh Laporan", "pages/Export.py")
    _page_button(st, "Pengaturan", "pages/Settings.py")


def _page_button(
    st: Any,
    label: str,
    page_path: str,
    *,
    primary: bool = False,
    disabled: bool = False,
) -> None:
    """Render tombol navigasi."""

    button_type = "primary" if primary else "secondary"

    if st.button(
        label,
        type=button_type,
        use_container_width=True,
        disabled=disabled,
    ):
        switch_page(st, page_path)


def switch_page(st: Any, page_path: str) -> None:
    """Pindah halaman jika Streamlit mendukung."""

    if hasattr(st, "switch_page"):
        st.switch_page(page_path)
    else:
        st.info("Gunakan menu di samping untuk berpindah halaman.")
