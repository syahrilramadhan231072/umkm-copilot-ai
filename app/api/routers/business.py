"""
Business Router
===============

HTTP endpoints for business workflows and business profile discovery.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from fastapi import APIRouter, Depends, Query

from app.api.dependencies import get_business_service, get_business_workflow
from app.api.response import build_api_response, build_exception_response
from app.api.schemas import BusinessHealthCheckRequest, BusinessOverviewRequest
from app.services.business_service import BusinessService
from app.workflows.business_workflow import BusinessWorkflow

router = APIRouter(prefix="/business", tags=["business"])


@router.get("/profiles")
def list_business_profiles(
    limit: int = Query(default=100, ge=1, le=1000),
    service: BusinessService = Depends(get_business_service),
) -> dict[str, Any]:
    """
    Return business profiles available to the current application context.

    This endpoint is intentionally read-only. It exists so the Streamlit
    frontend can hydrate its active business state from the backend source of
    truth instead of relying only on transient Streamlit session_state.
    """

    try:
        profiles = service.list_business_profiles(limit=limit)
        normalized_profiles = [_normalize_business_profile(profile) for profile in profiles]

        return build_api_response(
            {
                "success": True,
                "data": {
                    "businesses": normalized_profiles,
                    "business_profiles": normalized_profiles,
                    "count": len(normalized_profiles),
                },
                "error": None,
            }
        )
    except Exception as exc:
        return build_exception_response(exc)


@router.get("/active-profile")
def get_active_business_profile(
    service: BusinessService = Depends(get_business_service),
) -> dict[str, Any]:
    """
    Return the active business profile.

    The existing service defines the active business as the profile returned by
    BusinessService.get_business_profile().
    """

    try:
        profile = service.get_business_profile()
        return build_api_response(
            {
                "success": True,
                "data": _normalize_business_profile(profile),
                "error": None,
            }
        )
    except Exception as exc:
        return build_exception_response(exc)


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


def _normalize_business_profile(profile: Mapping[str, Any]) -> dict[str, Any]:
    """Normalize a repository business profile for frontend consumption."""

    business_id = profile.get("business_id") or profile.get("id") or profile.get("uuid") or ""

    return {
        "business_id": str(business_id).strip(),
        "business_name": str(profile.get("business_name") or "").strip(),
        "owner_name": str(profile.get("owner_name") or "").strip(),
        "business_type": str(profile.get("business_type") or "").strip(),
        "currency": str(profile.get("currency") or "IDR").strip(),
        "timezone": str(profile.get("timezone") or "Asia/Jakarta").strip(),
        "language": str(profile.get("language") or "Bahasa Indonesia").strip(),
        "address": profile.get("address"),
        "created_at": profile.get("created_at"),
        "updated_at": profile.get("updated_at"),
    }
