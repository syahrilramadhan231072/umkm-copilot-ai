"""
API Schemas
===========

Pydantic request schemas for UMKM Copilot AI API Layer.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from pydantic import BaseModel, Field


class RouteRequest(BaseModel):
    """Request schema for router agent."""

    user_input: str = Field(..., description="User input text.")
    payload: dict[str, Any] = Field(default_factory=dict)
    explicit_route: str | None = Field(default=None)


class BusinessOverviewRequest(BaseModel):
    """Request schema for business overview."""

    business_id: str
    limit: int = 1000
    session_id: str | None = None


class BusinessHealthCheckRequest(BaseModel):
    """Request schema for business health check."""

    business_id: str
    limit: int = 1000
    session_id: str | None = None


class RecordTransactionRequest(BaseModel):
    """Request schema for recording a transaction."""

    business_id: str
    product_id: str
    quantity: int
    payment_method: str = "cash"
    status: str = "completed"
    notes: str | None = None
    session_id: str | None = None
    user_message: str | None = None


class RecordTransactionPayloadRequest(BaseModel):
    """Request schema for recording a transaction from payload."""

    transaction_data: dict[str, Any]


class MarketingContextRequest(BaseModel):
    """Request schema for marketing context."""

    product_id: str
    business_id: str | None = None
    session_id: str | None = None
    user_message: str | None = None


class CreateMarketingRecordRequest(BaseModel):
    """Request schema for creating marketing record."""

    business_id: str
    marketing_data: dict[str, Any]
    session_id: str | None = None
    user_message: str | None = None


class InsightContextRequest(BaseModel):
    """Request schema for insight context."""

    business_id: str
    limit: int = 100
    session_id: str | None = None
    user_message: str | None = None


class CreateInsightRecordRequest(BaseModel):
    """Request schema for creating insight record."""

    business_id: str
    insight_data: dict[str, Any]
    session_id: str | None = None
    user_message: str | None = None


class ExportRequest(BaseModel):
    """Request schema for export endpoints."""

    business_id: str
    export_format: str = "json"
    limit: int = 1000
    session_id: str | None = None
    user_message: str | None = None


class ExportStructuredDataRequest(BaseModel):
    """Request schema for exporting supplied structured data."""

    data_to_export: dict[str, Any] | list[dict[str, Any]]
    export_format: str = "json"
    filename_prefix: str = "export"
