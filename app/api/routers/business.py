"""
Business Router
===============

HTTP endpoints for business workflows.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from fastapi import APIRouter, Depends

from app.api.dependencies import get_business_workflow
from app.api.response import build_api_response, build_exception_response
from app.api.schemas import BusinessHealthCheckRequest, BusinessOverviewRequest
from app.workflows.business_workflow import BusinessWorkflow

router = APIRouter(prefix="/business", tags=["business"])


@router.post("/overview")
def business_overview(
    request: BusinessOverviewRequest,
    workflow: BusinessWorkflow = Depends(get_business_workflow),
) -> dict[str, Any]:
    """
    Run business overview workflow.

    Args:
        request: Business overview request.
        workflow: BusinessWorkflow dependency.

    Returns:
        API response.
    """

    try:
        response = workflow.run_business_overview(
            business_id=request.business_id,
            limit=request.limit,
            session_id=request.session_id,
        )
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)


@router.post("/health-check")
def business_health_check(
    request: BusinessHealthCheckRequest,
    workflow: BusinessWorkflow = Depends(get_business_workflow),
) -> dict[str, Any]:
    """
    Run business health check workflow.

    Args:
        request: Business health check request.
        workflow: BusinessWorkflow dependency.

    Returns:
        API response.
    """

    try:
        response = workflow.run_business_health_check(
            business_id=request.business_id,
            limit=request.limit,
            session_id=request.session_id,
        )
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)
