"""
FastAPI Application
===================

FastAPI application entry point for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from fastapi import FastAPI

from app.api.routers import analytics, business, exports, health, insights
from app.api.routers import marketing, router, transactions


def create_app() -> FastAPI:
    """
    Create FastAPI application.

    Returns:
        Configured FastAPI app.
    """

    app = FastAPI(
        title="UMKM Copilot AI API",
        description="HTTP API for UMKM Copilot AI.",
        version="1.0.0",
    )

    app.include_router(health.router)
    app.include_router(router.router, prefix="/api/v1")
    app.include_router(business.router, prefix="/api/v1")
    app.include_router(transactions.router, prefix="/api/v1")
    app.include_router(marketing.router, prefix="/api/v1")
    app.include_router(insights.router, prefix="/api/v1")
    app.include_router(analytics.router, prefix="/api/v1")
    app.include_router(exports.router, prefix="/api/v1")

    return app


app = create_app()
