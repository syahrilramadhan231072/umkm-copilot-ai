"""
Frontend Assets
===============

Reusable HTML and CSS asset loader for the Streamlit frontend layer.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from pathlib import Path
from typing import Any

DEFAULT_CSS_PATH = "frontend/css/streamlit_custom.css"
DEFAULT_HTML_PARTIAL_DIR = "frontend/html/partials"


def read_text_asset(path: str | Path) -> str:
    """
    Read text asset from disk.

    Args:
        path: Asset path.

    Returns:
        Asset text.

    Raises:
        FileNotFoundError: If asset file does not exist.
        ValueError: If path is not a file.
    """

    asset_path = Path(path)

    if not asset_path.exists():
        raise FileNotFoundError(f"Asset file not found: {asset_path}")

    if not asset_path.is_file():
        raise ValueError(f"Asset path is not a file: {asset_path}")

    return asset_path.read_text(encoding="utf-8")


def build_style_tag(css: str) -> str:
    """
    Build HTML style tag from CSS text.

    Args:
        css: CSS text.

    Returns:
        HTML style tag.
    """

    if not isinstance(css, str) or not css.strip():
        raise ValueError("css is required.")

    return f"<style>\n{css.strip()}\n</style>"


def load_custom_css(
    st: Any,
    css_path: str | Path = DEFAULT_CSS_PATH,
    *,
    show_warning: bool = True,
) -> bool:
    """
    Load custom CSS into Streamlit.

    Args:
        st: Streamlit module.
        css_path: CSS path.
        show_warning: Whether warning should be shown when file is missing.

    Returns:
        True when CSS is loaded, otherwise False.
    """

    try:
        css = read_text_asset(css_path)
    except FileNotFoundError:
        if show_warning:
            st.warning(f"Custom CSS file not found: {css_path}")
        return False

    st.markdown(build_style_tag(css), unsafe_allow_html=True)

    return True


def get_html_partial_path(
    page_name: str,
    partial_dir: str | Path = DEFAULT_HTML_PARTIAL_DIR,
) -> Path:
    """
    Build HTML partial path for a page.

    Args:
        page_name: Page name.
        partial_dir: Partial directory.

    Returns:
        HTML partial path.
    """

    validate_page_name(page_name)

    return Path(partial_dir) / f"{page_name}.html"


def load_html_partial(
    st: Any,
    page_name: str,
    *,
    partial_dir: str | Path = DEFAULT_HTML_PARTIAL_DIR,
    show_warning: bool = False,
) -> bool:
    """
    Load HTML partial into Streamlit.

    Args:
        st: Streamlit module.
        page_name: Page name.
        partial_dir: Partial directory.
        show_warning: Whether warning should be shown when file is missing.

    Returns:
        True when HTML partial is loaded, otherwise False.
    """

    partial_path = get_html_partial_path(page_name, partial_dir)

    try:
        html = read_text_asset(partial_path)
    except FileNotFoundError:
        if show_warning:
            st.warning(f"HTML partial not found: {partial_path}")
        return False

    st.markdown(html, unsafe_allow_html=True)

    return True


def load_frontend_assets(
    st: Any,
    *,
    page_name: str,
    css_path: str | Path = DEFAULT_CSS_PATH,
    partial_dir: str | Path = DEFAULT_HTML_PARTIAL_DIR,
    show_warning: bool = False,
) -> dict[str, bool]:
    """
    Load CSS and HTML partial for a Streamlit page.

    Args:
        st: Streamlit module.
        page_name: Page name.
        css_path: CSS path.
        partial_dir: HTML partial directory.
        show_warning: Whether missing asset warnings should be shown.

    Returns:
        Asset loading status.
    """

    css_loaded = load_custom_css(
        st,
        css_path=css_path,
        show_warning=show_warning,
    )
    html_loaded = load_html_partial(
        st,
        page_name=page_name,
        partial_dir=partial_dir,
        show_warning=show_warning,
    )

    return {
        "css_loaded": css_loaded,
        "html_loaded": html_loaded,
    }


def validate_page_name(page_name: str) -> None:
    """
    Validate page name for HTML partial loading.

    Args:
        page_name: Page name.

    Raises:
        ValueError: If page name is invalid.
    """

    if not isinstance(page_name, str) or not page_name.strip():
        raise ValueError("page_name is required.")

    safe_name = page_name.strip()

    if "/" in safe_name or "\\" in safe_name or ".." in safe_name:
        raise ValueError("page_name must be a safe file stem.")
