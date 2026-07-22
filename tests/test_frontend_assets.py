"""
Frontend Assets Tests
=====================

Pytest tests for frontend asset loader.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from pathlib import Path

import pytest

from app.frontend.assets import (
    build_style_tag,
    get_html_partial_path,
    load_custom_css,
    load_frontend_assets,
    load_html_partial,
    read_text_asset,
    validate_page_name,
)


class FakeStreamlit:
    """Fake Streamlit object for asset loader tests."""

    def __init__(self) -> None:
        """Initialize fake Streamlit."""

        self.markdown_calls: list[dict[str, object]] = []
        self.warnings: list[str] = []

    def markdown(self, body: str, unsafe_allow_html: bool = False) -> None:
        """Capture markdown calls."""

        self.markdown_calls.append(
            {
                "body": body,
                "unsafe_allow_html": unsafe_allow_html,
            }
        )

    def warning(self, message: str) -> None:
        """Capture warning calls."""

        self.warnings.append(message)


def test_read_text_asset_reads_file(tmp_path: Path) -> None:
    """Assert text asset is read."""

    file_path = tmp_path / "asset.html"
    file_path.write_text("<div>Hello</div>", encoding="utf-8")

    assert read_text_asset(file_path) == "<div>Hello</div>"


def test_build_style_tag_wraps_css() -> None:
    """Assert CSS is wrapped in style tag."""

    style_tag = build_style_tag(".class { color: red; }")

    assert style_tag.startswith("<style>")
    assert ".class" in style_tag
    assert style_tag.endswith("</style>")


def test_load_custom_css_calls_streamlit_markdown(tmp_path: Path) -> None:
    """Assert CSS loader calls st.markdown."""

    css_path = tmp_path / "style.css"
    css_path.write_text(".x { color: blue; }", encoding="utf-8")
    st = FakeStreamlit()

    loaded = load_custom_css(st, css_path)

    assert loaded is True
    assert len(st.markdown_calls) == 1
    assert st.markdown_calls[0]["unsafe_allow_html"] is True
    assert "<style>" in str(st.markdown_calls[0]["body"])


def test_load_html_partial_calls_streamlit_markdown(tmp_path: Path) -> None:
    """Assert HTML partial loader calls st.markdown."""

    partial_dir = tmp_path / "partials"
    partial_dir.mkdir()
    (partial_dir / "dashboard.html").write_text(
        '<section class="hero">Dashboard</section>',
        encoding="utf-8",
    )
    st = FakeStreamlit()

    loaded = load_html_partial(st, "dashboard", partial_dir=partial_dir)

    assert loaded is True
    assert len(st.markdown_calls) == 1
    assert "Dashboard" in str(st.markdown_calls[0]["body"])


def test_load_frontend_assets_loads_css_and_html(tmp_path: Path) -> None:
    """Assert combined asset loader loads CSS and HTML."""

    css_path = tmp_path / "style.css"
    css_path.write_text(".x { color: blue; }", encoding="utf-8")

    partial_dir = tmp_path / "partials"
    partial_dir.mkdir()
    (partial_dir / "dashboard.html").write_text("<section>Dashboard</section>", encoding="utf-8")

    st = FakeStreamlit()
    status = load_frontend_assets(
        st,
        page_name="dashboard",
        css_path=css_path,
        partial_dir=partial_dir,
    )

    assert status == {
        "css_loaded": True,
        "html_loaded": True,
    }
    assert len(st.markdown_calls) == 2


def test_load_frontend_assets_returns_false_for_missing_assets(tmp_path: Path) -> None:
    """Assert missing assets return false without raising."""

    st = FakeStreamlit()
    status = load_frontend_assets(
        st,
        page_name="dashboard",
        css_path=tmp_path / "missing.css",
        partial_dir=tmp_path / "partials",
        show_warning=True,
    )

    assert status == {
        "css_loaded": False,
        "html_loaded": False,
    }
    assert len(st.warnings) == 2


def test_get_html_partial_path_uses_safe_page_name() -> None:
    """Assert HTML partial path is built from page name."""

    path = get_html_partial_path("dashboard", "frontend/html/partials")

    assert str(path).replace("\\", "/") == "frontend/html/partials/dashboard.html"


def test_validate_page_name_rejects_unsafe_name() -> None:
    """Assert unsafe page name is rejected."""

    with pytest.raises(ValueError):
        validate_page_name("../dashboard")
