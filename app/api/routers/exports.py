"""
Exports Router
==============

HTTP endpoints for ExportAgent.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from fastapi import APIRouter, Depends

from app.agents.export_agent import ExportAgent
from app.api.dependencies import get_export_agent
from app.api.response import build_api_response, build_exception_response
from app.api.schemas import ExportRequest, ExportStructuredDataRequest

router = APIRouter(prefix="/exports", tags=["exports"])


@router.post("/dashboard")
def export_dashboard(
    request: ExportRequest,
    agent: ExportAgent = Depends(get_export_agent),
) -> dict[str, Any]:
    """
    Export dashboard.

    Args:
        request: Export request.
        agent: ExportAgent dependency.

    Returns:
        API response.
    """

    try:
        response = agent.export_dashboard(
            business_id=request.business_id,
            export_format=request.export_format,
            limit=request.limit,
            session_id=request.session_id,
        )
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)


@router.post("/sales-summary")
def export_sales_summary(
    request: ExportRequest,
    agent: ExportAgent = Depends(get_export_agent),
) -> dict[str, Any]:
    """
    Export sales summary.

    Args:
        request: Export request.
        agent: ExportAgent dependency.

    Returns:
        API response.
    """

    try:
        response = agent.export_sales_summary(
            business_id=request.business_id,
            export_format=request.export_format,
            limit=request.limit,
            session_id=request.session_id,
        )
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)


@router.post("/inventory-summary")
def export_inventory_summary(
    request: ExportRequest,
    agent: ExportAgent = Depends(get_export_agent),
) -> dict[str, Any]:
    """
    Export inventory summary.

    Args:
        request: Export request.
        agent: ExportAgent dependency.

    Returns:
        API response.
    """

    try:
        response = agent.handle_export(
            {
                "business_id": request.business_id,
                "export_format": request.export_format,
                "limit": request.limit,
                "session_id": request.session_id,
            },
            intent="export_inventory_summary",
        )
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)


@router.post("/structured")
def export_structured_data(
    request: ExportStructuredDataRequest,
    agent: ExportAgent = Depends(get_export_agent),
) -> dict[str, Any]:
    """
    Export structured data.

    Args:
        request: Structured export request.
        agent: ExportAgent dependency.

    Returns:
        API response.
    """

    try:
        response = agent.handle_export(
            {
                "data_to_export": request.data_to_export,
                "export_format": request.export_format,
                "filename_prefix": request.filename_prefix,
            },
            intent="export_structured_data",
        )
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)
