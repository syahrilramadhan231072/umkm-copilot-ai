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


def build_style_tag(css: str) -> str:
    """Wrap CSS string in a style tag."""

    return f"<style>{css}</style>"


def validate_page_name(page_name: str) -> str:
    """Validate page name before building a partial path."""

    if not isinstance(page_name, str) or not page_name.strip():
        raise ValueError("page_name wajib diisi.")

    safe_name = page_name.strip().lower().replace(" ", "_")

    if ".." in safe_name or "/" in safe_name or "\\" in safe_name:
        raise ValueError("page_name tidak aman.")

    return safe_name


def load_custom_css(st: Any, css_path: Path = CSS_PATH) -> bool:
    """Muat CSS kustom."""

    css = read_text_asset(css_path)
    if not css:
        return False

    st.markdown(build_style_tag(css), unsafe_allow_html=True)
    return True


def get_html_partial_path(
    page_name: str,
    partial_dir: Path | str = HTML_PARTIALS_ROOT,
) -> Path:
    """Ambil path HTML partial."""

    return Path(partial_dir) / f"{validate_page_name(page_name)}.html"


def load_html_partial(
    st: Any,
    page_name: str,
    *,
    partial_dir: Path | str = HTML_PARTIALS_ROOT,
) -> bool:
    """Muat HTML partial bila tersedia."""

    html = read_text_asset(get_html_partial_path(page_name, partial_dir))
    if not html:
        return False

    st.markdown(html, unsafe_allow_html=True)
    return True


def load_frontend_assets(
    st: Any,
    *,
    page_name: str,
    css_path: Path = CSS_PATH,
    partial_dir: Path | str = HTML_PARTIALS_ROOT,
    show_warning: bool = False,
) -> dict[str, bool]:
    """Muat semua aset frontend untuk halaman."""

    css_loaded = load_custom_css(st, css_path)
    html_loaded = load_html_partial(st, page_name, partial_dir=partial_dir)

    if show_warning and not css_loaded:
        st.warning(f"CSS asset tidak ditemukan: {css_path}")

    if show_warning and not html_loaded:
        st.warning(f"HTML partial tidak ditemukan untuk halaman: {page_name}")

    return {
        "css_loaded": css_loaded,
        "html_loaded": html_loaded,
    }
