"""
Insights Router
===============

HTTP endpoints for InsightAgent.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from fastapi import APIRouter, Depends

from app.agents.insight_agent import InsightAgent
from app.api.dependencies import get_insight_agent
from app.api.response import build_api_response, build_exception_response
from app.api.schemas import CreateInsightRecordRequest, InsightContextRequest

router = APIRouter(prefix="/insights", tags=["insights"])


@router.post("/context")
def insight_context(
    request: InsightContextRequest,
    agent: InsightAgent = Depends(get_insight_agent),
) -> dict[str, Any]:
    """
    Build insight context.

    Args:
        request: Insight context request.
        agent: InsightAgent dependency.

    Returns:
        API response.
    """

    try:
        response = agent.build_insight_context(
            business_id=request.business_id,
            limit=request.limit,
            session_id=request.session_id,
        )
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)


@router.post("/records")
def create_insight_record(
    request: CreateInsightRecordRequest,
    agent: InsightAgent = Depends(get_insight_agent),
) -> dict[str, Any]:
    """
    Create insight record.

    Args:
        request: Create insight record request.
        agent: InsightAgent dependency.

    Returns:
        API response.
    """

    try:
        response = agent.create_insight(
            business_id=request.business_id,
            insight_data=request.insight_data,
            session_id=request.session_id,
        )
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)


@router.get("/review/{business_id}")
def insight_review(
    business_id: str,
    insight_category: str | None = None,
    keyword: str | None = None,
    limit: int = 100,
    agent: InsightAgent = Depends(get_insight_agent),
) -> dict[str, Any]:
    """
    Review insights.

    Args:
        business_id: Business identifier.
        insight_category: Optional insight category.
        keyword: Optional title keyword.
        limit: Maximum number of records read.
        agent: InsightAgent dependency.

    Returns:
        API response.
    """

    try:
        response = agent.handle_insight(
            {
                "business_id": business_id,
                "insight_category": insight_category,
                "keyword": keyword,
                "limit": limit,
            },
            intent="insight_review",
        )
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)
