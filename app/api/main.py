"""
FastAPI Application
===================

Entry point API UMKM Copilot AI.
"""

from __future__ import annotations

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.api.routers import analytics
from app.api.routers import business
from app.api.routers import exports
from app.api.routers import health
from app.api.routers import insights
from app.api.routers import marketing
from app.api.routers import onboarding
from app.api.routers import router as router_agent
from app.api.routers import transactions


def create_app() -> FastAPI:
    """Buat aplikasi FastAPI."""

    app = FastAPI(
        title="UMKM Copilot AI API",
        description="Backend API untuk UMKM Copilot AI.",
        version="1.0.0",
    )

    app.add_middleware(
        CORSMiddleware,
        allow_origins=["*"],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    app.include_router(health.router)
    app.include_router(analytics.router)
    app.include_router(business.router)
    app.include_router(onboarding.router)
    app.include_router(transactions.router)
    app.include_router(marketing.router)
    app.include_router(insights.router)
    app.include_router(exports.router)
    app.include_router(router_agent.router)

    return app


app = create_app()
