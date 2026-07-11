"""
Marketing Router
================

HTTP endpoints for MarketingAgent.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from fastapi import APIRouter, Depends

from app.agents.marketing_agent import MarketingAgent
from app.api.dependencies import get_marketing_agent
from app.api.response import build_api_response, build_exception_response
from app.api.schemas import CreateMarketingRecordRequest, MarketingContextRequest

router = APIRouter(prefix="/marketing", tags=["marketing"])


@router.post("/context")
def marketing_context(
    request: MarketingContextRequest,
    agent: MarketingAgent = Depends(get_marketing_agent),
) -> dict[str, Any]:
    """
    Build marketing context.

    Args:
        request: Marketing context request.
        agent: MarketingAgent dependency.

    Returns:
        API response.
    """

    try:
        response = agent.build_marketing_context(
            product_id=request.product_id,
            business_id=request.business_id,
            session_id=request.session_id,
        )
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)


@router.post("/records")
def create_marketing_record(
    request: CreateMarketingRecordRequest,
    agent: MarketingAgent = Depends(get_marketing_agent),
) -> dict[str, Any]:
    """
    Create marketing record.

    Args:
        request: Create marketing record request.
        agent: MarketingAgent dependency.

    Returns:
        API response.
    """

    try:
        response = agent.create_marketing_record(
            business_id=request.business_id,
            marketing_data=request.marketing_data,
            session_id=request.session_id,
        )
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)


@router.get("/history/{business_id}")
def marketing_history(
    business_id: str,
    keyword: str | None = None,
    limit: int = 100,
    agent: MarketingAgent = Depends(get_marketing_agent),
) -> dict[str, Any]:
    """
    Review marketing history.

    Args:
        business_id: Business identifier.
        keyword: Optional caption keyword.
        limit: Maximum number of records read.
        agent: MarketingAgent dependency.

    Returns:
        API response.
    """

    try:
        response = agent.handle_marketing(
            {
                "business_id": business_id,
                "keyword": keyword,
                "limit": limit,
            },
            intent="marketing_history",
        )
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)
