"""
Session Frontend
================

Helper session state untuk Streamlit.
"""

from __future__ import annotations

from collections.abc import Mapping, MutableMapping
from typing import Any
from uuid import UUID, uuid4

from app.frontend.api_client import FrontendApiClient
from app.frontend.config import DEFAULT_LOCAL_API_BASE_URL, get_frontend_api_base_url

DEFAULT_API_BASE_URL = DEFAULT_LOCAL_API_BASE_URL
DEFAULT_BUSINESS_ID = ""
DEFAULT_LIMIT = 1000
DEFAULT_CURRENCY = "IDR"
DEFAULT_TIMEZONE = "Asia/Jakarta"
DEFAULT_LANGUAGE = "Bahasa Indonesia"
DEFAULT_PRODUCT_ID = ""


def ensure_frontend_session(session_state: MutableMapping[str, Any]) -> None:
    """Pastikan semua kunci session tersedia."""

    session_state.setdefault("api_base_url", get_frontend_api_base_url())
    session_state.setdefault("business_id", DEFAULT_BUSINESS_ID)
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
    session_state.setdefault("business_profiles", [])
    session_state.setdefault("business_hydration_attempted", False)
    session_state.setdefault("create_new_business_mode", False)
    session_state.setdefault("previous_business_profile", {})
    session_state.setdefault("onboarding_step", "welcome")

    _ensure_valid_session_id(session_state)


def get_api_client_from_session_state(
    session_state: MutableMapping[str, Any],
) -> FrontendApiClient:
    """Bangun API client dari session state."""

    ensure_frontend_session(session_state)
    return FrontendApiClient(api_base_url=str(session_state["api_base_url"]))


def hydrate_business_from_backend(
    session_state: MutableMapping[str, Any],
    client: FrontendApiClient,
    *,
    force: bool = False,
) -> bool:
    """
    Hydrate business aktif dari backend jika session belum memiliki business_id.

    Dalam create_new_business_mode, auto-hydrate dimatikan agar user tidak
    otomatis dikembalikan ke business existing ketika sedang membuat business baru.
    """

    ensure_frontend_session(session_state)

    if bool(session_state.get("create_new_business_mode")) and not force:
        return False

    current_business_id = str(session_state.get("business_id", "")).strip()
    if _is_valid_uuid(current_business_id) and not force:
        return True

    if session_state.get("business_hydration_attempted") is True and not force:
        return _is_valid_uuid(str(session_state.get("business_id", "")).strip())

    session_state["business_hydration_attempted"] = True

    response = client.list_business_profiles(limit=100)
    if not response.get("success"):
        return False

    profiles = extract_business_profiles_from_response(response)
    session_state["business_profiles"] = profiles

    if not profiles:
        return False

    set_business_from_response(session_state, profiles[0])
    return _is_valid_uuid(str(session_state.get("business_id", "")).strip())


def refresh_business_profiles_from_backend(
    session_state: MutableMapping[str, Any],
    client: FrontendApiClient,
) -> list[dict[str, Any]]:
    """Refresh daftar business profiles dari backend."""

    ensure_frontend_session(session_state)

    response = client.list_business_profiles(limit=100)
    if not response.get("success"):
        return get_business_profiles(session_state)

    profiles = extract_business_profiles_from_response(response)
    session_state["business_profiles"] = profiles
    session_state["business_hydration_attempted"] = True

    return profiles


def extract_business_profiles_from_response(
    response: Mapping[str, Any],
) -> list[dict[str, Any]]:
    """Ambil daftar business profile dari berbagai bentuk response backend."""

    data = response.get("data")
    raw_profiles: Any

    if isinstance(data, Mapping):
        raw_profiles = (
            data.get("businesses")
            or data.get("business_profiles")
            or data.get("profiles")
            or data.get("items")
            or []
        )
    elif isinstance(data, list):
        raw_profiles = data
    else:
        raw_profiles = []

    if isinstance(raw_profiles, Mapping):
        raw_profiles = [raw_profiles]

    if not isinstance(raw_profiles, list):
        return []

    profiles: list[dict[str, Any]] = []
    for item in raw_profiles:
        if isinstance(item, Mapping):
            normalized = normalize_business_profile(item)
            if normalized.get("business_id"):
                profiles.append(normalized)

    return profiles


def normalize_business_profile(data: Mapping[str, Any]) -> dict[str, Any]:
    """Normalisasi business profile dari backend."""

    business_id = data.get("business_id") or data.get("id") or data.get("uuid") or ""

    return {
        "business_id": str(business_id).strip(),
        "business_name": str(data.get("business_name") or "").strip(),
        "owner_name": str(data.get("owner_name") or "").strip(),
        "business_type": str(data.get("business_type") or "").strip(),
        "currency": str(data.get("currency") or DEFAULT_CURRENCY).strip(),
        "timezone": str(data.get("timezone") or DEFAULT_TIMEZONE).strip(),
        "language": str(data.get("language") or DEFAULT_LANGUAGE).strip(),
    }


def get_business_profiles(
    session_state: MutableMapping[str, Any],
) -> list[dict[str, Any]]:
    """Ambil daftar business profiles dari session."""

    ensure_frontend_session(session_state)
    profiles = session_state.get("business_profiles", [])

    if isinstance(profiles, list):
        return [dict(profile) for profile in profiles if isinstance(profile, dict)]

    return []


def start_create_new_business_flow(session_state: MutableMapping[str, Any]) -> None:
    """
    Aktifkan mode pembuatan business baru.

    Business aktif saat ini disimpan sebagai previous_business_profile supaya
    user bisa kembali ke Welcome/Dashboard awal tanpa mengetik business baru.
    """

    ensure_frontend_session(session_state)

    current_profile = _current_business_profile(session_state)
    if current_profile.get("business_id"):
        session_state["previous_business_profile"] = current_profile

    clear_active_business(session_state)
    session_state["create_new_business_mode"] = True
    session_state["business_hydration_attempted"] = True
    session_state["onboarding_step"] = "business_profile"


def cancel_create_new_business_flow(session_state: MutableMapping[str, Any]) -> None:
    """
    Batalkan mode pembuatan business baru dan pulihkan business sebelumnya.

    Jika tidak ada previous business, hydration akan diizinkan lagi agar app
    dapat mengambil business existing dari backend.
    """

    ensure_frontend_session(session_state)
    previous_profile = session_state.get("previous_business_profile", {})

    session_state["create_new_business_mode"] = False
    session_state["business_hydration_attempted"] = False
    session_state["onboarding_step"] = "welcome"

    if isinstance(previous_profile, Mapping) and previous_profile.get("business_id"):
        set_business_from_response(session_state, previous_profile)
    else:
        clear_active_business(session_state)


def return_to_welcome(session_state: MutableMapping[str, Any]) -> None:
    """Kembali ke Welcome/Dashboard awal dari langkah onboarding mana pun."""

    ensure_frontend_session(session_state)

    if bool(session_state.get("create_new_business_mode")):
        cancel_create_new_business_flow(session_state)
    else:
        session_state["onboarding_step"] = "welcome"


def set_onboarding_step(
    session_state: MutableMapping[str, Any],
    step: str,
) -> None:
    """Simpan posisi langkah onboarding frontend."""

    ensure_frontend_session(session_state)
    session_state["onboarding_step"] = step


def clear_active_business(session_state: MutableMapping[str, Any]) -> None:
    """Kosongkan business aktif tanpa menghapus daftar business profiles."""

    ensure_frontend_session(session_state)

    session_state["business_id"] = ""
    session_state["business_name"] = ""
    session_state["owner_name"] = ""
    session_state["business_type"] = ""
    session_state["currency"] = DEFAULT_CURRENCY
    session_state["timezone"] = DEFAULT_TIMEZONE
    session_state["language"] = DEFAULT_LANGUAGE
    session_state["active_product_id"] = ""
    session_state["active_product_name"] = ""
    session_state["backend_products"] = []


def has_business_profile(session_state: MutableMapping[str, Any]) -> bool:
    """Periksa apakah profil bisnis aktif sudah tersedia."""

    ensure_frontend_session(session_state)
    return _is_valid_uuid(str(session_state.get("business_id", "")).strip())


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
    data: Mapping[str, Any],
) -> None:
    """Simpan profil bisnis dari response backend."""

    ensure_frontend_session(session_state)
    normalized = normalize_business_profile(data)

    previous_business_id = str(session_state.get("business_id", "")).strip()
    next_business_id = normalized["business_id"]

    session_state["business_id"] = next_business_id
    session_state["business_name"] = normalized["business_name"]
    session_state["owner_name"] = normalized["owner_name"]
    session_state["business_type"] = normalized["business_type"]
    session_state["currency"] = normalized["currency"]
    session_state["timezone"] = normalized["timezone"]
    session_state["language"] = normalized["language"]
    session_state["create_new_business_mode"] = False
    session_state["business_hydration_attempted"] = True

    _upsert_business_profile(session_state, normalized)

    if previous_business_id != next_business_id:
        session_state["active_product_id"] = ""
        session_state["active_product_name"] = ""
        session_state["backend_products"] = []


def set_active_product_from_response(
    session_state: MutableMapping[str, Any],
    data: Mapping[str, Any],
) -> None:
    """Simpan produk aktif dari response backend."""

    ensure_frontend_session(session_state)

    product_id = str(data.get("product_id") or data.get("id") or "").strip()
    product_name = str(data.get("name") or data.get("product_name") or "").strip()

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


def reset_frontend_session_identity(
    session_state: MutableMapping[str, Any],
) -> None:
    """Buat ulang session_id UUID untuk percakapan baru."""

    session_state["session_id"] = _new_session_id()


def _current_business_profile(
    session_state: MutableMapping[str, Any],
) -> dict[str, str]:
    """Ambil snapshot business aktif."""

    return {
        "business_id": str(session_state.get("business_id", "")).strip(),
        "business_name": str(session_state.get("business_name", "")).strip(),
        "owner_name": str(session_state.get("owner_name", "")).strip(),
        "business_type": str(session_state.get("business_type", "")).strip(),
        "currency": str(session_state.get("currency", DEFAULT_CURRENCY)).strip(),
        "timezone": str(session_state.get("timezone", DEFAULT_TIMEZONE)).strip(),
        "language": str(session_state.get("language", DEFAULT_LANGUAGE)).strip(),
    }


def _upsert_business_profile(
    session_state: MutableMapping[str, Any],
    profile: dict[str, Any],
) -> None:
    """Tambahkan atau update business profile pada cache frontend."""

    profiles = get_business_profiles(session_state)
    business_id = str(profile.get("business_id", "")).strip()

    updated = False
    for index, existing in enumerate(profiles):
        if str(existing.get("business_id", "")).strip() == business_id:
            profiles[index] = dict(profile)
            updated = True
            break

    if not updated:
        profiles.append(dict(profile))

    session_state["business_profiles"] = profiles


def _ensure_valid_session_id(session_state: MutableMapping[str, Any]) -> None:
    """Pastikan session_id adalah UUID valid."""

    current_session_id = str(session_state.get("session_id", "")).strip()

    if not _is_valid_uuid(current_session_id):
        session_state["session_id"] = _new_session_id()


def _new_session_id() -> str:
    """Buat UUID baru untuk session percakapan."""

    return str(uuid4())


def _is_valid_uuid(value: str) -> bool:
    """Periksa UUID."""

    if not value:
        return False

    try:
        UUID(value)
    except (TypeError, ValueError):
        return False

    return True
