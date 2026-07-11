"""
Transactions Router
===================

HTTP endpoints for TransactionAgent.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any

from fastapi import APIRouter, Depends

from app.agents.transaction_agent import TransactionAgent
from app.api.dependencies import get_transaction_agent
from app.api.response import build_api_response, build_exception_response
from app.api.schemas import RecordTransactionPayloadRequest, RecordTransactionRequest

router = APIRouter(prefix="/transactions", tags=["transactions"])


@router.post("/record")
def record_transaction(
    request: RecordTransactionRequest,
    agent: TransactionAgent = Depends(get_transaction_agent),
) -> dict[str, Any]:
    """
    Record transaction.

    Args:
        request: Record transaction request.
        agent: TransactionAgent dependency.

    Returns:
        API response.
    """

    try:
        response = agent.record_transaction(request.model_dump())
        return build_api_response(response)
    except AttributeError:
        response = agent.record_transaction(request.dict())
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)


@router.post("/record-payload")
def record_transaction_payload(
    request: RecordTransactionPayloadRequest,
    agent: TransactionAgent = Depends(get_transaction_agent),
) -> dict[str, Any]:
    """
    Record transaction from structured transaction payload.

    Args:
        request: Record transaction payload request.
        agent: TransactionAgent dependency.

    Returns:
        API response.
    """

    try:
        response = agent.handle_transaction(
            request.transaction_data,
            intent="record_transaction_from_payload",
        )
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)


@router.get("/summary/{business_id}")
def transaction_summary(
    business_id: str,
    limit: int = 1000,
    agent: TransactionAgent = Depends(get_transaction_agent),
) -> dict[str, Any]:
    """
    Refresh transaction summary.

    Args:
        business_id: Business identifier.
        limit: Maximum number of records read.
        agent: TransactionAgent dependency.

    Returns:
        API response.
    """

    try:
        response = agent.refresh_transaction_summary(
            business_id=business_id,
            limit=limit,
        )
        return build_api_response(response)
    except Exception as exc:
        return build_exception_response(exc)
