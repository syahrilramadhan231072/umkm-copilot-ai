"""
Klien API Frontend
==================

Klien HTTP untuk menghubungkan Streamlit dengan FastAPI.

Catatan penting:
- Router onboarding baru memakai prefix /api/v1/onboarding.
- Router bawaan project memakai prefix langsung, misalnya:
  /transactions, /analytics, /business, /marketing, /insights, /exports, /router.
- Client ini mencoba endpoint non-/api/v1 terlebih dahulu untuk router bawaan
  dan tetap menyediakan fallback ke /api/v1 untuk kompatibilitas.
"""

from __future__ import annotations

import json
from typing import Any, Callable, Mapping
from urllib.error import HTTPError, URLError
from urllib.parse import urlencode
from urllib.request import Request, urlopen


Transport = Callable[
    [str, str, dict[str, str], bytes | None, float],
    tuple[int, str],
]


class FrontendApiClient:
    """Klien HTTP untuk backend UMKM Copilot AI."""

    def __init__(
        self,
        api_base_url: str = "http://127.0.0.1:8000",
        *,
        timeout: float = 20.0,
        transport: Transport | None = None,
    ) -> None:
        """Inisialisasi API client."""

        self.api_base_url = self._normalize_base_url(api_base_url)
        self.timeout = self._validate_timeout(timeout)
        self._transport = transport or self._urllib_transport

    def health_check(self) -> dict[str, Any]:
        """Cek status layanan."""

        return self._normalize_health_response(self._request("GET", "/health"))

    def create_business_profile(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Buat profil bisnis melalui router onboarding."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/onboarding/business-profile",
                "/onboarding/business-profile",
            ],
            json_body=dict(payload),
        )

    def create_product(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Buat produk melalui router onboarding."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/onboarding/products",
                "/onboarding/products",
            ],
            json_body=dict(payload),
        )

    def list_products(self, business_id: str, limit: int = 100) -> dict[str, Any]:
        """Ambil daftar produk dari router onboarding."""

        safe_business_id = self._safe_path(business_id)

        return self._request_with_fallback(
            "GET",
            [
                f"/api/v1/onboarding/products/{safe_business_id}",
                f"/onboarding/products/{safe_business_id}",
            ],
            query={"limit": limit},
        )

    def get_dashboard(self, business_id: str, limit: int = 1000) -> dict[str, Any]:
        """Ambil seluruh data dashboard dari backend."""

        safe_business_id = self._safe_path(business_id)

        return self._request_with_fallback(
            "GET",
            [
                f"/analytics/dashboard/{safe_business_id}",
                f"/api/v1/analytics/dashboard/{safe_business_id}",
            ],
            query={"limit": limit},
        )

    def business_overview(
        self,
        business_id: str,
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Ambil ringkasan bisnis."""

        return self._request_with_fallback(
            "POST",
            [
                "/business/overview",
                "/api/v1/business/overview",
            ],
            json_body={
                "business_id": business_id,
                "limit": limit,
                "session_id": session_id,
            },
        )

    def business_health_check(
        self,
        business_id: str,
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Ambil pemeriksaan kondisi bisnis."""

        return self._request_with_fallback(
            "POST",
            [
                "/business/health-check",
                "/api/v1/business/health-check",
            ],
            json_body={
                "business_id": business_id,
                "limit": limit,
                "session_id": session_id,
            },
        )

    def record_transaction(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Catat transaksi melalui endpoint transaksi backend."""

        clean_payload = dict(payload)

        return self._request_with_fallback(
            "POST",
            [
                "/transactions/record",
                "/transactions/record-payload",
                "/api/v1/transactions/record",
                "/api/v1/transactions/record-payload",
            ],
            json_body=clean_payload,
            fallback_statuses=(404, 405, 422),
        )

    def get_transaction_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Ambil ringkasan transaksi."""

        safe_business_id = self._safe_path(business_id)

        return self._request_with_fallback(
            "GET",
            [
                f"/transactions/summary/{safe_business_id}",
                f"/api/v1/transactions/summary/{safe_business_id}",
            ],
            query={"limit": limit},
        )

    def get_marketing_context(
        self,
        payload: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Ambil konteks pemasaran."""

        return self._request_with_fallback(
            "POST",
            [
                "/marketing/context",
                "/api/v1/marketing/context",
            ],
            json_body=dict(payload),
        )

    def create_marketing_record(
        self,
        payload: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Simpan riwayat pemasaran."""

        return self._request_with_fallback(
            "POST",
            [
                "/marketing/records",
                "/api/v1/marketing/records",
            ],
            json_body=dict(payload),
        )

    def get_marketing_history(
        self,
        business_id: str,
        keyword: str | None = None,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Ambil riwayat pemasaran."""

        safe_business_id = self._safe_path(business_id)

        return self._request_with_fallback(
            "GET",
            [
                f"/marketing/history/{safe_business_id}",
                f"/api/v1/marketing/history/{safe_business_id}",
            ],
            query={"keyword": keyword, "limit": limit},
        )

    def get_insight_context(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Ambil konteks rekomendasi bisnis."""

        return self._request_with_fallback(
            "POST",
            [
                "/insights/context",
                "/api/v1/insights/context",
            ],
            json_body=dict(payload),
        )

    def create_insight(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Simpan rekomendasi bisnis."""

        return self._request_with_fallback(
            "POST",
            [
                "/insights/records",
                "/api/v1/insights/records",
            ],
            json_body=dict(payload),
        )

    def get_insight_review(
        self,
        business_id: str,
        keyword: str | None = None,
        insight_category: str | None = None,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Ambil daftar rekomendasi bisnis."""

        safe_business_id = self._safe_path(business_id)

        return self._request_with_fallback(
            "GET",
            [
                f"/insights/review/{safe_business_id}",
                f"/api/v1/insights/review/{safe_business_id}",
            ],
            query={
                "keyword": keyword,
                "insight_category": insight_category,
                "limit": limit,
            },
        )

    def export_dashboard(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Unduh data dashboard."""

        return self._request_with_fallback(
            "POST",
            [
                "/exports/dashboard",
                "/api/v1/exports/dashboard",
            ],
            json_body=dict(payload),
        )

    def export_sales_summary(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Unduh ringkasan penjualan."""

        return self._request_with_fallback(
            "POST",
            [
                "/exports/sales-summary",
                "/api/v1/exports/sales-summary",
            ],
            json_body=dict(payload),
        )

    def export_inventory_summary(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Unduh ringkasan persediaan."""

        return self._request_with_fallback(
            "POST",
            [
                "/exports/inventory-summary",
                "/api/v1/exports/inventory-summary",
            ],
            json_body=dict(payload),
        )

    def export_structured_data(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Unduh data terstruktur."""

        return self._request_with_fallback(
            "POST",
            [
                "/exports/structured",
                "/api/v1/exports/structured",
            ],
            json_body=dict(payload),
        )

    def route(
        self,
        user_input: str,
        payload: Mapping[str, Any],
        explicit_route: str | None = None,
    ) -> dict[str, Any]:
        """Kirim pertanyaan ke asisten bisnis."""

        return self._request_with_fallback(
            "POST",
            [
                "/router/route",
                "/api/v1/router/route",
            ],
            json_body={
                "user_input": user_input,
                "payload": dict(payload),
                "explicit_route": explicit_route,
            },
        )

    def _request_with_fallback(
        self,
        method: str,
        paths: list[str],
        *,
        json_body: Mapping[str, Any] | None = None,
        query: Mapping[str, Any] | None = None,
        fallback_statuses: tuple[int, ...] = (404, 405),
    ) -> dict[str, Any]:
        """Coba beberapa path hingga mendapatkan response bukan fallback status."""

        attempts: list[str] = []
        last_response: dict[str, Any] | None = None

        for path in paths:
            response = self._request(
                method,
                path,
                json_body=json_body,
                query=query,
            )
            attempts.append(
                f"{method.upper()} {path} -> {response.get('_http_status', 200)}"
            )
            response["_path_attempts"] = attempts.copy()
            last_response = response

            status = response.get("_http_status")
            if status not in fallback_statuses:
                return response

        return last_response or self._failure_response(
            "RouteNotFound",
            "Tidak ada endpoint yang tersedia.",
        )

    def _request(
        self,
        method: str,
        path: str,
        *,
        json_body: Mapping[str, Any] | None = None,
        query: Mapping[str, Any] | None = None,
    ) -> dict[str, Any]:
        """Eksekusi request HTTP."""

        method_upper = method.upper()
        url = self._build_url(path, query)
        headers = {"Accept": "application/json"}
        body: bytes | None = None

        if json_body is not None:
            body = json.dumps(
                self._remove_none_values(dict(json_body)),
                ensure_ascii=False,
                default=str,
            ).encode("utf-8")
            headers["Content-Type"] = "application/json"

        try:
            status_code, response_text = self._transport(
                method_upper,
                url,
                headers,
                body,
                self.timeout,
            )
            parsed = self._parse_response_text(response_text)

            if 200 <= status_code < 300:
                if "success" in parsed:
                    return parsed
                return {"success": True, "data": parsed, "error": None}

            parsed.setdefault("success", False)
            parsed["_http_status"] = status_code
            return parsed

        except HTTPError as exc:
            return self._handle_http_error(exc)
        except URLError as exc:
            return self._failure_response(
                "ConnectionError",
                f"Tidak dapat terhubung ke layanan: {exc.reason}",
            )
        except TimeoutError:
            return self._failure_response(
                "TimeoutError",
                "Permintaan melewati batas waktu.",
            )
        except Exception as exc:
            return self._failure_response(exc.__class__.__name__, str(exc))

    def _urllib_transport(
        self,
        method: str,
        url: str,
        headers: dict[str, str],
        body: bytes | None,
        timeout: float,
    ) -> tuple[int, str]:
        """Transport HTTP bawaan."""

        request = Request(url=url, data=body, headers=headers, method=method)

        with urlopen(request, timeout=timeout) as response:
            status_code = int(response.status)
            response_text = response.read().decode("utf-8")

        return status_code, response_text

    def _handle_http_error(self, error: HTTPError) -> dict[str, Any]:
        """Ubah HTTPError menjadi response standar."""

        try:
            response_text = error.read().decode("utf-8")
            parsed = self._parse_response_text(response_text)
            parsed.setdefault("success", False)
            parsed["_http_status"] = int(error.code)
            return parsed
        except Exception:
            return self._failure_response(
                "HTTPError",
                f"Layanan mengembalikan status {error.code}.",
                status_code=int(error.code),
            )

    def _build_url(
        self,
        path: str,
        query: Mapping[str, Any] | None = None,
    ) -> str:
        """Bangun URL lengkap."""

        if not path.startswith("/"):
            raise ValueError("path harus diawali '/'.")

        url = f"{self.api_base_url}{path}"
        filtered_query = self._remove_none_values(dict(query or {}))

        if filtered_query:
            url = f"{url}?{urlencode(filtered_query)}"

        return url

    def _parse_response_text(self, response_text: str) -> dict[str, Any]:
        """Parse teks response menjadi dictionary."""

        if not response_text.strip():
            return {"success": True, "data": {}, "error": None}

        parsed = json.loads(response_text)

        if isinstance(parsed, dict):
            return parsed

        return {"success": True, "data": parsed, "error": None}

    def _normalize_health_response(self, response: dict[str, Any]) -> dict[str, Any]:
        """Normalisasi response health check."""

        if response.get("success") is True:
            return response

        status = str(response.get("status", "")).lower()
        if status in {"ok", "healthy", "success"}:
            return {"success": True, "data": response, "error": None}

        return response

    def _failure_response(
        self,
        error_type: str,
        message: str,
        *,
        status_code: int | None = None,
    ) -> dict[str, Any]:
        """Bangun response gagal standar."""

        response: dict[str, Any] = {
            "success": False,
            "data": {},
            "error": {"type": error_type, "message": message},
        }

        if status_code is not None:
            response["_http_status"] = status_code

        return response

    def _normalize_base_url(self, api_base_url: str) -> str:
        """Normalisasi URL layanan."""

        if not isinstance(api_base_url, str) or not api_base_url.strip():
            raise ValueError("api_base_url wajib diisi.")

        return api_base_url.strip().rstrip("/")

    def _validate_timeout(self, timeout: float) -> float:
        """Validasi timeout."""

        if not isinstance(timeout, (int, float)) or timeout <= 0:
            raise ValueError("timeout harus berupa angka positif.")

        return float(timeout)

    def _safe_path(self, value: str) -> str:
        """Validasi komponen path."""

        if not isinstance(value, str) or not value.strip():
            raise ValueError("nilai path wajib diisi.")

        stripped = value.strip()

        if "/" in stripped or "\\" in stripped:
            raise ValueError("nilai path tidak boleh mengandung garis miring.")

        return stripped

    def _remove_none_values(self, data: dict[str, Any]) -> dict[str, Any]:
        """Hapus field bernilai None."""

        return {key: value for key, value in data.items() if value is not None}
