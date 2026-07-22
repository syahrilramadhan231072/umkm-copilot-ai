"""
Onboarding API Router
=====================

Endpoint minimal untuk menghubungkan onboarding frontend dengan backend.

Layering:
Frontend -> FastAPI Router -> Service/Repository -> Supabase

Catatan:
- Router ini tidak mengubah database schema.
- Router ini memakai service/repository yang sudah tersedia untuk profil bisnis.
- Untuk produk, endpoint mencoba insert langsung ke Supabase lebih dahulu
  karena ProductService/Repository pada beberapa versi project memiliki
  signature dan validasi yang berbeda.
- Field yang tidak ada di schema database akan dihapus otomatis saat fallback.
- Harga produk dikirim sebagai integer karena ProductService mewajibkan
  selling_price dan cost_price berupa non-negative integer.
"""

from __future__ import annotations

import re
from typing import Any
from uuid import UUID

from fastapi import APIRouter, HTTPException
from pydantic import BaseModel, Field

from app.database import connection as database_connection
from app.repositories.business_repository import BusinessRepository
from app.repositories.product_repository import ProductRepository
from app.services.business_service import BusinessService
from app.services.product_service import ProductService

router = APIRouter(prefix="/api/v1/onboarding", tags=["onboarding"])


class BusinessProfileCreateRequest(BaseModel):
    """Request pembuatan profil bisnis."""

    business_name: str = Field(..., min_length=1, max_length=255)
    owner_name: str = Field(..., min_length=1, max_length=255)
    business_type: str = Field(..., min_length=1, max_length=255)
    currency: str = Field(default="IDR", min_length=3, max_length=10)
    timezone: str = Field(default="Asia/Jakarta", min_length=1, max_length=100)
    language: str = Field(default="Bahasa Indonesia", min_length=1, max_length=100)


class BusinessProfileCreateResponse(BaseModel):
    """Response pembuatan profil bisnis."""

    business_id: str
    business_name: str
    owner_name: str
    business_type: str
    currency: str
    timezone: str
    language: str


class ProductCreateRequest(BaseModel):
    """Request pembuatan produk."""

    business_id: str = Field(..., min_length=1)
    name: str = Field(..., min_length=1, max_length=255)
    selling_price: int = Field(..., ge=0)
    cost_price: int = Field(default=0, ge=0)
    initial_stock: int = Field(default=0, ge=0)
    unit: str = Field(default="pcs", min_length=1, max_length=50)
    category: str = Field(default="Umum", min_length=1, max_length=100)
    sku: str | None = Field(default=None, max_length=100)
    barcode: str | None = Field(default=None, max_length=100)


class ProductCreateResponse(BaseModel):
    """Response pembuatan produk."""

    product_id: str
    business_id: str
    name: str
    selling_price: int
    cost_price: int
    stock: int
    unit: str
    category: str


class ProductListResponse(BaseModel):
    """Response daftar produk."""

    products: list[dict[str, Any]]


@router.post("/business-profile")
async def create_business_profile(
    request: BusinessProfileCreateRequest,
) -> dict[str, Any]:
    """
    Buat profil bisnis dan kembalikan business_id.

    Jika profil dengan nama bisnis yang sama sudah ada, endpoint akan
    menggunakan profil existing agar onboarding tetap bisa lanjut.
    """

    payload = _business_payload(request)
    language = request.language.strip()

    existing = await _maybe_await(_find_existing_business_profile(payload["business_name"]))

    if existing:
        normalized_existing = _normalize_business_response(
            existing,
            fallback_payload=payload,
            language=language,
        )

        return _success_response(
            data=BusinessProfileCreateResponse(**normalized_existing).model_dump(),
            message="Profil bisnis sudah ada dan digunakan.",
        )

    service = _build_business_service()
    repository = _build_business_repository()

    try:
        created = await _maybe_await(
            _call_first_available_on_targets(
                targets=(service, repository),
                method_names=(
                    "create_business_profile",
                    "create_profile",
                    "create_business",
                    "create",
                    "insert",
                    "add",
                ),
                payload=payload,
            )
        )
    except Exception as exc:
        if _is_already_exists_error(exc):
            existing_after_error = await _maybe_await(
                _find_existing_business_profile(payload["business_name"])
            )
            if existing_after_error:
                normalized_existing = _normalize_business_response(
                    existing_after_error,
                    fallback_payload=payload,
                    language=language,
                )

                return _success_response(
                    data=BusinessProfileCreateResponse(**normalized_existing).model_dump(),
                    message="Profil bisnis sudah ada dan digunakan.",
                )

        raise HTTPException(
            status_code=500,
            detail=f"Profil bisnis belum dapat dibuat: {exc}",
        ) from exc

    try:
        normalized = _normalize_business_response(
            created,
            fallback_payload=payload,
            language=language,
        )
    except Exception as exc:
        raise HTTPException(
            status_code=500,
            detail=f"Response profil bisnis tidak valid: {exc}",
        ) from exc

    return _success_response(
        data=BusinessProfileCreateResponse(**normalized).model_dump(),
        message="Profil bisnis berhasil dibuat.",
    )


@router.post("/products")
async def create_product(request: ProductCreateRequest) -> dict[str, Any]:
    """
    Buat produk untuk business_id yang sudah dibuat backend.

    Produk dibuat langsung via Supabase terlebih dahulu agar tidak terhambat
    perbedaan signature ProductService/ProductRepository.
    """

    _validate_uuid(request.business_id, "business_id")

    payload = _product_payload(request)

    existing = await _maybe_await(
        _find_existing_product(
            business_id=payload["business_id"],
            product_name=payload["name"],
        )
    )
    if existing:
        normalized_existing = _normalize_product_response(
            existing,
            fallback_payload=payload,
        )

        return _success_response(
            data=ProductCreateResponse(**normalized_existing).model_dump(),
            message="Produk sudah ada dan digunakan.",
        )

    direct_created, direct_errors = await _maybe_await(_create_product_via_supabase(payload))
    if direct_created:
        normalized_direct = _normalize_product_response(
            direct_created,
            fallback_payload=payload,
        )

        return _success_response(
            data=ProductCreateResponse(**normalized_direct).model_dump(),
            message="Produk berhasil dibuat.",
        )

    service = _build_product_service()
    repository = _build_product_repository()

    try:
        created = await _maybe_await(
            _call_first_available_on_targets(
                targets=(service, repository),
                method_names=(
                    "create_product",
                    "create",
                    "add_product",
                    "insert",
                    "add",
                ),
                payload=payload,
            )
        )
    except Exception as exc:
        existing_after_error = await _maybe_await(
            _find_existing_product(
                business_id=payload["business_id"],
                product_name=payload["name"],
            )
        )
        if existing_after_error:
            normalized_existing = _normalize_product_response(
                existing_after_error,
                fallback_payload=payload,
            )
            return _success_response(
                data=ProductCreateResponse(**normalized_existing).model_dump(),
                message="Produk sudah ada dan digunakan.",
            )

        direct_error_text = " | ".join(direct_errors[-5:]) or "Tidak ada detail."
        raise HTTPException(
            status_code=500,
            detail=(
                "Produk belum dapat dibuat. "
                f"Service/Repository: {exc}. "
                f"Supabase fallback: {direct_error_text}"
            ),
        ) from exc

    try:
        normalized = _normalize_product_response(
            created,
            fallback_payload=payload,
        )
    except Exception:
        existing_after_create = await _maybe_await(
            _find_existing_product(
                business_id=payload["business_id"],
                product_name=payload["name"],
            )
        )
        if existing_after_create:
            normalized = _normalize_product_response(
                existing_after_create,
                fallback_payload=payload,
            )
        else:
            raise HTTPException(
                status_code=500,
                detail="Response produk tidak valid: Backend tidak mengembalikan product_id.",
            ) from None

    return _success_response(
        data=ProductCreateResponse(**normalized).model_dump(),
        message="Produk berhasil dibuat.",
    )


@router.get("/products/{business_id}")
async def list_products(business_id: str, limit: int = 100) -> dict[str, Any]:
    """
    Ambil daftar produk untuk business_id.
    """

    _validate_uuid(business_id, "business_id")

    products = await _maybe_await(
        _list_products_via_supabase(
            business_id=business_id,
            limit=limit,
        )
    )

    if not products:
        service = _build_product_service()
        repository = _build_product_repository()

        try:
            products = await _maybe_await(
                _call_first_available_on_targets(
                    targets=(service, repository),
                    method_names=(
                        "list_active",
                        "list_by_business",
                        "list_products",
                        "get_products_by_business",
                        "get_by_business",
                        "find_by_business",
                        "list",
                        "get_all",
                    ),
                    payload={"business_id": business_id, "limit": limit},
                )
            )
        except Exception:
            products = []

    return _success_response(
        data=ProductListResponse(
            products=_normalize_product_list(products),
        ).model_dump(),
        message="Produk berhasil dimuat.",
    )


def _build_business_service() -> BusinessService:
    """Bangun BusinessService secara adaptif."""

    repository = _build_business_repository()

    constructor_attempts = (
        lambda: BusinessService(repository),
        lambda: BusinessService(business_repository=repository),
        lambda: BusinessService(repository=repository),
        lambda: BusinessService(),
    )

    return _first_successful_constructor(
        constructor_attempts,
        "BusinessService",
    )


def _build_product_service() -> ProductService:
    """Bangun ProductService secara adaptif."""

    repository = _build_product_repository()

    constructor_attempts = (
        lambda: ProductService(repository),
        lambda: ProductService(product_repository=repository),
        lambda: ProductService(repository=repository),
        lambda: ProductService(),
    )

    return _first_successful_constructor(
        constructor_attempts,
        "ProductService",
    )


def _build_business_repository() -> BusinessRepository:
    """Bangun BusinessRepository secara adaptif."""

    constructor_attempts = (
        lambda: BusinessRepository(),
        lambda: BusinessRepository(_get_database_client()),
        lambda: BusinessRepository(client=_get_database_client()),
        lambda: BusinessRepository(supabase_client=_get_database_client()),
        lambda: BusinessRepository(db_client=_get_database_client()),
    )

    return _first_successful_constructor(
        constructor_attempts,
        "BusinessRepository",
    )


def _build_product_repository() -> ProductRepository:
    """Bangun ProductRepository secara adaptif."""

    constructor_attempts = (
        lambda: ProductRepository(),
        lambda: ProductRepository(_get_database_client()),
        lambda: ProductRepository(client=_get_database_client()),
        lambda: ProductRepository(supabase_client=_get_database_client()),
        lambda: ProductRepository(db_client=_get_database_client()),
    )

    return _first_successful_constructor(
        constructor_attempts,
        "ProductRepository",
    )


def _first_successful_constructor(
    constructor_attempts: tuple[Any, ...],
    object_name: str,
) -> Any:
    """Jalankan constructor pertama yang berhasil."""

    last_error: Exception | None = None

    for constructor in constructor_attempts:
        try:
            return constructor()
        except Exception as exc:
            last_error = exc

    raise RuntimeError(f"{object_name} belum dapat dibuat. Error terakhir: {last_error}")


def _get_database_client() -> Any:
    """Ambil database client dari app.database.connection secara adaptif."""

    factory_names = (
        "get_supabase",
        "get_supabase_client",
        "get_database_client",
        "get_db_client",
        "get_client",
        "get_connection",
        "create_supabase_client",
        "create_client",
        "connect",
    )

    for factory_name in factory_names:
        factory = getattr(database_connection, factory_name, None)
        if callable(factory):
            return factory()

    client_names = (
        "supabase",
        "client",
        "db",
        "database_client",
        "supabase_client",
        "connection",
    )

    for client_name in client_names:
        client = getattr(database_connection, client_name, None)
        if client is not None:
            return client

    raise RuntimeError(
        "Tidak menemukan database client di app.database.connection. "
        "Cek nama function atau object client pada file connection.py."
    )


def _business_payload(request: BusinessProfileCreateRequest) -> dict[str, Any]:
    """
    Bangun payload bisnis sesuai schema business_profile.

    Jangan kirim language ke database karena schema saat ini tidak memiliki
    kolom language.
    """

    return {
        "business_name": request.business_name.strip(),
        "owner_name": request.owner_name.strip(),
        "business_type": request.business_type.strip(),
        "currency": request.currency.strip(),
        "timezone": request.timezone.strip(),
    }


def _product_payload(request: ProductCreateRequest) -> dict[str, Any]:
    """
    Bangun payload produk sesuai schema products saat ini.

    Harga dikirim sebagai integer.
    """

    payload: dict[str, Any] = {
        "business_id": request.business_id.strip(),
        "name": request.name.strip(),
        "selling_price": int(request.selling_price),
        "cost_price": int(request.cost_price),
        "stock": int(request.initial_stock),
        "unit": request.unit.strip(),
        "category": request.category.strip(),
        "is_active": True,
    }

    if request.sku:
        payload["sku"] = request.sku.strip()

    if request.barcode:
        payload["barcode"] = request.barcode.strip()

    return payload


def _product_payload_variants(payload: dict[str, Any]) -> list[dict[str, Any]]:
    """Bangun beberapa variasi payload produk untuk berbagai schema."""

    base = dict(payload)
    minimal_name = {
        "business_id": base["business_id"],
        "name": base["name"],
        "selling_price": int(base["selling_price"]),
        "cost_price": int(base["cost_price"]),
        "stock": int(base["stock"]),
    }
    name_with_unit_category = {
        **minimal_name,
        "unit": base.get("unit", "pcs"),
        "category": base.get("category", "Umum"),
    }
    product_name_minimal = {
        "business_id": base["business_id"],
        "product_name": base["name"],
        "selling_price": int(base["selling_price"]),
        "cost_price": int(base["cost_price"]),
        "stock": int(base["stock"]),
    }
    product_name_with_unit_category = {
        **product_name_minimal,
        "unit": base.get("unit", "pcs"),
        "category": base.get("category", "Umum"),
    }
    price_variant = {
        "business_id": base["business_id"],
        "name": base["name"],
        "price": int(base["selling_price"]),
        "cost_price": int(base["cost_price"]),
        "stock": int(base["stock"]),
    }

    return [
        base,
        name_with_unit_category,
        minimal_name,
        product_name_with_unit_category,
        product_name_minimal,
        price_variant,
    ]


def _find_existing_business_profile(business_name: str) -> dict[str, Any] | None:
    """Cari profil bisnis existing berdasarkan nama bisnis."""

    clean_name = business_name.strip()
    if not clean_name:
        return None

    from_service = _find_existing_business_profile_via_targets(clean_name)
    if from_service:
        return from_service

    return _find_existing_business_profile_via_supabase(clean_name)


def _find_existing_business_profile_via_targets(
    business_name: str,
) -> dict[str, Any] | None:
    """Cari profil existing melalui service/repository bila method tersedia."""

    try:
        service = _build_business_service()
        repository = _build_business_repository()
    except Exception:
        return None

    method_names = (
        "get_by_name",
        "find_by_name",
        "get_business_by_name",
        "find_business_by_name",
        "get_by_business_name",
        "find_by_business_name",
    )

    for target in (service, repository):
        for method_name in method_names:
            method = getattr(target, method_name, None)
            if not callable(method):
                continue

            try:
                result = method(business_name)
                mapping = _extract_data_mapping(result)
                if mapping:
                    return mapping
            except Exception:
                continue

    return None


def _find_existing_business_profile_via_supabase(
    business_name: str,
) -> dict[str, Any] | None:
    """Cari profil existing langsung melalui client Supabase."""

    try:
        client = _get_database_client()
    except Exception:
        return None

    table_method = getattr(client, "table", None)
    if not callable(table_method):
        return None

    try:
        result = (
            client.table("business_profile")
            .select("*")
            .eq("business_name", business_name)
            .limit(1)
            .execute()
        )
    except Exception:
        return None

    data = getattr(result, "data", None)

    if isinstance(data, list) and data:
        first_item = data[0]
        if isinstance(first_item, dict):
            return first_item

    if isinstance(data, dict):
        return data

    return None


def _find_existing_product(
    *,
    business_id: str,
    product_name: str,
) -> dict[str, Any] | None:
    """Cari produk existing berdasarkan business_id dan nama produk."""

    try:
        client = _get_database_client()
    except Exception:
        return None

    table_method = getattr(client, "table", None)
    if not callable(table_method):
        return None

    for name_column in ("name", "product_name"):
        try:
            result = (
                client.table("products")
                .select("*")
                .eq("business_id", business_id)
                .eq(name_column, product_name)
                .limit(1)
                .execute()
            )
        except Exception:
            continue

        data = getattr(result, "data", None)
        if isinstance(data, list) and data:
            first_item = data[0]
            if isinstance(first_item, dict):
                return first_item

        if isinstance(data, dict):
            return data

    return None


def _create_product_via_supabase(
    payload: dict[str, Any],
) -> tuple[dict[str, Any] | None, list[str]]:
    """Buat produk langsung via Supabase dengan payload adaptif."""

    errors: list[str] = []

    try:
        client = _get_database_client()
    except Exception as exc:
        return None, [f"database client: {exc}"]

    table_method = getattr(client, "table", None)
    if not callable(table_method):
        return None, ["database client tidak memiliki method table()."]

    for variant in _product_payload_variants(payload):
        working_payload = dict(variant)

        for _ in range(10):
            try:
                result = client.table("products").insert(working_payload).execute()
            except Exception as exc:
                message = str(exc)
                missing_column = _extract_missing_column(message)

                if missing_column and missing_column in working_payload:
                    working_payload.pop(missing_column)
                    errors.append(f"hapus kolom tidak tersedia '{missing_column}' lalu coba ulang")
                    continue

                errors.append(message)
                break

            data = getattr(result, "data", None)
            if isinstance(data, list) and data:
                first_item = data[0]
                if isinstance(first_item, dict):
                    return first_item, errors

            if isinstance(data, dict):
                return data, errors

            found = _find_existing_product(
                business_id=payload["business_id"],
                product_name=payload["name"],
            )
            if found:
                return found, errors

            errors.append(
                f"insert products tidak mengembalikan data untuk payload {working_payload}"
            )
            break

    return None, errors


def _extract_missing_column(message: str) -> str | None:
    """Ambil nama kolom yang tidak ditemukan dari pesan PostgREST."""

    patterns = (
        r"Could not find the '([^']+)' column",
        r'Could not find the "([^"]+)" column',
    )

    for pattern in patterns:
        match = re.search(pattern, message)
        if match:
            return match.group(1)

    return None


def _list_products_via_supabase(
    *,
    business_id: str,
    limit: int,
) -> list[dict[str, Any]]:
    """Ambil produk langsung dari Supabase."""

    try:
        client = _get_database_client()
    except Exception:
        return []

    table_method = getattr(client, "table", None)
    if not callable(table_method):
        return []

    try:
        result = (
            client.table("products")
            .select("*")
            .eq("business_id", business_id)
            .limit(limit)
            .execute()
        )
    except Exception:
        return []

    data = getattr(result, "data", None)

    if isinstance(data, list):
        return [dict(item) for item in data if isinstance(item, dict)]

    if isinstance(data, dict):
        return [data]

    return []


def _call_first_available_on_targets(
    targets: tuple[Any, ...],
    *,
    method_names: tuple[str, ...],
    payload: dict[str, Any],
) -> Any:
    """Panggil method pertama yang tersedia dari beberapa target."""

    errors: list[str] = []

    for target in targets:
        try:
            return _call_first_available(
                target,
                method_names=method_names,
                payload=payload,
            )
        except Exception as exc:
            errors.append(f"{target.__class__.__name__}: {exc}")

    raise AttributeError(
        f"Tidak ada target yang dapat menjalankan method. Detail: {' | '.join(errors)}"
    )


def _call_first_available(
    target: Any,
    *,
    method_names: tuple[str, ...],
    payload: dict[str, Any],
) -> Any:
    """Panggil method pertama yang tersedia pada service/repository."""

    for method_name in method_names:
        method = getattr(target, method_name, None)
        if callable(method):
            return _call_method(method, payload)

    nested_targets = (
        getattr(target, "repository", None),
        getattr(target, "business_repository", None),
        getattr(target, "product_repository", None),
        getattr(target, "_repository", None),
    )

    for nested_target in nested_targets:
        if nested_target is None:
            continue

        for method_name in method_names:
            method = getattr(nested_target, method_name, None)
            if callable(method):
                return _call_method(method, payload)

    raise AttributeError(f"Tidak ada method yang tersedia: {', '.join(method_names)}")


def _call_method(method: Any, payload: dict[str, Any]) -> Any:
    """Panggil method dengan beberapa signature umum."""

    business_id = payload.get("business_id")
    limit = payload.get("limit")

    data = dict(payload)
    data.pop("business_id", None)
    data.pop("limit", None)

    call_attempts: list[Any] = []

    if business_id:
        call_attempts.extend(
            [
                lambda: method(business_id, data),
                lambda: method(business_id=business_id, product_data=data),
                lambda: method(business_id=business_id, data=data),
                lambda: method(business_id=business_id, payload=data),
                lambda: method(business_id, product_data=data),
                lambda: method(business_id=business_id),
                lambda: method(business_id),
            ]
        )

        if limit is not None:
            call_attempts.extend(
                [
                    lambda: method(business_id, limit),
                    lambda: method(business_id=business_id, limit=limit),
                ]
            )

    call_attempts.extend(
        [
            lambda: method(payload),
            lambda: method(**payload),
            lambda: method(data),
            lambda: method(**data),
        ]
    )

    last_error: Exception | None = None

    for attempt in call_attempts:
        try:
            return attempt()
        except Exception as exc:
            last_error = exc

            if not _is_retryable_call_error(exc):
                raise

    raise TypeError(
        f"Signature method service/repository tidak dikenali. Error terakhir: {last_error}"
    )


def _is_retryable_call_error(exc: Exception) -> bool:
    """
    Tentukan apakah error berasal dari percobaan signature yang salah.
    """

    message = str(exc).lower()

    retryable_phrases = (
        "missing",
        "required",
        "unexpected",
        "positional",
        "keyword",
        "argument",
        "must be a mapping",
        "takes",
        "given",
        "signature",
    )

    return isinstance(exc, TypeError) or any(phrase in message for phrase in retryable_phrases)


async def _maybe_await(value: Any) -> Any:
    """Await jika value adalah awaitable."""

    if hasattr(value, "__await__"):
        return await value

    return value


def _normalize_business_response(
    created: Any,
    *,
    fallback_payload: dict[str, Any],
    language: str,
) -> dict[str, Any]:
    """Normalisasi response business."""

    data = _extract_data_mapping(created)

    business_id = data.get("business_id") or data.get("id") or data.get("uuid")

    if not business_id:
        raise ValueError("Backend tidak mengembalikan business_id.")

    return {
        "business_id": str(business_id),
        "business_name": str(data.get("business_name") or fallback_payload["business_name"]),
        "owner_name": str(data.get("owner_name") or fallback_payload["owner_name"]),
        "business_type": str(data.get("business_type") or fallback_payload["business_type"]),
        "currency": str(data.get("currency") or fallback_payload["currency"]),
        "timezone": str(data.get("timezone") or fallback_payload["timezone"]),
        "language": language or "Bahasa Indonesia",
    }


def _normalize_product_response(
    created: Any,
    *,
    fallback_payload: dict[str, Any],
) -> dict[str, Any]:
    """Normalisasi response product."""

    data = _extract_data_mapping(created)

    product_id = data.get("product_id") or data.get("id") or data.get("uuid")

    if not product_id:
        raise ValueError("Backend tidak mengembalikan product_id.")

    return {
        "product_id": str(product_id),
        "business_id": str(data.get("business_id") or fallback_payload["business_id"]),
        "name": str(data.get("name") or data.get("product_name") or fallback_payload["name"]),
        "selling_price": int(
            data.get("selling_price") or data.get("price") or fallback_payload["selling_price"]
        ),
        "cost_price": int(data.get("cost_price") or fallback_payload["cost_price"]),
        "stock": int(
            data.get("stock")
            or data.get("current_stock")
            or data.get("stock_quantity")
            or fallback_payload["stock"]
        ),
        "unit": str(data.get("unit") or fallback_payload.get("unit", "pcs")),
        "category": str(data.get("category") or fallback_payload.get("category", "Umum")),
    }


def _normalize_product_list(products: Any) -> list[dict[str, Any]]:
    """Normalisasi daftar produk."""

    data = _extract_data_mapping(products)

    if isinstance(products, list):
        raw_items = products
    elif isinstance(data.get("products"), list):
        raw_items = data["products"]
    elif isinstance(data.get("data"), list):
        raw_items = data["data"]
    elif data:
        raw_items = [data]
    else:
        raw_items = []

    result: list[dict[str, Any]] = []
    for item in raw_items:
        mapping = _extract_data_mapping(item)
        if mapping:
            result.append(mapping)

    return result


def _extract_data_mapping(value: Any) -> dict[str, Any]:
    """Ambil mapping data dari response object/dict/model."""

    mapping = _to_mapping(value)

    nested_data = mapping.get("data")
    if isinstance(nested_data, dict):
        return dict(nested_data)

    return mapping


def _to_mapping(value: Any) -> dict[str, Any]:
    """Konversi object/dict/model menjadi dict."""

    if value is None:
        return {}

    if isinstance(value, dict):
        return dict(value)

    model_dump = getattr(value, "model_dump", None)
    if callable(model_dump):
        return dict(model_dump())

    dict_method = getattr(value, "dict", None)
    if callable(dict_method):
        return dict(dict_method())

    data = getattr(value, "data", None)
    if isinstance(data, dict):
        return dict(data)

    if hasattr(value, "__dict__"):
        return dict(value.__dict__)

    return {}


def _validate_uuid(value: str, field_name: str) -> None:
    """Validasi UUID."""

    try:
        UUID(value)
    except ValueError as exc:
        raise HTTPException(
            status_code=422,
            detail=f"{field_name} tidak valid.",
        ) from exc


def _is_already_exists_error(exc: Exception) -> bool:
    """Deteksi error duplicate/existing business."""

    message = str(exc).lower()

    return any(
        phrase in message
        for phrase in (
            "already exists",
            "duplicate",
            "unique",
            "sudah ada",
            "exists",
        )
    )


def _success_response(
    *,
    data: dict[str, Any],
    message: str,
) -> dict[str, Any]:
    """Bangun response sukses standar."""

    return {
        "success": True,
        "data": data,
        "error": None,
        "message": message,
    }
