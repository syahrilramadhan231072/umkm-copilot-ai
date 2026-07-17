"""
Aset Frontend
=============

Helper pemuatan CSS dan HTML partial untuk Streamlit.
"""

from __future__ import annotations

from pathlib import Path
from typing import Any


PROJECT_ROOT = Path(__file__).resolve().parents[2]
FRONTEND_ROOT = PROJECT_ROOT / "frontend"
CSS_PATH = FRONTEND_ROOT / "css" / "streamlit_custom.css"
HTML_PARTIALS_ROOT = FRONTEND_ROOT / "html" / "partials"


def read_text_asset(path: Path) -> str:
    """Baca aset teks."""

    if not path.exists():
        return ""

    return path.read_text(encoding="utf-8")


def load_custom_css(st: Any) -> None:
    """Muat CSS kustom."""

    css = read_text_asset(CSS_PATH)
    if css:
        st.markdown(f"<style>{css}</style>", unsafe_allow_html=True)


def get_html_partial_path(page_name: str) -> Path:
    """Ambil path HTML partial."""

    safe_name = page_name.strip().lower().replace(" ", "_")

    return HTML_PARTIALS_ROOT / f"{safe_name}.html"


def load_html_partial(st: Any, page_name: str) -> None:
    """Muat HTML partial bila tersedia."""

    html = read_text_asset(get_html_partial_path(page_name))
    if html:
        st.markdown(html, unsafe_allow_html=True)


def load_frontend_assets(st: Any, *, page_name: str) -> None:
    """Muat semua aset frontend untuk halaman."""

    load_custom_css(st)
    load_html_partial(st, page_name)
