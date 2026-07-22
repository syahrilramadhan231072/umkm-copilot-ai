"""Runtime customisation for Go-UMKM AI.

This module is imported automatically by Python when available on sys.path.
It patches Streamlit's static index.html so the Dicoding verification meta tag
is present in the HTML head before the Streamlit server serves the page.
"""

from __future__ import annotations

from pathlib import Path

DICODING_META_TAG = '<meta name="dicoding:email" content="syahril231072@gmail.com">'


def _patch_streamlit_index() -> None:
    """Add Dicoding verification meta tag to Streamlit index.html."""

    try:
        import streamlit
    except Exception:
        return

    streamlit_root = Path(streamlit.__file__).resolve().parent
    index_path = streamlit_root / "static" / "index.html"

    if not index_path.exists():
        return

    content = index_path.read_text(encoding="utf-8")

    if "dicoding:email" in content:
        return

    if "</head>" not in content:
        return

    patched = content.replace(
        "</head>",
        f"    {DICODING_META_TAG}\n  </head>",
        1,
    )

    index_path.write_text(patched, encoding="utf-8")


_patch_streamlit_index()
