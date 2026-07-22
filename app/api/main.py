"""
FastAPI Application
===================

Production-ready FastAPI entry point for Go-UMKM AI.

This module only wires the API application. It does not contain business logic
and does not bypass the approved architecture:

Repository -> Service -> Tools -> Workflow -> Agent -> FastAPI -> Streamlit
"""

from __future__ import annotations

from collections.abc import Sequence
from contextlib import asynccontextmanager
from typing import Any

from fastapi import FastAPI, HTTPException, Request
from fastapi.exceptions import RequestValidationError
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse

from app.api.routers import (
    analytics,
    business,
    exports,
    health,
    insights,
    marketing,
    onboarding,
    transactions,
)
from app.api.routers import router as router_agent
from app.config.settings import get_settings
from app.utils.logger import logger

API_V1_PREFIX = "/api/v1"


@asynccontextmanager
async def lifespan(app: FastAPI):  # type: ignore[no-untyped-def]
    """Log startup and graceful shutdown lifecycle events."""

    settings = get_settings()
    logger.info(
        "Starting {} version={} environment={} debug={}.",
        settings.APP_NAME,
        settings.APP_VERSION,
        settings.APP_ENV,
        settings.APP_DEBUG,
    )
    logger.info("OpenAPI endpoint enabled at {}.", app.openapi_url)
    logger.info("Swagger UI endpoint enabled at {}.", app.docs_url)

    try:
        yield
    finally:
        logger.info("Shutting down {} gracefully.", settings.APP_NAME)


def create_app() -> FastAPI:
    """Create the FastAPI application."""

    settings = get_settings()

    app = FastAPI(
        title=settings.APP_NAME,
        description="Backend API for Go-UMKM AI.",
        version=settings.APP_VERSION,
        debug=settings.APP_DEBUG,
        docs_url="/docs",
        redoc_url="/redoc",
        openapi_url="/openapi.json",
        lifespan=lifespan,
    )

    _configure_cors(app, settings.CORS_ALLOWED_ORIGINS)
    _register_exception_handlers(app)
    _include_routers(app)

    return app


def _configure_cors(app: FastAPI, allowed_origins_raw: str) -> None:
    """Configure CORS using environment variables."""

    allowed_origins = _parse_allowed_origins(allowed_origins_raw)
    allow_credentials = "*" not in allowed_origins

    app.add_middleware(
        CORSMiddleware,
        allow_origins=allowed_origins,
        allow_credentials=allow_credentials,
        allow_methods=["*"],
        allow_headers=["*"],
    )


def _parse_allowed_origins(raw_value: str) -> list[str]:
    """Parse comma-separated CORS origins."""

    if not isinstance(raw_value, str) or not raw_value.strip():
        return ["*"]

    origins = [origin.strip() for origin in raw_value.split(",") if origin.strip()]

    return origins or ["*"]


def _register_exception_handlers(app: FastAPI) -> None:
    """Register safe API exception handlers."""

    @app.exception_handler(HTTPException)
    async def http_exception_handler(
        request: Request,
        exc: HTTPException,
    ) -> JSONResponse:
        logger.warning(
            "HTTP error path={} status={} detail={}.",
            request.url.path,
            exc.status_code,
            exc.detail,
        )
        return JSONResponse(
            status_code=exc.status_code,
            content={
                "success": False,
                "data": {},
                "error": {
                    "type": "HTTPException",
                    "message": str(exc.detail),
                },
            },
        )

    @app.exception_handler(RequestValidationError)
    async def validation_exception_handler(
        request: Request,
        exc: RequestValidationError,
    ) -> JSONResponse:
        logger.warning(
            "Validation error path={} errors={}.",
            request.url.path,
            exc.errors(),
        )
        return JSONResponse(
            status_code=422,
            content={
                "success": False,
                "data": {},
                "error": {
                    "type": "RequestValidationError",
                    "message": "Request validation failed.",
                    "details": exc.errors(),
                },
            },
        )

    @app.exception_handler(Exception)
    async def unhandled_exception_handler(
        request: Request,
        exc: Exception,
    ) -> JSONResponse:
        settings = get_settings()
        logger.exception("Unhandled API error path={}.", request.url.path)
        message = (
            str(exc) if settings.APP_DEBUG else "Internal server error. Please try again later."
        )
        return JSONResponse(
            status_code=500,
            content={
                "success": False,
                "data": {},
                "error": {
                    "type": exc.__class__.__name__,
                    "message": message,
                },
            },
        )


def _include_routers(app: FastAPI) -> None:
    """
    Register canonical `/api/v1` routes and backward-compatible unversioned routes.
    """

    routers: Sequence[Any] = (
        health.router,
        analytics.router,
        business.router,
        onboarding.router,
        transactions.router,
        marketing.router,
        insights.router,
        exports.router,
        router_agent.router,
    )

    for api_router in routers:
        app.include_router(api_router, prefix=API_V1_PREFIX)

    for api_router in routers:
        app.include_router(api_router)


app = create_app()
