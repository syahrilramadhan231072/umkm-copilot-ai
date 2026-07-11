"""
Router Agent Router
===================

HTTP endpoints for RouterAgent.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from fastapi import APIRouter, Depends

from app.agents.router_agent import RouterAgent
from app.api.dependencies import get_router_agent
from app.api.response import build_api_response, build_exception_response
from app.api.schemas import RouteRequest

router = APIRouter(prefix="/router", tags=["router"])


@router.post("/route")
def route_request(
    request: RouteRequest,
    router_agent: RouterAgent = Depends(get_router_agent),
) -> dict[str, Any]:
    """
    Route user request to the proper domain agent.

    Args:
        request: Route request.
        router_agent: RouterAgent dependency.

    Returns:
        API response.
    """

    try:
        response = router_agent.route(
            user_input=request.user_input,
            payload=request.payload,
            explicit_route=request.explicit_route,
        )
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)
