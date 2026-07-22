"""
AI Generation Service
=====================

Service layer adapter for provider-neutral AI generation.

This service owns prompt construction, response formatting, and deterministic
local business intelligence answers for simple data-driven questions. It does
not access repositories, databases, FastAPI, or Streamlit. Provider access is
delegated to ProviderManager through the AI Provider layer.

The local business intelligence layer keeps the application useful during LLM
quota incidents, demonstrations, competitions, and provider outages.
"""

from __future__ import annotations

from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from decimal import Decimal, InvalidOperation
from enum import StrEnum
from typing import Any

from app.llm.gemini_client import GeminiClient
from app.llm.prompt_builder import PromptBuilder
from app.llm.providers.provider_manager import (
    ProviderManager,
    get_default_provider_manager,
)
from app.llm.response_formatter import ResponseFormatter
from app.utils.logger import logger


class LocalBIIntent(StrEnum):
    """Supported deterministic business intelligence intents."""

    PRODUCT_CATALOG = "ProductCatalogIntent"
    BEST_SELLING_PRODUCT = "BestSellingProductIntent"
    HIGH_REVENUE_PRODUCT = "HighRevenueProductIntent"
    SLOW_MOVING_PRODUCT = "SlowMovingProductIntent"
    ZERO_SALES_PRODUCT = "ZeroSalesProductIntent"
    OUT_OF_STOCK = "OutOfStockIntent"
    LOW_STOCK = "LowStockIntent"
    OVERSTOCK = "OverstockIntent"
    HIGH_MARGIN_PRODUCT = "HighMarginProductIntent"
    LOW_MARGIN_PRODUCT = "LowMarginProductIntent"
    BUSINESS_HEALTH = "BusinessHealthIntent"
    ALERT_SUMMARY = "AlertSummaryIntent"
    FOLLOW_UP = "FollowUpIntent"
    GREETING = "GreetingIntent"
    BUSINESS_IDENTITY = "BusinessIdentityIntent"


@dataclass(frozen=True)
class ProductInfo:
    """Normalized product information used by local BI answers."""

    name: str
    price: Decimal | None = None
    cost_price: Decimal | None = None
    stock: Decimal | None = None
    minimum_stock: Decimal | None = None
    sku: str = ""
    category: str = ""
    product_id: str = ""


@dataclass(frozen=True)
class ProductMetric:
    """Normalized product performance metric."""

    name: str
    quantity_sold: Decimal | None = None
    revenue: Decimal | None = None
    value: Decimal | None = None


class AIGenerationService:
    """
    Generate natural-language AI responses using configured LLM providers.

    Public interface remains backward-compatible. Existing callers may continue
    calling generate_conversation_response(...), generate_text(...), or
    await generate(...).
    """

    DEFAULT_SYSTEM_INSTRUCTION = """
You are Go-UMKM AI, a practical business assistant for Indonesian micro, small,
and medium enterprises.

Answer the user's question directly and naturally.

Rules:
- If the question is a general concept, answer generally and clearly.
- If the question is related to the user's business, use the business context
  when it is relevant.
- If the business context is not relevant, do not force it into the answer.
- Do not merely repeat dashboard metrics unless the user asks for business data.
- Keep answers actionable, concise, and easy to understand.
- Reply in the same language as the user's question when possible.
"""

    FRIENDLY_FALLBACK_TEXT = (
        "The AI service is temporarily unavailable. Please try again shortly."
    )

    LOCAL_PROVIDER_NAME = "local-context"
    LOCAL_MODEL_NAME = "deterministic-bi-v1"

    PRODUCT_CONTAINERS = (
        "products",
        "active_products",
        "product_catalog",
        "catalog_products",
        "product_list",
        "items",
    )
    SALES_METRIC_CONTAINERS = (
        "product_performance",
        "sales_by_product",
        "product_sales",
        "products_performance",
        "sales_per_product",
        "top_products_by_quantity",
        "best_selling_products",
        "top_selling_products",
        "top_products",
    )
    REVENUE_METRIC_CONTAINERS = (
        "top_products_by_revenue",
        "revenue_by_product",
        "product_revenue",
        "products_by_revenue",
        "product_performance",
        "sales_by_product",
    )
    ALERT_CONTAINERS = (
        "alerts",
        "warnings",
        "business_alerts",
        "inventory_alerts",
        "health_alerts",
    )

    PRODUCT_NAME_KEYS = (
        "product_name",
        "name",
        "product",
        "nama_produk",
        "nama",
        "title",
    )
    PRODUCT_PRICE_KEYS = (
        "selling_price",
        "price",
        "sale_price",
        "unit_price",
        "harga_jual",
        "harga",
        "price_idr",
    )
    PRODUCT_COST_KEYS = (
        "cost_price",
        "purchase_price",
        "buying_price",
        "modal",
        "harga_modal",
        "cost",
    )
    PRODUCT_STOCK_KEYS = (
        "stock",
        "current_stock",
        "stock_quantity",
        "quantity_in_stock",
        "stok",
        "available_stock",
    )
    PRODUCT_MIN_STOCK_KEYS = (
        "minimum_stock",
        "min_stock",
        "reorder_point",
        "safety_stock",
        "stok_minimum",
    )
    PRODUCT_SKU_KEYS = ("sku", "barcode", "code", "kode")
    PRODUCT_ID_KEYS = ("product_id", "id")
    PRODUCT_CATEGORY_KEYS = ("category", "product_category", "kategori")

    METRIC_NAME_KEYS = (
        "product_name",
        "name",
        "product",
        "nama_produk",
        "title",
        "key",
    )
    METRIC_QUANTITY_KEYS = (
        "quantity_sold",
        "total_quantity",
        "qty_sold",
        "sold",
        "units_sold",
        "quantity",
        "qty",
        "total_sold",
    )
    METRIC_REVENUE_KEYS = (
        "revenue",
        "total_revenue",
        "sales_revenue",
        "omzet",
        "omset",
        "total_sales",
        "amount",
        "value",
        "nilai",
    )

    def __init__(
        self,
        prompt_builder: PromptBuilder,
        response_formatter: ResponseFormatter,
        gemini_client: GeminiClient | None = None,
        provider_manager: ProviderManager | None = None,
    ) -> None:
        """Initialize AI generation service."""

        self._gemini_client = gemini_client
        self._provider_manager = provider_manager
        self._prompt_builder = prompt_builder
        self._response_formatter = response_formatter
        self._logger = logger

    def generate_conversation_response(
        self,
        *,
        user_input: str,
        business_context: Mapping[str, Any] | None = None,
        conversation_history: list[Mapping[str, Any]] | None = None,
        temperature: float = 0.3,
        max_output_tokens: int = 1024,
    ) -> dict[str, Any]:
        """
        Generate a conversational answer.

        Deterministic local BI intents are answered before calling external LLMs.
        This keeps data-driven business questions operational during provider
        quota/rate-limit incidents.
        """

        try:
            self._validate_user_input(user_input)
            resolved_context = dict(business_context or {})

            local_answer = self._try_local_business_intelligence_answer(
                user_input=user_input,
                business_context=resolved_context,
                conversation_history=conversation_history or [],
                allow_no_data_answer=True,
            )
            if local_answer is not None:
                return self._success_response(local_answer)

            prompt = self._prompt_builder.build_chat_prompt(
                system_instruction=self.DEFAULT_SYSTEM_INSTRUCTION,
                business_context=resolved_context,
                conversation_history=conversation_history or [],
                user_input=user_input,
            )

            llm_response = self.generate_text(
                prompt,
                temperature=temperature,
                max_output_tokens=max_output_tokens,
            )
            formatted_response = self._response_formatter.format_text_response(
                llm_response,
                fallback_text=self.FRIENDLY_FALLBACK_TEXT,
            )

            if not formatted_response.get("success"):
                local_answer = self._try_local_business_intelligence_answer(
                    user_input=user_input,
                    business_context=resolved_context,
                    conversation_history=conversation_history or [],
                    allow_no_data_answer=True,
                )
                if local_answer is not None:
                    return self._success_response(local_answer)

                return self._friendly_error_response()

            data = formatted_response.get("data")
            if not isinstance(data, Mapping):
                return self._friendly_error_response()

            answer = str(data.get("text") or "").strip()
            if not answer:
                return self._friendly_error_response()

            return {
                "success": True,
                "data": {
                    "answer": answer,
                    "text": answer,
                    "provider": data.get("provider"),
                    "model": data.get("model"),
                },
                "error": None,
            }

        except Exception as exc:
            self._logger.exception("AI generation failed.")
            local_answer = self._try_local_business_intelligence_answer(
                user_input=user_input,
                business_context=business_context or {},
                conversation_history=conversation_history or [],
                allow_no_data_answer=True,
            )
            if local_answer is not None:
                return self._success_response(local_answer)

            return self._friendly_error_response(error_type=exc.__class__.__name__)

    def generate_text(
        self,
        prompt: str,
        *,
        temperature: float | None = None,
        max_output_tokens: int | None = None,
    ) -> dict[str, Any]:
        """
        Generate raw text from a prompt.

        This method preserves the GeminiClient-compatible response shape:
        success/provider/model/text/raw/error.
        """

        self._validate_user_input(prompt)

        if self._gemini_client is not None:
            return self._gemini_client.generate_text(
                prompt,
                temperature=temperature,
                max_output_tokens=max_output_tokens,
            )

        return self._get_provider_manager().generate_text(
            prompt,
            temperature=temperature,
            max_output_tokens=max_output_tokens,
        )

    async def generate(
        self,
        prompt: str,
        *,
        temperature: float | None = None,
        max_output_tokens: int | None = None,
    ) -> dict[str, Any]:
        """Async-compatible generation method."""

        return self.generate_text(
            prompt,
            temperature=temperature,
            max_output_tokens=max_output_tokens,
        )

    def provider_health(self) -> list[dict[str, Any]]:
        """Return provider health snapshot for developer diagnostics."""

        return self._get_provider_manager().health_snapshot()

    def _get_provider_manager(self) -> ProviderManager:
        """Return configured provider manager."""

        if self._provider_manager is None:
            self._provider_manager = get_default_provider_manager()

        return self._provider_manager

    def _try_local_business_intelligence_answer(
        self,
        *,
        user_input: str,
        business_context: Mapping[str, Any],
        conversation_history: list[Mapping[str, Any]],
        allow_no_data_answer: bool,
    ) -> str | None:
        """Answer supported BI intents from local context."""

        normalized_input = self._normalize_text(user_input)
        intent = self._classify_intent(normalized_input)

        if intent is None:
            return None

        if intent == LocalBIIntent.GREETING:
            return self._build_greeting_answer(business_context)

        if intent == LocalBIIntent.BUSINESS_IDENTITY:
            return self._build_business_identity_answer(
                business_context,
                allow_no_data_answer=allow_no_data_answer,
            )

        if intent == LocalBIIntent.PRODUCT_CATALOG:
            return self._build_product_catalog_answer(
                business_context,
                allow_no_data_answer=allow_no_data_answer,
            )

        if intent == LocalBIIntent.BEST_SELLING_PRODUCT:
            return self._build_best_selling_answer(business_context)

        if intent == LocalBIIntent.HIGH_REVENUE_PRODUCT:
            return self._build_high_revenue_answer(business_context)

        if intent == LocalBIIntent.SLOW_MOVING_PRODUCT:
            return self._build_slow_moving_answer(business_context)

        if intent == LocalBIIntent.ZERO_SALES_PRODUCT:
            return self._build_zero_sales_answer(business_context)

        if intent == LocalBIIntent.OUT_OF_STOCK:
            return self._build_out_of_stock_answer(business_context)

        if intent == LocalBIIntent.LOW_STOCK:
            return self._build_low_stock_answer(business_context)

        if intent == LocalBIIntent.OVERSTOCK:
            return self._build_overstock_answer(business_context)

        if intent == LocalBIIntent.HIGH_MARGIN_PRODUCT:
            return self._build_margin_answer(business_context, highest=True)

        if intent == LocalBIIntent.LOW_MARGIN_PRODUCT:
            return self._build_margin_answer(business_context, highest=False)

        if intent == LocalBIIntent.BUSINESS_HEALTH:
            return self._build_business_health_answer(business_context)

        if intent == LocalBIIntent.ALERT_SUMMARY:
            return self._build_alert_summary_answer(business_context)

        if intent == LocalBIIntent.FOLLOW_UP:
            return self._build_follow_up_answer(conversation_history)

        return None

    def _classify_intent(self, normalized_input: str) -> LocalBIIntent | None:
        """Classify supported local BI intent."""

        if self._is_greeting(normalized_input):
            return LocalBIIntent.GREETING

        if self._contains_any(
            normalized_input,
            (
                "stok habis",
                "stock out",
                "out of stock",
                "stok kosong",
                "stock kosong",
                "stok 0",
                "stock 0",
                "habis stok",
                "kehabisan stok",
            ),
        ):
            return LocalBIIntent.OUT_OF_STOCK

        if self._contains_any(
            normalized_input,
            (
                "low stock",
                "stok rendah",
                "stok menipis",
                "stok minimum",
                "minimum stock",
                "perlu restock",
                "butuh restock",
                "harus restock",
                "restock apa",
                "restok",
            ),
        ):
            return LocalBIIntent.LOW_STOCK

        if self._contains_any(
            normalized_input,
            (
                "tidak laku",
                "belum laku",
                "tidak terjual",
                "belum terjual",
                "zero sales",
                "nol penjualan",
                "penjualan nol",
                "tidak ada penjualan",
            ),
        ):
            return LocalBIIntent.ZERO_SALES_PRODUCT

        if self._contains_any(
            normalized_input,
            (
                "kurang laku",
                "slow moving",
                "jarang terjual",
                "paling sedikit terjual",
                "least selling",
                "penjualan rendah",
                "sepi penjualan",
                "produk lemah",
            ),
        ):
            return LocalBIIntent.SLOW_MOVING_PRODUCT

        if self._contains_any(
            normalized_input,
            (
                "overstock",
                "stok terlalu banyak",
                "stock terlalu banyak",
                "stok menumpuk",
                "stock menumpuk",
                "stok berlebih",
                "stock berlebih",
                "stok tinggi",
            ),
        ):
            return LocalBIIntent.OVERSTOCK

        if self._contains_any(
            normalized_input,
            (
                "margin tertinggi",
                "profit tertinggi",
                "untung tertinggi",
                "paling untung",
                "laba tertinggi",
                "margin terbaik",
                "profit terbesar",
            ),
        ):
            return LocalBIIntent.HIGH_MARGIN_PRODUCT

        if self._contains_any(
            normalized_input,
            (
                "margin terendah",
                "profit terendah",
                "untung terendah",
                "margin rendah",
                "laba rendah",
                "margin terkecil",
                "rugi",
            ),
        ):
            return LocalBIIntent.LOW_MARGIN_PRODUCT

        if self._contains_any(
            normalized_input,
            (
                "paling laku",
                "terlaris",
                "paling laris",
                "best seller",
                "bestseller",
                "top seller",
                "produk paling banyak",
                "yang paling laku",
                "laku apa",
                "laku yang mana",
                "produk apa yang terjual",
                "produk yang terjual",
                "produk terjual",
                "apa yang terjual",
                "jualan apa yang terjual",
            ),
        ):
            return LocalBIIntent.BEST_SELLING_PRODUCT

        if self._contains_any(
            normalized_input,
            (
                "omzet",
                "omset",
                "revenue",
                "pendapatan",
                "penjualan tertinggi",
                "nilai penjualan",
                "hasil penjualan",
                "produk dengan omzet",
                "produk dengan omset",
            ),
        ):
            return LocalBIIntent.HIGH_REVENUE_PRODUCT

        if self._contains_any(
            normalized_input,
            (
                "alert",
                "peringatan",
                "warning",
                "masalah bisnis",
                "masalah apa",
                "ada masalah",
                "apa yang perlu diperhatikan",
            ),
        ):
            return LocalBIIntent.ALERT_SUMMARY

        if self._contains_any(
            normalized_input,
            (
                "kesehatan bisnis",
                "business health",
                "health bisnis",
                "kondisi bisnis",
                "bisnis sehat",
                "ringkasan bisnis",
                "status bisnis",
            ),
        ):
            return LocalBIIntent.BUSINESS_HEALTH

        if self._is_product_query(normalized_input):
            return LocalBIIntent.PRODUCT_CATALOG

        if self._is_business_identity_query(normalized_input):
            return LocalBIIntent.BUSINESS_IDENTITY

        if self._contains_any(
            normalized_input,
            (
                "yang tadi",
                "daftar tadi",
                "yang kedua",
                "yang pertama",
                "produk itu",
                "itu kenapa",
                "dari daftar itu",
                "dari list itu",
            ),
        ):
            return LocalBIIntent.FOLLOW_UP

        return None

    def _build_greeting_answer(self, business_context: Mapping[str, Any]) -> str:
        """Build greeting answer."""

        business_name = self._extract_business_name(business_context)
        if business_name:
            return (
                f"Halo! Saya Go-UMKM AI untuk {business_name}. "
                "Saya bisa membantu membaca data produk, transaksi, stok, "
                "produk terlaris, produk kurang laku, margin, alert, dan "
                "kesehatan bisnis."
            )

        return (
            "Halo! Saya Go-UMKM AI. Saya bisa membantu membaca data produk, "
            "transaksi, stok, produk terlaris, produk kurang laku, margin, "
            "alert, dan kesehatan bisnis."
        )

    def _build_business_identity_answer(
        self,
        business_context: Mapping[str, Any],
        *,
        allow_no_data_answer: bool,
    ) -> str | None:
        """Build business identity answer."""

        business_name = self._extract_business_name(business_context)
        business_type = self._first_non_empty_value(
            business_context,
            keys=(
                "business_type",
                "category",
                "business_category",
                "industry",
                "sector",
                "jenis_usaha",
            ),
        )
        currency = self._first_non_empty_value(
            business_context,
            keys=("currency", "mata_uang"),
        )

        details: list[str] = []
        if business_name:
            details.append(f"Nama bisnis: {business_name}")
        if business_type:
            details.append(f"Jenis/kategori: {business_type}")
        if currency:
            details.append(f"Mata uang: {currency}")

        if details:
            return (
                "Aplikasi ini sedang terhubung dengan konteks bisnis berikut:\n\n- "
                + "\n- ".join(details)
            )

        if allow_no_data_answer:
            return (
                "Aplikasi ini adalah Go-UMKM AI, asisten bisnis untuk membantu "
                "UMKM membaca produk, transaksi, stok, insight, marketing, dan "
                "rekomendasi bisnis. Saya belum menemukan profil bisnis aktif "
                "pada konteks saat ini."
            )

        return None

    def _build_product_catalog_answer(
        self,
        business_context: Mapping[str, Any],
        *,
        allow_no_data_answer: bool,
    ) -> str | None:
        """Build product catalog answer."""

        products = self._extract_products(business_context)

        if not products:
            if not allow_no_data_answer:
                return None
            return self._no_product_data_answer(business_context)

        business_name = self._extract_business_name(business_context)
        header = "Berikut produk yang tercatat"
        if business_name:
            header += f" untuk {business_name}"

        lines = [f"{header}:"]
        for product in products[:10]:
            lines.append(f"- {self._format_product_line(product)}")

        remaining_count = len(products) - 10
        if remaining_count > 0:
            lines.append(f"... dan {remaining_count} produk lain.")

        return "\n".join(lines)

    def _build_best_selling_answer(self, business_context: Mapping[str, Any]) -> str:
        """Build best-selling product answer."""

        metrics = self._extract_product_metrics(
            business_context,
            container_keys=self.SALES_METRIC_CONTAINERS,
        )
        ranked = [
            metric
            for metric in metrics
            if metric.quantity_sold is not None or metric.value is not None
        ]
        ranked.sort(
            key=lambda metric: metric.quantity_sold or metric.value or Decimal("0"),
            reverse=True,
        )

        if not ranked:
            return (
                "Saya belum menemukan data jumlah terjual per produk. "
                "Data yang tersedia baru cukup untuk katalog produk, bukan ranking "
                "produk paling laku."
            )

        lines = ["Produk paling laku berdasarkan jumlah terjual:"]
        for metric in ranked[:10]:
            value = metric.quantity_sold or metric.value or Decimal("0")
            lines.append(f"- {metric.name} - terjual {self._format_number(value)} unit")

        return "\n".join(lines)

    def _build_high_revenue_answer(self, business_context: Mapping[str, Any]) -> str:
        """Build high-revenue product answer."""

        metrics = self._extract_product_metrics(
            business_context,
            container_keys=self.REVENUE_METRIC_CONTAINERS,
        )
        ranked = [
            metric
            for metric in metrics
            if metric.revenue is not None or metric.value is not None
        ]
        ranked.sort(
            key=lambda metric: metric.revenue or metric.value or Decimal("0"),
            reverse=True,
        )

        if not ranked:
            return (
                "Saya belum menemukan data omzet per produk. "
                "Data yang tersedia belum cukup untuk menentukan produk dengan "
                "omzet tertinggi."
            )

        lines = ["Produk dengan omzet penjualan tertinggi:"]
        for metric in ranked[:10]:
            revenue = metric.revenue or metric.value or Decimal("0")
            lines.append(f"- {metric.name} - omzet {self._format_currency(revenue)}")

        return "\n".join(lines)

    def _build_slow_moving_answer(self, business_context: Mapping[str, Any]) -> str:
        """Build slow-moving product answer."""

        metrics = self._extract_product_metrics(
            business_context,
            container_keys=self.SALES_METRIC_CONTAINERS,
        )
        ranked = [
            metric
            for metric in metrics
            if metric.quantity_sold is not None or metric.value is not None
        ]
        ranked.sort(key=lambda metric: metric.quantity_sold or metric.value or Decimal("0"))

        if ranked:
            lines = ["Produk dengan penjualan paling rendah dari data yang tersedia:"]
            for metric in ranked[:10]:
                value = metric.quantity_sold or metric.value or Decimal("0")
                lines.append(
                    f"- {metric.name} - terjual {self._format_number(value)} unit"
                )
            return "\n".join(lines)

        zero_sales = self._derive_zero_sales_products(business_context)
        if zero_sales:
            lines = [
                "Saya belum menemukan data penjualan lengkap per produk, "
                "tetapi produk berikut tidak muncul pada data penjualan yang tersedia:"
            ]
            for product in zero_sales[:10]:
                stock_text = self._format_optional_number(product.stock)
                lines.append(f"- {product.name} - stok {stock_text}")
            return "\n".join(lines)

        return (
            "Saya belum menemukan data penjualan per semua produk. "
            "Untuk menentukan produk kurang laku secara akurat, sistem perlu "
            "data quantity sold atau product performance untuk setiap produk."
        )

    def _build_zero_sales_answer(self, business_context: Mapping[str, Any]) -> str:
        """Build zero-sales product answer."""

        explicit_zero = [
            metric
            for metric in self._extract_product_metrics(
                business_context,
                container_keys=self.SALES_METRIC_CONTAINERS,
            )
            if (metric.quantity_sold is not None and metric.quantity_sold <= 0)
            or (metric.value is not None and metric.value <= 0)
        ]

        if explicit_zero:
            lines = ["Produk yang belum/tidak mencatat penjualan dari data tersedia:"]
            for metric in explicit_zero[:10]:
                lines.append(f"- {metric.name} - terjual 0 unit")
            return "\n".join(lines)

        derived_zero = self._derive_zero_sales_products(business_context)
        if derived_zero:
            lines = [
                "Produk berikut tidak muncul pada data penjualan yang tersedia. "
                "Perlu verifikasi dengan data transaksi lengkap sebelum menyimpulkan "
                "benar-benar tidak laku:"
            ]
            for product in derived_zero[:10]:
                stock_text = self._format_optional_number(product.stock)
                lines.append(f"- {product.name} - stok {stock_text}")
            return "\n".join(lines)

        return (
            "Saya belum menemukan data penjualan lengkap untuk menentukan produk "
            "yang benar-benar tidak laku. Saat ini data yang tersedia belum cukup "
            "untuk membedakan produk tidak laku dan produk yang hanya tidak masuk "
            "top ranking."
        )

    def _build_out_of_stock_answer(self, business_context: Mapping[str, Any]) -> str:
        """Build out-of-stock answer."""

        products = [
            product
            for product in self._extract_products(business_context)
            if product.stock is not None and product.stock <= 0
        ]

        if not products:
            return "Tidak ditemukan produk dengan stok habis dari konteks produk saat ini."

        lines = ["Produk dengan stok habis:"]
        for product in products[:10]:
            lines.append(f"- {self._format_product_line(product)}")

        return "\n".join(lines)

    def _build_low_stock_answer(self, business_context: Mapping[str, Any]) -> str:
        """Build low-stock answer."""

        low_stock_products: list[ProductInfo] = []

        for product in self._extract_products(business_context):
            if product.stock is None:
                continue

            if product.minimum_stock is not None:
                if product.stock <= product.minimum_stock:
                    low_stock_products.append(product)
            elif product.stock <= Decimal("10"):
                low_stock_products.append(product)

        low_stock_products.sort(key=lambda product: product.stock or Decimal("0"))

        if not low_stock_products:
            return (
                "Tidak ditemukan produk low stock dari konteks saat ini. "
                "Jika minimum_stock belum diisi, sistem memakai ambang sederhana "
                "stok <= 10 sebagai sinyal low stock."
            )

        lines = ["Produk yang perlu restock / low stock:"]
        for product in low_stock_products[:10]:
            min_stock = (
                f" minimum {self._format_number(product.minimum_stock)}"
                if product.minimum_stock is not None
                else ""
            )
            lines.append(
                f"- {product.name} - stok {self._format_number(product.stock)}{min_stock}"
            )

        return "\n".join(lines)

    def _build_overstock_answer(self, business_context: Mapping[str, Any]) -> str:
        """Build overstock answer."""

        overstock_products: list[ProductInfo] = []

        for product in self._extract_products(business_context):
            if product.stock is None:
                continue

            if product.minimum_stock is not None:
                threshold = product.minimum_stock * Decimal("3")
                if product.stock >= threshold and product.stock >= 30:
                    overstock_products.append(product)
            elif product.stock >= Decimal("100"):
                overstock_products.append(product)

        overstock_products.sort(
            key=lambda product: product.stock or Decimal("0"),
            reverse=True,
        )

        if not overstock_products:
            return (
                "Tidak ditemukan sinyal overstock dari konteks saat ini. "
                "Sinyal overstock dihitung dari stok sangat tinggi dibanding "
                "minimum_stock, atau stok >= 100 bila minimum_stock belum tersedia."
            )

        lines = ["Produk dengan sinyal overstock / stok menumpuk:"]
        for product in overstock_products[:10]:
            lines.append(f"- {product.name} - stok {self._format_number(product.stock)}")

        return "\n".join(lines)

    def _build_margin_answer(
        self,
        business_context: Mapping[str, Any],
        *,
        highest: bool,
    ) -> str:
        """Build product margin answer."""

        products_with_margin: list[tuple[ProductInfo, Decimal, Decimal]] = []

        for product in self._extract_products(business_context):
            if product.price is None or product.cost_price is None:
                continue

            margin = product.price - product.cost_price
            margin_percent = (
                (margin / product.price * Decimal("100"))
                if product.price > 0
                else Decimal("0")
            )
            products_with_margin.append((product, margin, margin_percent))

        if not products_with_margin:
            return (
                "Saya belum menemukan data harga jual dan harga modal yang lengkap "
                "untuk menghitung margin produk."
            )

        products_with_margin.sort(
            key=lambda item: item[1],
            reverse=highest,
        )

        title = (
            "Produk dengan margin tertinggi:"
            if highest
            else "Produk dengan margin terendah:"
        )
        lines = [title]
        for product, margin, margin_percent in products_with_margin[:10]:
            lines.append(
                f"- {product.name} - margin {self._format_currency(margin)} "
                f"({self._format_number(margin_percent)}%)"
            )

        return "\n".join(lines)

    def _build_business_health_answer(self, business_context: Mapping[str, Any]) -> str:
        """Build business health answer."""

        products = self._extract_products(business_context)
        out_of_stock = [
            product
            for product in products
            if product.stock is not None and product.stock <= 0
        ]
        low_stock = [
            product
            for product in products
            if product.stock is not None
            and (
                (product.minimum_stock is not None and product.stock <= product.minimum_stock)
                or (product.minimum_stock is None and product.stock <= 10)
            )
        ]
        best_selling = self._extract_product_metrics(
            business_context,
            container_keys=self.SALES_METRIC_CONTAINERS,
        )
        high_revenue = self._extract_product_metrics(
            business_context,
            container_keys=self.REVENUE_METRIC_CONTAINERS,
        )

        business_name = self._extract_business_name(business_context) or "bisnis ini"
        lines = [f"Ringkasan kesehatan bisnis untuk {business_name}:"]

        lines.append(f"- Produk aktif terdeteksi: {len(products)}.")
        lines.append(f"- Produk stok habis: {len(out_of_stock)}.")
        lines.append(f"- Produk low stock/perlu restock: {len(low_stock)}.")

        if best_selling:
            top = sorted(
                best_selling,
                key=lambda metric: metric.quantity_sold or metric.value or Decimal("0"),
                reverse=True,
            )[0]
            lines.append(f"- Produk paling laku: {top.name}.")

        if high_revenue:
            top_revenue = sorted(
                high_revenue,
                key=lambda metric: metric.revenue or metric.value or Decimal("0"),
                reverse=True,
            )[0]
            lines.append(f"- Kontributor omzet tertinggi: {top_revenue.name}.")

        if out_of_stock or low_stock:
            lines.append(
                "- Prioritas tindakan: cek restock produk stok habis/low stock "
                "sebelum menjalankan promosi besar."
            )
        else:
            lines.append(
                "- Prioritas tindakan: pantau produk kurang laku dan dorong "
                "campaign untuk produk dengan stok tinggi."
            )

        return "\n".join(lines)

    def _build_alert_summary_answer(self, business_context: Mapping[str, Any]) -> str:
        """Build alert summary answer."""

        alerts = self._extract_alerts(business_context)
        out_of_stock_answer = self._build_out_of_stock_answer(business_context)
        low_stock_answer = self._build_low_stock_answer(business_context)

        lines = ["Ringkasan alert bisnis:"]

        if alerts:
            lines.append("Alert dari dashboard/konteks:")
            for alert in alerts[:8]:
                lines.append(f"- {alert}")

        if "Tidak ditemukan" not in out_of_stock_answer:
            lines.append("")
            lines.append(out_of_stock_answer)

        if "Tidak ditemukan" not in low_stock_answer:
            lines.append("")
            lines.append(low_stock_answer)

        if len(lines) == 1:
            lines.append(
                "- Belum ada alert eksplisit dari konteks saat ini. "
                "Tetap pantau stok, produk slow moving, dan produk terlaris."
            )

        return "\n".join(lines)

    def _build_follow_up_answer(
        self,
        conversation_history: list[Mapping[str, Any]],
    ) -> str:
        """Build safe follow-up answer."""

        last_assistant = self._last_assistant_message(conversation_history)
        if last_assistant:
            return (
                "Saya menangkap ini sebagai pertanyaan lanjutan, tetapi saya perlu "
                "metrik yang lebih spesifik agar tidak salah membaca konteks. "
                "Coba tanyakan salah satu: produk paling laku, produk tidak laku, "
                "stok habis, low stock, overstock, margin tertinggi, atau kesehatan bisnis."
            )

        return (
            "Saya butuh konteks tambahan untuk pertanyaan lanjutan itu. "
            "Silakan sebutkan metriknya, misalnya: produk tidak laku, stok habis, "
            "low stock, margin tertinggi, atau produk paling laku."
        )

    def _extract_products(self, business_context: Mapping[str, Any]) -> list[ProductInfo]:
        """Extract products only from explicit product containers."""

        products: list[ProductInfo] = []
        seen_names: set[str] = set()

        for item in self._iter_container_items(
            business_context,
            container_keys=self.PRODUCT_CONTAINERS,
        ):
            if not isinstance(item, Mapping):
                continue

            product = self._coerce_product(item)
            if product is None:
                continue

            name_key = self._normalize_text(product.name)
            if name_key in seen_names:
                continue

            seen_names.add(name_key)
            products.append(product)

        return products

    def _coerce_product(self, item: Mapping[str, Any]) -> ProductInfo | None:
        """Coerce mapping into ProductInfo."""

        name = self._first_non_empty_value(item, keys=self.PRODUCT_NAME_KEYS)
        if not name:
            return None

        return ProductInfo(
            name=name,
            price=self._first_decimal(item, keys=self.PRODUCT_PRICE_KEYS),
            cost_price=self._first_decimal(item, keys=self.PRODUCT_COST_KEYS),
            stock=self._first_decimal(item, keys=self.PRODUCT_STOCK_KEYS),
            minimum_stock=self._first_decimal(item, keys=self.PRODUCT_MIN_STOCK_KEYS),
            sku=self._first_non_empty_value(item, keys=self.PRODUCT_SKU_KEYS),
            category=self._first_non_empty_value(item, keys=self.PRODUCT_CATEGORY_KEYS),
            product_id=self._first_non_empty_value(item, keys=self.PRODUCT_ID_KEYS),
        )

    def _extract_product_metrics(
        self,
        business_context: Mapping[str, Any],
        *,
        container_keys: Sequence[str],
    ) -> list[ProductMetric]:
        """Extract product performance metrics."""

        metrics: list[ProductMetric] = []
        seen_names: set[str] = set()

        for item in self._iter_container_items(
            business_context,
            container_keys=container_keys,
        ):
            if not isinstance(item, Mapping):
                continue

            metric = self._coerce_product_metric(item)
            if metric is None:
                continue

            key = self._normalize_text(metric.name)
            if key in seen_names:
                continue

            seen_names.add(key)
            metrics.append(metric)

        return metrics

    def _coerce_product_metric(self, item: Mapping[str, Any]) -> ProductMetric | None:
        """Coerce mapping into ProductMetric."""

        name = self._first_non_empty_value(item, keys=self.METRIC_NAME_KEYS)
        if not name:
            return None

        quantity = self._first_decimal(item, keys=self.METRIC_QUANTITY_KEYS)
        revenue = self._first_decimal(item, keys=self.METRIC_REVENUE_KEYS)
        value = quantity or revenue

        return ProductMetric(
            name=name,
            quantity_sold=quantity,
            revenue=revenue,
            value=value,
        )

    def _derive_zero_sales_products(
        self,
        business_context: Mapping[str, Any],
    ) -> list[ProductInfo]:
        """Conservatively derive products absent from available sales metrics."""

        products = self._extract_products(business_context)
        metrics = self._extract_product_metrics(
            business_context,
            container_keys=self.SALES_METRIC_CONTAINERS,
        )

        if not products or not metrics:
            return []

        # Only infer absence as possible zero-sales when performance coverage
        # appears complete enough. A short top-5 list is not enough.
        if len(metrics) < max(10, len(products) // 2):
            return []

        sold_names = {self._normalize_text(metric.name) for metric in metrics}
        return [
            product
            for product in products
            if self._normalize_text(product.name) not in sold_names
        ]

    def _extract_alerts(self, business_context: Mapping[str, Any]) -> list[str]:
        """Extract alert strings from explicit alert containers."""

        alerts: list[str] = []

        for item in self._iter_container_items(
            business_context,
            container_keys=self.ALERT_CONTAINERS,
        ):
            if isinstance(item, str) and item.strip():
                alerts.append(item.strip())
            elif isinstance(item, Mapping):
                message = self._first_non_empty_value(
                    item,
                    keys=("message", "title", "description", "alert", "warning"),
                )
                if message:
                    alerts.append(message)

        # Also derive stock alerts so English dashboard alerts become useful.
        products = self._extract_products(business_context)
        out_count = len(
            [
                product
                for product in products
                if product.stock is not None and product.stock <= 0
            ]
        )
        low_count = len(
            [
                product
                for product in products
                if product.stock is not None
                and (
                    (
                        product.minimum_stock is not None
                        and product.stock <= product.minimum_stock
                    )
                    or (product.minimum_stock is None and product.stock <= 10)
                )
            ]
        )

        if out_count:
            alerts.append(f"Ada {out_count} produk dengan stok habis.")
        if low_count:
            alerts.append(f"Ada {low_count} produk dengan stok rendah/perlu restock.")

        return alerts

    def _iter_container_items(
        self,
        value: Any,
        *,
        container_keys: Sequence[str],
        depth: int = 0,
        max_depth: int = 5,
    ) -> list[Any]:
        """Return list items from explicitly named containers."""

        if depth > max_depth:
            return []

        items: list[Any] = []

        if isinstance(value, Mapping):
            for key, nested_value in value.items():
                if str(key).lower() in {name.lower() for name in container_keys}:
                    if isinstance(nested_value, list):
                        items.extend(nested_value)
                    elif isinstance(nested_value, Mapping):
                        nested_items = nested_value.get("items") or nested_value.get("data")
                        if isinstance(nested_items, list):
                            items.extend(nested_items)
                        else:
                            items.append(nested_value)

                items.extend(
                    self._iter_container_items(
                        nested_value,
                        container_keys=container_keys,
                        depth=depth + 1,
                        max_depth=max_depth,
                    )
                )

        elif isinstance(value, list):
            for nested_value in value:
                items.extend(
                    self._iter_container_items(
                        nested_value,
                        container_keys=container_keys,
                        depth=depth + 1,
                        max_depth=max_depth,
                    )
                )

        return items

    def _format_product_line(self, product: ProductInfo) -> str:
        """Format one product line."""

        parts = [product.name]

        if product.price is not None:
            parts.append(f"harga {self._format_currency(product.price)}")

        if product.stock is not None:
            parts.append(f"stok {self._format_number(product.stock)}")

        if product.sku:
            parts.append(f"SKU {product.sku}")

        return " - ".join(parts)

    def _no_product_data_answer(self, business_context: Mapping[str, Any]) -> str:
        """Return no product data answer."""

        business_name = self._extract_business_name(business_context)
        suffix = f" untuk {business_name}" if business_name else ""
        return (
            f"Saya belum menemukan daftar produk{suffix} dalam konteks AI saat ini. "
            "Data produk kemungkinan belum ikut dikirim ke AI Conversation, atau "
            "belum ada produk aktif yang tercatat."
        )

    def _extract_business_name(self, business_context: Mapping[str, Any]) -> str:
        """Extract business name from context."""

        return self._first_non_empty_value(
            business_context,
            keys=(
                "business_name",
                "name",
                "nama_usaha",
                "store_name",
                "company_name",
                "brand_name",
            ),
        )

    def _last_assistant_message(
        self,
        conversation_history: list[Mapping[str, Any]],
    ) -> str:
        """Return last assistant message."""

        for message in reversed(conversation_history):
            role = str(message.get("role") or "").lower()
            if role != "assistant":
                continue

            content = str(message.get("content") or message.get("message") or "").strip()
            if content:
                return content

        return ""

    def _first_non_empty_value(
        self,
        mapping: Mapping[str, Any],
        *,
        keys: Sequence[str],
    ) -> str:
        """Find first non-empty value by case-insensitive keys."""

        lowered_keys = {str(key).lower(): key for key in mapping.keys()}

        for key in keys:
            actual_key = lowered_keys.get(str(key).lower())
            if actual_key is None:
                continue

            value = mapping.get(actual_key)
            if value is None:
                continue

            if isinstance(value, (str, int, float, Decimal)):
                text = str(value).strip()
                if text:
                    return text

        return ""

    def _first_decimal(
        self,
        mapping: Mapping[str, Any],
        *,
        keys: Sequence[str],
    ) -> Decimal | None:
        """Find first decimal value."""

        for key in keys:
            value = self._first_raw_value(mapping, key=key)
            number = self._to_decimal(value)
            if number is not None:
                return number

        return None

    def _first_raw_value(self, mapping: Mapping[str, Any], *, key: str) -> Any:
        """Find raw value by case-insensitive key."""

        lowered_keys = {str(item_key).lower(): item_key for item_key in mapping.keys()}
        actual_key = lowered_keys.get(str(key).lower())
        if actual_key is None:
            return None

        return mapping.get(actual_key)

    def _to_decimal(self, value: Any) -> Decimal | None:
        """Convert value to Decimal."""

        if isinstance(value, bool) or value is None:
            return None

        try:
            return Decimal(str(value))
        except (InvalidOperation, ValueError, TypeError):
            return None

    def _format_currency(self, value: Decimal | int | float | str | None) -> str:
        """Format currency-like value."""

        number = self._to_decimal(value)
        if number is None:
            return "Rp0"

        return f"Rp{number:,.0f}".replace(",", ".")

    def _format_number(self, value: Decimal | int | float | str | None) -> str:
        """Format number."""

        number = self._to_decimal(value)
        if number is None:
            return "0"

        return f"{number:,.0f}".replace(",", ".")

    def _format_optional_number(self, value: Decimal | None) -> str:
        """Format optional number."""

        if value is None:
            return "-"

        return self._format_number(value)

    def _is_greeting(self, normalized_input: str) -> bool:
        """Return whether input is a simple greeting."""

        greetings = {
            "hi",
            "hai",
            "halo",
            "hello",
            "hallo",
            "selamat pagi",
            "selamat siang",
            "selamat sore",
            "selamat malam",
            "pagi",
            "siang",
            "sore",
            "malam",
        }

        return normalized_input in greetings

    def _is_product_query(self, normalized_input: str) -> bool:
        """Return whether input asks about product catalog."""

        product_markers = (
            "produk",
            "barang",
            "menu",
            "jualan",
            "jual",
            "dijual",
            "dagang",
        )
        question_markers = (
            "apa",
            "apa saja",
            "mana",
            "daftar",
            "list",
            "sebut",
            "tampilkan",
        )

        return self._contains_any(normalized_input, product_markers) and self._contains_any(
            normalized_input,
            question_markers,
        )

    def _is_business_identity_query(self, normalized_input: str) -> bool:
        """Return whether input asks about the app/business."""

        return self._contains_any(
            normalized_input,
            (
                "aplikasi apa",
                "ini aplikasi apa",
                "bisnis apa",
                "usaha apa",
                "nama bisnis",
                "profil bisnis",
            ),
        )

    def _contains_any(self, text: str, markers: Sequence[str]) -> bool:
        """Return whether any marker exists in text."""

        return any(marker in text for marker in markers)

    def _normalize_text(self, value: str) -> str:
        """Normalize text."""

        return " ".join(value.lower().strip().split())

    def _success_response(self, answer: str) -> dict[str, Any]:
        """Build successful local BI response."""

        return {
            "success": True,
            "data": {
                "answer": answer,
                "text": answer,
                "provider": self.LOCAL_PROVIDER_NAME,
                "model": self.LOCAL_MODEL_NAME,
            },
            "error": None,
        }

    def _validate_user_input(self, user_input: str) -> None:
        """Validate user input."""

        if not isinstance(user_input, str) or not user_input.strip():
            raise ValueError("user_input is required.")

    def _friendly_error_response(
        self,
        *,
        error_type: str = "AIServiceUnavailable",
    ) -> dict[str, Any]:
        """Build user-safe error response."""

        return {
            "success": False,
            "data": {},
            "error": {
                "type": error_type,
                "message": self.FRIENDLY_FALLBACK_TEXT,
            },
        }
