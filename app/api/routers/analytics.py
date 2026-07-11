"""
Analytics Router
================

HTTP endpoints for AnalyticsTools.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from fastapi import APIRouter, Depends

from app.api.dependencies import get_analytics_tools
from app.api.response import build_api_response, build_exception_response
from app.tools.analytics_tools import AnalyticsTools

router = APIRouter(prefix="/analytics", tags=["analytics"])


@router.get("/dashboard/{business_id}")
def dashboard_payload(
    business_id: str,
    limit: int = 1000,
    tools: AnalyticsTools = Depends(get_analytics_tools),
) -> dict[str, Any]:
    """
    Build dashboard analytics payload.

    Args:
        business_id: Business identifier.
        limit: Maximum number of records read.
        tools: AnalyticsTools dependency.

    Returns:
        API response.
    """

    try:
        response = tools.build_dashboard_payload(business_id=business_id, limit=limit)
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)


@router.get("/sales/{business_id}")
def sales_summary(
    business_id: str,
    limit: int = 1000,
    tools: AnalyticsTools = Depends(get_analytics_tools),
) -> dict[str, Any]:
    """
    Get sales summary.

    Args:
        business_id: Business identifier.
        limit: Maximum number of records read.
        tools: AnalyticsTools dependency.

    Returns:
        API response.
    """

    try:
        response = tools.get_sales_summary(business_id=business_id, limit=limit)
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)


@router.get("/inventory/{business_id}")
def inventory_summary(
    business_id: str,
    limit: int = 1000,
    tools: AnalyticsTools = Depends(get_analytics_tools),
) -> dict[str, Any]:
    """
    Get inventory summary.

    Args:
        business_id: Business identifier.
        limit: Maximum number of records read.
        tools: AnalyticsTools dependency.

    Returns:
        API response.
    """

    try:
        response = tools.get_inventory_summary(business_id=business_id, limit=limit)
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)


@router.get("/products/{business_id}")
def product_summary(
    business_id: str,
    limit: int = 1000,
    tools: AnalyticsTools = Depends(get_analytics_tools),
) -> dict[str, Any]:
    """
    Get product summary.

    Args:
        business_id: Business identifier.
        limit: Maximum number of records read.
        tools: AnalyticsTools dependency.

    Returns:
        API response.
    """

    try:
        response = tools.get_product_summary(business_id=business_id, limit=limit)
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)


@router.get("/customers/{business_id}")
def customer_summary(
    business_id: str,
    limit: int = 1000,
    tools: AnalyticsTools = Depends(get_analytics_tools),
) -> dict[str, Any]:
    """
    Get customer summary.

    Args:
        business_id: Business identifier.
        limit: Maximum number of records read.
        tools: AnalyticsTools dependency.

    Returns:
        API response.
    """

    try:
        response = tools.get_customer_summary(business_id=business_id, limit=limit)
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)
