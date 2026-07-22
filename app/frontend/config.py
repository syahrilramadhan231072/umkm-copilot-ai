"""
Frontend Configuration
======================

Streamlit deployment configuration helpers.

Priority:
1. Streamlit Secrets
2. Environment Variables
3. Local development fallback
"""

from __future__ import annotations

import os
from collections.abc import Mapping

DEFAULT_LOCAL_API_BASE_URL = "http://localhost:8000"
API_BASE_URL_KEYS = (
    "GO_UMKM_API_BASE_URL",
    "BACKEND_API_URL",
    "API_BASE_URL",
)


def get_frontend_api_base_url() -> str:
    """Return backend API base URL for the Streamlit frontend."""

    from_secrets = _get_from_streamlit_secrets()
    if from_secrets:
        return _normalize_base_url(from_secrets)

    for key in API_BASE_URL_KEYS:
        value = os.getenv(key)
        if value and value.strip():
            return _normalize_base_url(value)

    return DEFAULT_LOCAL_API_BASE_URL


def _get_from_streamlit_secrets() -> str:
    """Read API base URL from Streamlit secrets when available."""

    try:
        import streamlit as st

        secrets = st.secrets
    except Exception:
        return ""

    for key in API_BASE_URL_KEYS:
        try:
            value = secrets.get(key)
        except Exception:
            value = None

        if isinstance(value, str) and value.strip():
            return value.strip()

    try:
        api_section = secrets.get("api")
    except Exception:
        api_section = None

    if isinstance(api_section, Mapping):
        value = api_section.get("base_url")
        if isinstance(value, str) and value.strip():
            return value.strip()

    return ""


def _normalize_base_url(value: str) -> str:
    """Normalize API base URL."""

    if not isinstance(value, str) or not value.strip():
        return DEFAULT_LOCAL_API_BASE_URL

    return value.strip().rstrip("/")
