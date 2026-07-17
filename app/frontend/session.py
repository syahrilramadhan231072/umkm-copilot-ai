"""
Session Frontend
================

Helper session state untuk Streamlit.
"""

from __future__ import annotations

from typing import Any, MutableMapping

from app.frontend.api_client import FrontendApiClient


DEFAULT_API_BASE_URL = "http://127.0.0.1:8000"
DEFAULT_BUSINESS_ID = ""
DEFAULT_SESSION_ID = "sesi-utama"
DEFAULT_LIMIT = 1000
DEFAULT_CURRENCY = "IDR"
DEFAULT_TIMEZONE = "Asia/Jakarta"
DEFAULT_LANGUAGE = "Bahasa Indonesia"
DEFAULT_PRODUCT_ID = ""


def ensure_frontend_session(session_state: MutableMapping[str, Any]) -> None:
    """Pastikan semua kunci session tersedia."""

    session_state.setdefault("api_base_url", DEFAULT_API_BASE_URL)
    session_state.setdefault("business_id", DEFAULT_BUSINESS_ID)
    session_state.setdefault("session_id", DEFAULT_SESSION_ID)
    session_state.setdefault("dashboard_limit", DEFAULT_LIMIT)
    session_state.setdefault("business_name", "")
    session_state.setdefault("owner_name", "")
    session_state.setdefault("business_type", "")
    session_state.setdefault("currency", DEFAULT_CURRENCY)
    session_state.setdefault("timezone", DEFAULT_TIMEZONE)
    session_state.setdefault("language", DEFAULT_LANGUAGE)
    session_state.setdefault("active_product_id", DEFAULT_PRODUCT_ID)
    session_state.setdefault("active_product_name", "")
    session_state.setdefault("backend_products", [])


def get_api_client_from_session_state(
    session_state: MutableMapping[str, Any],
) -> FrontendApiClient:
    """Bangun API client dari session state."""

    ensure_frontend_session(session_state)

    return FrontendApiClient(api_base_url=str(session_state["api_base_url"]))


def has_business_profile(session_state: MutableMapping[str, Any]) -> bool:
    """Periksa apakah profil bisnis aktif sudah tersedia."""

    ensure_frontend_session(session_state)

    return bool(str(session_state.get("business_id", "")).strip())


def has_active_product(session_state: MutableMapping[str, Any]) -> bool:
    """Periksa apakah produk aktif sudah tersedia."""

    ensure_frontend_session(session_state)

    return bool(str(session_state.get("active_product_id", "")).strip())


def build_business_preferences(
    session_state: MutableMapping[str, Any],
) -> dict[str, str]:
    """Bangun preferensi bisnis aktif."""

    ensure_frontend_session(session_state)

    return {
        "business_id": str(session_state.get("business_id", "")).strip(),
        "business_name": str(session_state.get("business_name", "")).strip(),
        "owner_name": str(session_state.get("owner_name", "")).strip(),
        "business_type": str(session_state.get("business_type", "")).strip(),
        "currency": str(session_state.get("currency", DEFAULT_CURRENCY)).strip(),
        "timezone": str(session_state.get("timezone", DEFAULT_TIMEZONE)).strip(),
        "language": str(session_state.get("language", DEFAULT_LANGUAGE)).strip(),
    }


def set_business_from_response(
    session_state: MutableMapping[str, Any],
    data: dict[str, Any],
) -> None:
    """Simpan profil bisnis dari response backend."""

    ensure_frontend_session(session_state)

    session_state["business_id"] = str(data.get("business_id", "")).strip()
    session_state["business_name"] = str(data.get("business_name", "")).strip()
    session_state["owner_name"] = str(data.get("owner_name", "")).strip()
    session_state["business_type"] = str(data.get("business_type", "")).strip()
    session_state["currency"] = str(data.get("currency", DEFAULT_CURRENCY)).strip()
    session_state["timezone"] = str(data.get("timezone", DEFAULT_TIMEZONE)).strip()
    session_state["language"] = str(data.get("language", DEFAULT_LANGUAGE)).strip()


def set_active_product_from_response(
    session_state: MutableMapping[str, Any],
    data: dict[str, Any],
) -> None:
    """Simpan produk aktif dari response backend."""

    ensure_frontend_session(session_state)

    product_id = str(data.get("product_id", "")).strip()
    product_name = str(data.get("name", "")).strip()

    session_state["active_product_id"] = product_id
    session_state["active_product_name"] = product_name


def set_backend_products(
    session_state: MutableMapping[str, Any],
    products: list[dict[str, Any]],
) -> None:
    """Simpan daftar produk backend."""

    ensure_frontend_session(session_state)
    session_state["backend_products"] = products


def get_backend_products(
    session_state: MutableMapping[str, Any],
) -> list[dict[str, Any]]:
    """Ambil daftar produk backend."""

    ensure_frontend_session(session_state)
    products = session_state.get("backend_products", [])

    if isinstance(products, list):
        return [dict(product) for product in products if isinstance(product, dict)]

    return []


def build_common_payload(
    session_state: MutableMapping[str, Any],
    extra: dict[str, Any] | None = None,
) -> dict[str, Any]:
    """Bangun payload umum untuk endpoint yang membutuhkan konteks bisnis."""

    ensure_frontend_session(session_state)

    payload = {
        "business_id": str(session_state["business_id"]),
        "session_id": str(session_state["session_id"]),
    }

    if extra:
        payload.update(extra)

    return payload
