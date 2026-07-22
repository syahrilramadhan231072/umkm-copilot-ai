# Latest Git Reconciliation Full Replacement Code

## app.py

```python
"""
Go-UMKM AI Landing Page
=======================

Production SaaS welcome page for Go-UMKM AI.

This file is Streamlit frontend only. It does not modify backend contracts,
business workflows, repositories, services, tools, agents, APIs, database
schema, or the AI provider layer.
"""

from __future__ import annotations

from html import escape
from typing import Any, Mapping

from app.frontend.assets import load_custom_css
from app.frontend.navigation import switch_page
from app.frontend.onboarding import build_onboarding_state, is_valid_uuid
from app.frontend.session import (
    DEFAULT_LIMIT,
    build_business_preferences,
    ensure_frontend_session,
    get_api_client_from_session_state,
    hydrate_business_from_backend,
    start_create_new_business_flow,
)


DICODING_EMAIL = "syahril231072@gmail.com"


def render_app() -> None:
    """Render Go-UMKM AI landing and welcome page."""

    st = _get_streamlit()
    st.set_page_config(
        page_title="Go-UMKM AI",
        page_icon="🛍️",
        layout="wide",
    )
    load_custom_css(st)
    _inject_dicoding_meta(st)

    ensure_frontend_session(st.session_state)
    client = get_api_client_from_session_state(st.session_state)

    if not bool(st.session_state.get("create_new_business_mode")):
        with st.spinner("Memuat workspace bisnis..."):
            hydrate_business_from_backend(st.session_state, client)

    business_id = str(st.session_state.get("business_id", ""))
    product_id = str(st.session_state.get("active_product_id", ""))
    preferences = build_business_preferences(st.session_state)
    limit = int(st.session_state.get("dashboard_limit", DEFAULT_LIMIT))

    dashboard_response: dict[str, Any] | None = None
    if is_valid_uuid(business_id):
        with st.spinner("Memeriksa kesiapan bisnis..."):
            dashboard_response = client.get_dashboard(
                business_id=business_id,
                limit=limit,
            )

    state = build_onboarding_state(
        business_id=business_id,
        product_id=product_id,
        dashboard_response=dashboard_response,
    )

    primary_label, primary_target = _resolve_primary_cta(
        state=state,
        create_new_business_mode=bool(
            st.session_state.get("create_new_business_mode")
        ),
    )

    _render_landing_page(
        st=st,
        preferences=preferences,
        primary_label=primary_label,
        state_label=_resolve_state_label(state),
    )

    _render_cta_buttons(
        st=st,
        primary_label=primary_label,
        primary_target=primary_target,
        can_create_new_business=state.business_profile_ready,
    )


def _inject_dicoding_meta(st: Any) -> None:
    """
    Inject Dicoding verification meta tag.

    Streamlit renders markdown inside the app body. To make verification more
    robust, this function also attempts a zero-height component that appends
    the meta tag to the parent document head.
    """

    meta_tag = (
        f'<meta name="dicoding:email" content="{escape(DICODING_EMAIL)}">'
    )
    st.markdown(meta_tag, unsafe_allow_html=True)

    script = f"""
    <script>
    const metaName = "dicoding:email";
    const metaContent = "{escape(DICODING_EMAIL)}";
    const doc = window.parent && window.parent.document;
    if (doc) {{
      let meta = doc.querySelector('meta[name="' + metaName + '"]');
      if (!meta) {{
        meta = doc.createElement("meta");
        meta.setAttribute("name", metaName);
        doc.head.appendChild(meta);
      }}
      meta.setAttribute("content", metaContent);
    }}
    </script>
    """

    try:
        import streamlit.components.v1 as components

        components.html(script, height=0, width=0)
    except Exception:
        return


def _render_landing_page(
    *,
    st: Any,
    preferences: Mapping[str, Any],
    primary_label: str,
    state_label: str,
) -> None:
    """Render landing page sections."""

    business_name = str(preferences.get("business_name") or "").strip()
    business_type = str(preferences.get("business_type") or "").strip()
    workspace_label = business_name or "Indonesian MSMEs"
    workspace_subtitle = business_type or "AI-powered business workspace"

    st.markdown(
        _landing_html(
            workspace_label=workspace_label,
            workspace_subtitle=workspace_subtitle,
            primary_label=primary_label,
            state_label=state_label,
        ),
        unsafe_allow_html=True,
    )


def _render_cta_buttons(
    *,
    st: Any,
    primary_label: str,
    primary_target: str,
    can_create_new_business: bool,
) -> None:
    """Render working Streamlit CTA buttons below the HTML hero."""

    col_primary, col_secondary, col_spacer = st.columns([0.22, 0.24, 0.54])

    with col_primary:
        if st.button(
            primary_label,
            type="primary",
            use_container_width=True,
            key="go_landing_primary_cta",
        ):
            switch_page(st, primary_target)

    with col_secondary:
        if can_create_new_business:
            if st.button(
                "Create New Business",
                use_container_width=True,
                key="go_landing_secondary_cta",
            ):
                start_create_new_business_flow(st.session_state)
                switch_page(st, "pages/Business_Profile.py")
        else:
            st.markdown(
                '<a class="go-secondary-link" href="#go-features">'
                "Explore Features"
                "</a>",
                unsafe_allow_html=True,
            )


def _resolve_primary_cta(
    *,
    state: Any,
    create_new_business_mode: bool,
) -> tuple[str, str]:
    """Return landing page primary CTA label and target page."""

    if create_new_business_mode:
        return "Continue Setup", "pages/Business_Profile.py"

    if state.dashboard_ready:
        return "Open Dashboard", "pages/Dashboard.py"

    if state.next_step == "products":
        return "Add Products", "pages/Products.py"

    if state.next_step == "first_transaction":
        return "Record First Sale", "pages/First_Transaction.py"

    return "Get Started", "pages/Business_Profile.py"


def _resolve_state_label(state: Any) -> str:
    """Return short workspace readiness label."""

    if state.dashboard_ready:
        return "Workspace ready"

    if state.next_step == "products":
        return "Product setup needed"

    if state.next_step == "first_transaction":
        return "First sale needed"

    return "Setup ready"


def _landing_html(
    *,
    workspace_label: str,
    workspace_subtitle: str,
    primary_label: str,
    state_label: str,
) -> str:
    """Build landing page HTML."""

    safe_workspace_label = escape(workspace_label)
    safe_workspace_subtitle = escape(workspace_subtitle)
    safe_primary_label = escape(primary_label)
    safe_state_label = escape(state_label)

    features = _feature_cards_html()
    stack = _tech_stack_html()
    why = _why_cards_html()

    return f"""
    <main class="go-landing">
      <section class="go-nav">
        <div class="go-brand">
          {_logo_mark_svg()}
          <div>
            <div class="go-brand__name">Go-UMKM <span>AI</span></div>
            <div class="go-brand__tagline">Grow Your Business with AI</div>
          </div>
        </div>
        <div class="go-nav__links">
          <a href="#go-features">Features</a>
          <a href="#go-stack">Technology</a>
          <a href="#go-why">Why Go-UMKM AI</a>
        </div>
      </section>

      <section class="go-hero">
        <div class="go-hero__copy">
          <div class="go-eyebrow">
            <span class="go-eyebrow__dot"></span>
            AI-Powered Business Assistant
          </div>
          <h1>
            Grow Indonesian MSMEs with intelligent business insights.
          </h1>
          <p class="go-hero__subtitle">
            AI-powered assistant for Indonesian MSMEs. Analyze transactions.
            Generate insights. Forecast trends. Receive intelligent
            recommendations.
          </p>
          <div class="go-hero__workspace">
            <span>{safe_state_label}</span>
            <strong>{safe_workspace_label}</strong>
            <small>{safe_workspace_subtitle}</small>
          </div>
          <div class="go-hero__cta-visual">
            <span>{safe_primary_label}</span>
            <a href="#go-features">Explore Features</a>
          </div>
        </div>
        <div class="go-hero__visual" aria-label="Go-UMKM AI illustration">
          {_hero_illustration_svg()}
        </div>
      </section>

      <section class="go-benefit-strip" aria-label="Core benefits">
        <article>
          <div class="go-benefit-strip__icon">📊</div>
          <strong>AI Insights</strong>
          <span>Understand your business better</span>
        </article>
        <article>
          <div class="go-benefit-strip__icon">📈</div>
          <strong>Smart Forecast</strong>
          <span>Predict trends and demand</span>
        </article>
        <article>
          <div class="go-benefit-strip__icon">💡</div>
          <strong>Recommendations</strong>
          <span>Get AI-powered suggestions</span>
        </article>
        <article>
          <div class="go-benefit-strip__icon">🚀</div>
          <strong>Business Growth</strong>
          <span>Make better decisions</span>
        </article>
      </section>

      <section class="go-section" id="go-features">
        <div class="go-section__header">
          <span>Features</span>
          <h2>Everything MSMEs need to operate smarter</h2>
          <p>
            Professional tools for daily sales, inventory awareness, analytics,
            marketing, and decision support.
          </p>
        </div>
        <div class="go-feature-grid">
          {features}
        </div>
      </section>

      <section class="go-section go-stack-section" id="go-stack">
        <div class="go-section__header">
          <span>Technology Stack</span>
          <h2>Built for production, demos, and resilient AI operations</h2>
          <p>
            Go-UMKM AI combines a modern Python SaaS stack with automatic
            Multi-LLM failover so one provider outage does not stop the app.
          </p>
        </div>
        {stack}
      </section>

      <section class="go-section" id="go-why">
        <div class="go-section__header">
          <span>Why Go-UMKM AI</span>
          <h2>Designed for MSME users, competition demos, and SaaS growth</h2>
        </div>
        <div class="go-why-grid">
          {why}
        </div>
      </section>

      <footer class="go-footer">
        <div>
          <strong>Go-UMKM AI</strong>
          <span>Grow Your Business with AI</span>
        </div>
        <p>
          Built with Python, FastAPI, Streamlit, Supabase, and Multi-LLM
          Architecture for Indonesian MSMEs.
        </p>
      </footer>
    </main>
    """


def _feature_cards_html() -> str:
    """Return feature cards."""

    features = [
        (
            "📊",
            "Sales Analytics",
            "Track sales performance, revenue movement, and daily transactions.",
        ),
        (
            "📦",
            "Product Insights",
            "Discover product performance, stock signals, and catalog health.",
        ),
        (
            "🤖",
            "AI Business Assistant",
            "Ask business questions and receive practical AI-powered answers.",
        ),
        (
            "📈",
            "Forecast",
            "Anticipate demand patterns and business trends more confidently.",
        ),
        (
            "🛡️",
            "Business Health",
            "Monitor key signals that indicate operational strength or risk.",
        ),
        (
            "📣",
            "Marketing",
            "Generate campaign ideas, captions, and customer-oriented messages.",
        ),
        (
            "📄",
            "Reports",
            "Prepare clean summaries for monitoring, evaluation, and planning.",
        ),
        (
            "⬇️",
            "Export",
            "Download business data and summaries for external analysis.",
        ),
    ]

    return "\n".join(
        f"""
        <article class="go-feature-card">
          <div class="go-feature-card__icon">{icon}</div>
          <h3>{escape(title)}</h3>
          <p>{escape(description)}</p>
          <a href="#go-stack">View details →</a>
        </article>
        """
        for icon, title, description in features
    )


def _tech_stack_html() -> str:
    """Return technology stack section."""

    stack_items = [
        "Python",
        "FastAPI",
        "Streamlit",
        "Supabase",
        "Multi-LLM Architecture",
    ]
    providers = [
        "Gemini",
        "OpenRouter",
        "Hugging Face",
        "OpenAI optional",
        "Ollama optional",
    ]

    stack_badges = "".join(
        f'<span class="go-stack-badge">{escape(item)}</span>'
        for item in stack_items
    )
    provider_steps = "".join(
        f"""
        <div class="go-provider-step">
          <span>{index}</span>
          <strong>{escape(provider)}</strong>
        </div>
        """
        for index, provider in enumerate(providers, start=1)
    )

    return f"""
    <div class="go-stack-layout">
      <article class="go-stack-card">
        <h3>Production SaaS Stack</h3>
        <p>
          Frontend and backend stay decoupled through the approved FastAPI
          contract while Streamlit provides a fast, interactive user interface.
        </p>
        <div class="go-stack-badges">{stack_badges}</div>
      </article>
      <article class="go-stack-card">
        <h3>Automatic AI Failover</h3>
        <p>
          Provider priority is designed for stable demos and production
          continuity when quota, rate limit, timeout, or temporary failures
          happen.
        </p>
        <div class="go-provider-flow">{provider_steps}</div>
      </article>
    </div>
    """


def _why_cards_html() -> str:
    """Return why cards."""

    cards = [
        (
            "MSME-first UX",
            "Clean flows, practical wording, and simple decisions for daily operators.",
        ),
        (
            "Demo resilient",
            "The application remains presentable even when AI vendors are rate limited.",
        ),
        (
            "Actionable insights",
            "Outputs focus on business action, not technical logs or raw JSON.",
        ),
        (
            "SaaS-ready frontend",
            "Reusable landing sections, cards, spacing, shadows, and brand tokens.",
        ),
    ]

    return "\n".join(
        f"""
        <article class="go-why-card">
          <div class="go-check">✓</div>
          <h3>{escape(title)}</h3>
          <p>{escape(description)}</p>
        </article>
        """
        for title, description in cards
    )


def _logo_mark_svg() -> str:
    """Return inline SVG logo mark."""

    return """
    <svg class="go-logo-mark" viewBox="0 0 96 96" role="img"
         aria-label="Go-UMKM AI logo">
      <defs>
        <linearGradient id="goLogoGradient" x1="12" y1="12" x2="84" y2="84">
          <stop offset="0%" stop-color="#2563EB"/>
          <stop offset="100%" stop-color="#10B981"/>
        </linearGradient>
      </defs>
      <path d="M22 38h52l-4 38H26L22 38Z" fill="none"
            stroke="url(#goLogoGradient)" stroke-width="8"
            stroke-linejoin="round"/>
      <path d="M34 38c0-16 7-25 14-25s14 9 14 25" fill="none"
            stroke="#2563EB" stroke-width="8" stroke-linecap="round"/>
      <rect x="35" y="61" width="7" height="12" rx="3" fill="#10B981"/>
      <rect x="47" y="52" width="7" height="21" rx="3" fill="#14B8A6"/>
      <rect x="59" y="45" width="7" height="28" rx="3" fill="#2563EB"/>
      <path d="M19 18l4 8 8 4-8 4-4 8-4-8-8-4 8-4 4-8Z"
            fill="#2563EB"/>
    </svg>
    """


def _hero_illustration_svg() -> str:
    """Return inline SVG hero illustration."""

    return """
    <svg class="go-hero-svg" viewBox="0 0 720 520" role="img"
         aria-label="AI-powered MSME business assistant illustration">
      <defs>
        <linearGradient id="awning" x1="0" y1="0" x2="1" y2="1">
          <stop offset="0%" stop-color="#14B8A6"/>
          <stop offset="100%" stop-color="#10B981"/>
        </linearGradient>
        <filter id="softShadow" x="-20%" y="-20%" width="140%" height="140%">
          <feDropShadow dx="0" dy="18" stdDeviation="18"
                        flood-color="#0F172A" flood-opacity="0.12"/>
        </filter>
      </defs>

      <rect x="36" y="42" width="648" height="420" rx="30"
            fill="#F8FAFC"/>
      <circle cx="610" cy="104" r="44" fill="#DBEAFE"/>
      <circle cx="562" cy="94" r="24" fill="#DBEAFE"/>
      <circle cx="112" cy="118" r="32" fill="#E0F2FE"/>

      <g filter="url(#softShadow)">
        <rect x="415" y="130" width="214" height="190" rx="18"
              fill="#FFFFFF"/>
        <rect x="438" y="153" width="168" height="18" rx="9"
              fill="#CBD5E1"/>
        <rect x="438" y="186" width="42" height="92" rx="12"
              fill="#14B8A6"/>
        <rect x="494" y="208" width="42" height="70" rx="12"
              fill="#93C5FD"/>
        <rect x="550" y="176" width="42" height="102" rx="12"
              fill="#2563EB"/>
      </g>

      <g filter="url(#softShadow)">
        <rect x="88" y="116" width="206" height="152" rx="18"
              fill="#FFFFFF"/>
        <path d="M120 220c28-36 48-14 70-48 18-28 36-20 70-54"
              fill="none" stroke="#14B8A6" stroke-width="9"
              stroke-linecap="round"/>
        <path d="M238 121h40v40" fill="none" stroke="#2563EB"
              stroke-width="8" stroke-linecap="round"
              stroke-linejoin="round"/>
      </g>

      <g>
        <rect x="386" y="88" width="260" height="26" rx="8"
              fill="#334155"/>
        <path d="M394 114h52l-17 66c-4 16-27 18-35 4Z"
              fill="url(#awning)"/>
        <path d="M446 114h52l-10 68c-3 18-31 18-35 0Z"
              fill="#E2E8F0"/>
        <path d="M498 114h52l-2 68c-1 19-30 20-35 2Z"
              fill="url(#awning)"/>
        <path d="M550 114h52l7 66c2 18-23 25-35 9Z"
              fill="#E2E8F0"/>
        <path d="M602 114h36l18 66c4 16-16 27-30 15Z"
              fill="url(#awning)"/>
      </g>

      <rect x="64" y="374" width="592" height="22" rx="8"
            fill="#8B5E34"/>
      <rect x="82" y="396" width="556" height="24" rx="8"
            fill="#6B4423"/>

      <g filter="url(#softShadow)">
        <rect x="326" y="246" width="138" height="86" rx="16"
              fill="#FFFFFF"/>
        <circle cx="360" cy="288" r="22" fill="#2563EB"/>
        <path d="M348 288h24M360 276v24" stroke="#FFFFFF"
              stroke-width="6" stroke-linecap="round"/>
        <rect x="392" y="270" width="52" height="10" rx="5"
              fill="#CBD5E1"/>
        <rect x="392" y="294" width="38" height="10" rx="5"
              fill="#DBEAFE"/>
      </g>

      <g>
        <circle cx="476" cy="254" r="52" fill="#FDBA74"/>
        <path d="M430 360c10-62 82-62 94 0" fill="#10B981"/>
        <path d="M426 222c16-48 88-38 92 14-22-8-44-9-72 6Z"
              fill="#0F172A"/>
        <circle cx="462" cy="252" r="5" fill="#0F172A"/>
        <circle cx="494" cy="252" r="5" fill="#0F172A"/>
        <path d="M470 278c12 8 24 8 36 0" fill="none"
              stroke="#0F172A" stroke-width="5" stroke-linecap="round"/>
        <rect x="440" y="322" width="76" height="52" rx="10"
              fill="#059669"/>
      </g>

      <g filter="url(#softShadow)">
        <rect x="198" y="292" width="210" height="92" rx="18"
              fill="#334155"/>
        <rect x="220" y="312" width="168" height="52" rx="10"
              fill="#0F172A"/>
      </g>

      <g>
        <rect x="560" y="314" width="96" height="64" rx="12"
              fill="#C08457"/>
        <text x="578" y="354" font-family="Inter, sans-serif"
              font-size="22" font-weight="800" fill="#6B4423">UMKM</text>
      </g>
    </svg>
    """


def _get_streamlit() -> Any:
    """Import Streamlit lazily."""

    import streamlit as st

    return st


if __name__ == "__main__":
    render_app()

```

## app/api/main.py

```python
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

from app.api.routers import analytics
from app.api.routers import business
from app.api.routers import exports
from app.api.routers import health
from app.api.routers import insights
from app.api.routers import marketing
from app.api.routers import onboarding
from app.api.routers import router as router_agent
from app.api.routers import transactions
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
            str(exc)
            if settings.APP_DEBUG
            else "Internal server error. Please try again later."
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

```

## app/api/routers/health.py

```python
"""
Health Router
=============

Health and readiness endpoints for the API.
"""

from __future__ import annotations

from typing import Any

from fastapi import APIRouter

from app.config.settings import get_settings

router = APIRouter(tags=["health"])


@router.get("/health")
def health_check() -> dict[str, Any]:
    """Return lightweight liveness status."""

    settings = get_settings()

    return {
        "success": True,
        "service": "go-umkm-ai-api",
        "status": "healthy",
        "environment": settings.APP_ENV,
        "version": settings.APP_VERSION,
        "error": None,
    }


@router.get("/ready")
def readiness_check() -> dict[str, Any]:
    """
    Return readiness status based on required production configuration.

    The check is intentionally lightweight and validates configuration presence
    without querying database tables.
    """

    settings = get_settings()
    missing: list[str] = []

    if not settings.SUPABASE_URL.strip():
        missing.append("SUPABASE_URL")

    if not settings.supabase_key_is_configured:
        missing.append("SUPABASE_KEY")

    return {
        "success": not missing,
        "service": "go-umkm-ai-api",
        "status": "ready" if not missing else "not_ready",
        "missing": missing,
        "error": None if not missing else {"message": "Missing required settings."},
    }

```

## app/config/settings.py

```python
"""
Application Settings
====================

Centralized configuration management using Pydantic Settings.
"""

from __future__ import annotations

from functools import lru_cache
from typing import Literal

from pydantic import Field, SecretStr, computed_field
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """
    Global application configuration.

    Values are loaded from environment variables and `.env` during local
    development. Production platforms should provide the same variables through
    their secrets/environment settings.
    """

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore",
        case_sensitive=True,
    )

    # Application
    APP_NAME: str = "Go-UMKM AI"
    APP_VERSION: str = "0.1.0"
    APP_ENV: Literal["development", "staging", "production", "testing"] = "development"
    APP_DEBUG: bool = False
    LOG_LEVEL: Literal[
        "TRACE",
        "DEBUG",
        "INFO",
        "SUCCESS",
        "WARNING",
        "ERROR",
        "CRITICAL",
    ] = "INFO"
    LOG_TO_FILE: bool = False

    # Backend deployment
    PORT: int = 8000
    CORS_ALLOWED_ORIGINS: str = "*"
    HEALTHCHECK_INTERVAL: int = 30

    # Supabase
    SUPABASE_URL: str = ""
    SUPABASE_KEY: SecretStr = Field(default=SecretStr(""))

    # Multi-LLM provider configuration
    PRIMARY_LLM_PROVIDER: str = "gemini"
    LLM_PROVIDER_PRIORITY: str = "gemini,openrouter,huggingface,ollama"
    ENABLE_PROVIDER_FAILOVER: bool = True
    MAX_PROVIDER_RETRIES: int = 2
    RETRY_BACKOFF_SECONDS: float = 0.5

    GEMINI_API_KEY: SecretStr = Field(default=SecretStr(""))
    GEMINI_MODEL: str = "gemini-2.0-flash-lite"
    GEMINI_MODEL_NAME: str = "gemini-2.0-flash-lite"

    OPENROUTER_API_KEY: SecretStr = Field(default=SecretStr(""))
    OPENROUTER_MODEL: str = "google/gemini-2.0-flash-exp:free"

    HUGGINGFACE_API_KEY: SecretStr = Field(default=SecretStr(""))
    HUGGINGFACE_MODEL: str = "HuggingFaceH4/zephyr-7b-beta"

    OPENAI_API_KEY: SecretStr = Field(default=SecretStr(""))

    OLLAMA_BASE_URL: str = "http://localhost:11434"
    OLLAMA_MODEL: str = "llama3.2"

    # Streamlit frontend
    STREAMLIT_SERVER_PORT: int = 8501
    GO_UMKM_API_BASE_URL: str = "http://localhost:8000"

    # Localization
    DEFAULT_LANGUAGE: str = "id"
    TIMEZONE: str = "Asia/Jakarta"
    CURRENCY: str = "IDR"

    # Feature flags
    ENABLE_MARKETING: bool = True
    ENABLE_INSIGHT: bool = True
    ENABLE_EXPORT: bool = False
    ENABLE_ANALYTICS: bool = True
    ENABLE_AI_ASSISTANT: bool = True

    @computed_field
    @property
    def is_production(self) -> bool:
        """Return True if running in production."""

        return self.APP_ENV == "production"

    @computed_field
    @property
    def is_development(self) -> bool:
        """Return True if running in development."""

        return self.APP_ENV == "development"

    @computed_field
    @property
    def app_title(self) -> str:
        """Application title with version."""

        return f"{self.APP_NAME} v{self.APP_VERSION}"

    @computed_field
    @property
    def supabase_key_is_configured(self) -> bool:
        """Return whether Supabase key is configured."""

        return bool(self.SUPABASE_KEY.get_secret_value().strip())

    def gemini_key(self) -> str:
        """Return Gemini API key."""

        key = self.GEMINI_API_KEY.get_secret_value()
        if not key.strip():
            raise RuntimeError("GEMINI_API_KEY is not configured.")
        return key

    def supabase_key(self) -> str:
        """Return Supabase API key."""

        key = self.SUPABASE_KEY.get_secret_value()
        if not key.strip():
            raise RuntimeError("SUPABASE_KEY is not configured.")
        return key

    def validate_supabase(self) -> None:
        """Validate Supabase configuration."""

        if not self.SUPABASE_URL.strip():
            raise RuntimeError("SUPABASE_URL is missing.")
        self.supabase_key()

    def validate_gemini(self) -> None:
        """Validate Gemini configuration."""

        self.gemini_key()


@lru_cache(maxsize=1)
def get_settings() -> Settings:
    """Return singleton Settings instance."""

    return Settings()


settings = get_settings()

```

## app/utils/logger.py

```python
"""
Global Logger Configuration
===========================

Production-safe Loguru configuration.
"""

from __future__ import annotations

from pathlib import Path
import sys

from loguru import logger

from app.config.settings import get_settings


settings = get_settings()

logger.remove()

LOG_FORMAT = (
    "{time:YYYY-MM-DD HH:mm:ss} | "
    "{level:<8} | "
    "{name}:{function}:{line} | "
    "{message}"
)

logger.add(
    sys.stdout,
    level=settings.LOG_LEVEL,
    colorize=settings.is_development,
    enqueue=True,
    backtrace=settings.APP_DEBUG,
    diagnose=settings.APP_DEBUG,
    format=LOG_FORMAT,
)

if settings.LOG_TO_FILE:
    log_dir = Path("logs")
    log_dir.mkdir(parents=True, exist_ok=True)
    logger.add(
        log_dir / "app.log",
        level=settings.LOG_LEVEL,
        rotation="10 MB",
        retention="14 days",
        compression="zip",
        encoding="utf-8",
        enqueue=True,
        backtrace=settings.APP_DEBUG,
        diagnose=settings.APP_DEBUG,
        format=LOG_FORMAT,
    )

logger.info("=" * 60)
logger.info("{} starting...", settings.APP_NAME)
logger.info("Environment : {}", settings.APP_ENV)
logger.info("Debug Mode  : {}", settings.APP_DEBUG)
logger.info("Log Level   : {}", settings.LOG_LEVEL)
logger.info("=" * 60)


def redact_secret(value: str, *, visible_prefix: int = 4) -> str:
    """Redact secret values for logging."""

    if not value:
        return ""

    if len(value) <= visible_prefix:
        return "***"

    return f"{value[:visible_prefix]}***"


def log_success(message: str) -> None:
    """Log successful operation."""

    logger.success(message)


def log_info(message: str) -> None:
    """Log informational message."""

    logger.info(message)


def log_warning(message: str) -> None:
    """Log warning message."""

    logger.warning(message)


def log_error(message: str) -> None:
    """Log error message."""

    logger.error(message)


def log_exception(exception: Exception) -> None:
    """Log exception with traceback."""

    logger.exception(exception)


__all__ = [
    "logger",
    "log_success",
    "log_info",
    "log_warning",
    "log_error",
    "log_exception",
    "redact_secret",
]

```

## app/database/connection.py

```python
"""
Database Connection
===================

Centralized Supabase connection.
"""

from __future__ import annotations

from functools import lru_cache

from supabase import Client, create_client

from app.config.settings import get_settings
from app.utils.logger import logger

settings = get_settings()


@lru_cache(maxsize=1)
def get_supabase() -> Client:
    """
    Return singleton Supabase client.

    Repositories are responsible for database table access.
    """

    settings.validate_supabase()

    logger.info("Connecting to Supabase.")
    logger.info("SUPABASE_URL configured: {}", bool(settings.SUPABASE_URL.strip()))
    logger.info("SUPABASE_KEY configured: {}", settings.supabase_key_is_configured)

    client = create_client(
        supabase_url=settings.SUPABASE_URL,
        supabase_key=settings.supabase_key(),
    )

    logger.success("Supabase connection established.")

    return client


def health_check() -> bool:
    """Verify that the Supabase client can be initialized."""

    try:
        get_supabase()
        logger.success("Supabase health check passed.")
        return True
    except Exception as exc:
        logger.exception(exc)
        return False


__all__ = [
    "get_supabase",
    "health_check",
]

```

## app/frontend/config.py

```python
"""
Frontend Configuration
======================

Streamlit deployment configuration helpers.

Priority:
1. Streamlit Secrets
2. Environment Variables
3. Local development fallback
"""

from __future__ import annotations

import os
from typing import Mapping


DEFAULT_LOCAL_API_BASE_URL = "http://localhost:8000"
API_BASE_URL_KEYS = (
    "GO_UMKM_API_BASE_URL",
    "BACKEND_API_URL",
    "API_BASE_URL",
)


def get_frontend_api_base_url() -> str:
    """Return backend API base URL for the Streamlit frontend."""

    from_secrets = _get_from_streamlit_secrets()
    if from_secrets:
        return _normalize_base_url(from_secrets)

    for key in API_BASE_URL_KEYS:
        value = os.getenv(key)
        if value and value.strip():
            return _normalize_base_url(value)

    return DEFAULT_LOCAL_API_BASE_URL


def _get_from_streamlit_secrets() -> str:
    """Read API base URL from Streamlit secrets when available."""

    try:
        import streamlit as st

        secrets = st.secrets
    except Exception:
        return ""

    for key in API_BASE_URL_KEYS:
        try:
            value = secrets.get(key)
        except Exception:
            value = None

        if isinstance(value, str) and value.strip():
            return value.strip()

    try:
        api_section = secrets.get("api")
    except Exception:
        api_section = None

    if isinstance(api_section, Mapping):
        value = api_section.get("base_url")
        if isinstance(value, str) and value.strip():
            return value.strip()

    return ""


def _normalize_base_url(value: str) -> str:
    """Normalize API base URL."""

    if not isinstance(value, str) or not value.strip():
        return DEFAULT_LOCAL_API_BASE_URL

    return value.strip().rstrip("/")

```

## app/frontend/session.py

```python
"""
Session Frontend
================

Helper session state untuk Streamlit.
"""

from __future__ import annotations

from typing import Any, Mapping, MutableMapping
from uuid import UUID, uuid4

from app.frontend.api_client import FrontendApiClient
from app.frontend.config import DEFAULT_LOCAL_API_BASE_URL, get_frontend_api_base_url


DEFAULT_API_BASE_URL = DEFAULT_LOCAL_API_BASE_URL
DEFAULT_BUSINESS_ID = ""
DEFAULT_LIMIT = 1000
DEFAULT_CURRENCY = "IDR"
DEFAULT_TIMEZONE = "Asia/Jakarta"
DEFAULT_LANGUAGE = "Bahasa Indonesia"
DEFAULT_PRODUCT_ID = ""


def ensure_frontend_session(session_state: MutableMapping[str, Any]) -> None:
    """Pastikan semua kunci session tersedia."""

    session_state.setdefault("api_base_url", get_frontend_api_base_url())
    session_state.setdefault("business_id", DEFAULT_BUSINESS_ID)
    session_state.setdefault("dashboard_limit", DEFAULT_LIMIT)
    session_state.setdefault("business_name", "")
    session_state.setdefault("owner_name", "")
    session_state.setdefault("business_type", "")
    session_state.setdefault("currency", DEFAULT_CURRENCY)
    session_state.setdefault("timezone", DEFAULT_TIMEZONE)
    session_state.setdefault("language", DEFAULT_LANGUAGE)
    session_state.setdefault("active_product_id", DEFAULT_PRODUCT_ID)
    session_state.setdefault("active_product_name", "")
    session_state.setdefault("backend_products", [])
    session_state.setdefault("business_profiles", [])
    session_state.setdefault("business_hydration_attempted", False)
    session_state.setdefault("create_new_business_mode", False)
    session_state.setdefault("previous_business_profile", {})
    session_state.setdefault("onboarding_step", "welcome")

    _ensure_valid_session_id(session_state)


def get_api_client_from_session_state(
    session_state: MutableMapping[str, Any],
) -> FrontendApiClient:
    """Bangun API client dari session state."""

    ensure_frontend_session(session_state)
    return FrontendApiClient(api_base_url=str(session_state["api_base_url"]))


def hydrate_business_from_backend(
    session_state: MutableMapping[str, Any],
    client: FrontendApiClient,
    *,
    force: bool = False,
) -> bool:
    """
    Hydrate business aktif dari backend jika session belum memiliki business_id.

    Dalam create_new_business_mode, auto-hydrate dimatikan agar user tidak
    otomatis dikembalikan ke business existing ketika sedang membuat business baru.
    """

    ensure_frontend_session(session_state)

    if bool(session_state.get("create_new_business_mode")) and not force:
        return False

    current_business_id = str(session_state.get("business_id", "")).strip()
    if _is_valid_uuid(current_business_id) and not force:
        return True

    if session_state.get("business_hydration_attempted") is True and not force:
        return _is_valid_uuid(str(session_state.get("business_id", "")).strip())

    session_state["business_hydration_attempted"] = True

    response = client.list_business_profiles(limit=100)
    if not response.get("success"):
        return False

    profiles = extract_business_profiles_from_response(response)
    session_state["business_profiles"] = profiles

    if not profiles:
        return False

    set_business_from_response(session_state, profiles[0])
    return _is_valid_uuid(str(session_state.get("business_id", "")).strip())


def refresh_business_profiles_from_backend(
    session_state: MutableMapping[str, Any],
    client: FrontendApiClient,
) -> list[dict[str, Any]]:
    """Refresh daftar business profiles dari backend."""

    ensure_frontend_session(session_state)

    response = client.list_business_profiles(limit=100)
    if not response.get("success"):
        return get_business_profiles(session_state)

    profiles = extract_business_profiles_from_response(response)
    session_state["business_profiles"] = profiles
    session_state["business_hydration_attempted"] = True

    return profiles


def extract_business_profiles_from_response(
    response: Mapping[str, Any],
) -> list[dict[str, Any]]:
    """Ambil daftar business profile dari berbagai bentuk response backend."""

    data = response.get("data")
    raw_profiles: Any

    if isinstance(data, Mapping):
        raw_profiles = (
            data.get("businesses")
            or data.get("business_profiles")
            or data.get("profiles")
            or data.get("items")
            or []
        )
    elif isinstance(data, list):
        raw_profiles = data
    else:
        raw_profiles = []

    if isinstance(raw_profiles, Mapping):
        raw_profiles = [raw_profiles]

    if not isinstance(raw_profiles, list):
        return []

    profiles: list[dict[str, Any]] = []
    for item in raw_profiles:
        if isinstance(item, Mapping):
            normalized = normalize_business_profile(item)
            if normalized.get("business_id"):
                profiles.append(normalized)

    return profiles


def normalize_business_profile(data: Mapping[str, Any]) -> dict[str, Any]:
    """Normalisasi business profile dari backend."""

    business_id = data.get("business_id") or data.get("id") or data.get("uuid") or ""

    return {
        "business_id": str(business_id).strip(),
        "business_name": str(data.get("business_name") or "").strip(),
        "owner_name": str(data.get("owner_name") or "").strip(),
        "business_type": str(data.get("business_type") or "").strip(),
        "currency": str(data.get("currency") or DEFAULT_CURRENCY).strip(),
        "timezone": str(data.get("timezone") or DEFAULT_TIMEZONE).strip(),
        "language": str(data.get("language") or DEFAULT_LANGUAGE).strip(),
    }


def get_business_profiles(
    session_state: MutableMapping[str, Any],
) -> list[dict[str, Any]]:
    """Ambil daftar business profiles dari session."""

    ensure_frontend_session(session_state)
    profiles = session_state.get("business_profiles", [])

    if isinstance(profiles, list):
        return [dict(profile) for profile in profiles if isinstance(profile, dict)]

    return []


def start_create_new_business_flow(session_state: MutableMapping[str, Any]) -> None:
    """
    Aktifkan mode pembuatan business baru.

    Business aktif saat ini disimpan sebagai previous_business_profile supaya
    user bisa kembali ke Welcome/Dashboard awal tanpa mengetik business baru.
    """

    ensure_frontend_session(session_state)

    current_profile = _current_business_profile(session_state)
    if current_profile.get("business_id"):
        session_state["previous_business_profile"] = current_profile

    clear_active_business(session_state)
    session_state["create_new_business_mode"] = True
    session_state["business_hydration_attempted"] = True
    session_state["onboarding_step"] = "business_profile"


def cancel_create_new_business_flow(session_state: MutableMapping[str, Any]) -> None:
    """
    Batalkan mode pembuatan business baru dan pulihkan business sebelumnya.

    Jika tidak ada previous business, hydration akan diizinkan lagi agar app
    dapat mengambil business existing dari backend.
    """

    ensure_frontend_session(session_state)
    previous_profile = session_state.get("previous_business_profile", {})

    session_state["create_new_business_mode"] = False
    session_state["business_hydration_attempted"] = False
    session_state["onboarding_step"] = "welcome"

    if isinstance(previous_profile, Mapping) and previous_profile.get("business_id"):
        set_business_from_response(session_state, previous_profile)
    else:
        clear_active_business(session_state)


def return_to_welcome(session_state: MutableMapping[str, Any]) -> None:
    """Kembali ke Welcome/Dashboard awal dari langkah onboarding mana pun."""

    ensure_frontend_session(session_state)

    if bool(session_state.get("create_new_business_mode")):
        cancel_create_new_business_flow(session_state)
    else:
        session_state["onboarding_step"] = "welcome"


def set_onboarding_step(
    session_state: MutableMapping[str, Any],
    step: str,
) -> None:
    """Simpan posisi langkah onboarding frontend."""

    ensure_frontend_session(session_state)
    session_state["onboarding_step"] = step


def clear_active_business(session_state: MutableMapping[str, Any]) -> None:
    """Kosongkan business aktif tanpa menghapus daftar business profiles."""

    ensure_frontend_session(session_state)

    session_state["business_id"] = ""
    session_state["business_name"] = ""
    session_state["owner_name"] = ""
    session_state["business_type"] = ""
    session_state["currency"] = DEFAULT_CURRENCY
    session_state["timezone"] = DEFAULT_TIMEZONE
    session_state["language"] = DEFAULT_LANGUAGE
    session_state["active_product_id"] = ""
    session_state["active_product_name"] = ""
    session_state["backend_products"] = []


def has_business_profile(session_state: MutableMapping[str, Any]) -> bool:
    """Periksa apakah profil bisnis aktif sudah tersedia."""

    ensure_frontend_session(session_state)
    return _is_valid_uuid(str(session_state.get("business_id", "")).strip())


def has_active_product(session_state: MutableMapping[str, Any]) -> bool:
    """Periksa apakah produk aktif sudah tersedia."""

    ensure_frontend_session(session_state)
    return bool(str(session_state.get("active_product_id", "")).strip())


def build_business_preferences(
    session_state: MutableMapping[str, Any],
) -> dict[str, str]:
    """Bangun preferensi bisnis aktif."""

    ensure_frontend_session(session_state)

    return {
        "business_id": str(session_state.get("business_id", "")).strip(),
        "business_name": str(session_state.get("business_name", "")).strip(),
        "owner_name": str(session_state.get("owner_name", "")).strip(),
        "business_type": str(session_state.get("business_type", "")).strip(),
        "currency": str(session_state.get("currency", DEFAULT_CURRENCY)).strip(),
        "timezone": str(session_state.get("timezone", DEFAULT_TIMEZONE)).strip(),
        "language": str(session_state.get("language", DEFAULT_LANGUAGE)).strip(),
    }


def set_business_from_response(
    session_state: MutableMapping[str, Any],
    data: Mapping[str, Any],
) -> None:
    """Simpan profil bisnis dari response backend."""

    ensure_frontend_session(session_state)
    normalized = normalize_business_profile(data)

    previous_business_id = str(session_state.get("business_id", "")).strip()
    next_business_id = normalized["business_id"]

    session_state["business_id"] = next_business_id
    session_state["business_name"] = normalized["business_name"]
    session_state["owner_name"] = normalized["owner_name"]
    session_state["business_type"] = normalized["business_type"]
    session_state["currency"] = normalized["currency"]
    session_state["timezone"] = normalized["timezone"]
    session_state["language"] = normalized["language"]
    session_state["create_new_business_mode"] = False
    session_state["business_hydration_attempted"] = True

    _upsert_business_profile(session_state, normalized)

    if previous_business_id != next_business_id:
        session_state["active_product_id"] = ""
        session_state["active_product_name"] = ""
        session_state["backend_products"] = []


def set_active_product_from_response(
    session_state: MutableMapping[str, Any],
    data: Mapping[str, Any],
) -> None:
    """Simpan produk aktif dari response backend."""

    ensure_frontend_session(session_state)

    product_id = str(data.get("product_id") or data.get("id") or "").strip()
    product_name = str(data.get("name") or data.get("product_name") or "").strip()

    session_state["active_product_id"] = product_id
    session_state["active_product_name"] = product_name


def set_backend_products(
    session_state: MutableMapping[str, Any],
    products: list[dict[str, Any]],
) -> None:
    """Simpan daftar produk backend."""

    ensure_frontend_session(session_state)
    session_state["backend_products"] = products


def get_backend_products(
    session_state: MutableMapping[str, Any],
) -> list[dict[str, Any]]:
    """Ambil daftar produk backend."""

    ensure_frontend_session(session_state)
    products = session_state.get("backend_products", [])

    if isinstance(products, list):
        return [dict(product) for product in products if isinstance(product, dict)]

    return []


def build_common_payload(
    session_state: MutableMapping[str, Any],
    extra: dict[str, Any] | None = None,
) -> dict[str, Any]:
    """Bangun payload umum untuk endpoint yang membutuhkan konteks bisnis."""

    ensure_frontend_session(session_state)

    payload = {
        "business_id": str(session_state["business_id"]),
        "session_id": str(session_state["session_id"]),
    }

    if extra:
        payload.update(extra)

    return payload


def reset_frontend_session_identity(
    session_state: MutableMapping[str, Any],
) -> None:
    """Buat ulang session_id UUID untuk percakapan baru."""

    session_state["session_id"] = _new_session_id()


def _current_business_profile(
    session_state: MutableMapping[str, Any],
) -> dict[str, str]:
    """Ambil snapshot business aktif."""

    return {
        "business_id": str(session_state.get("business_id", "")).strip(),
        "business_name": str(session_state.get("business_name", "")).strip(),
        "owner_name": str(session_state.get("owner_name", "")).strip(),
        "business_type": str(session_state.get("business_type", "")).strip(),
        "currency": str(session_state.get("currency", DEFAULT_CURRENCY)).strip(),
        "timezone": str(session_state.get("timezone", DEFAULT_TIMEZONE)).strip(),
        "language": str(session_state.get("language", DEFAULT_LANGUAGE)).strip(),
    }


def _upsert_business_profile(
    session_state: MutableMapping[str, Any],
    profile: dict[str, Any],
) -> None:
    """Tambahkan atau update business profile pada cache frontend."""

    profiles = get_business_profiles(session_state)
    business_id = str(profile.get("business_id", "")).strip()

    updated = False
    for index, existing in enumerate(profiles):
        if str(existing.get("business_id", "")).strip() == business_id:
            profiles[index] = dict(profile)
            updated = True
            break

    if not updated:
        profiles.append(dict(profile))

    session_state["business_profiles"] = profiles


def _ensure_valid_session_id(session_state: MutableMapping[str, Any]) -> None:
    """Pastikan session_id adalah UUID valid."""

    current_session_id = str(session_state.get("session_id", "")).strip()

    if not _is_valid_uuid(current_session_id):
        session_state["session_id"] = _new_session_id()


def _new_session_id() -> str:
    """Buat UUID baru untuk session percakapan."""

    return str(uuid4())


def _is_valid_uuid(value: str) -> bool:
    """Periksa UUID."""

    if not value:
        return False

    try:
        UUID(value)
    except (TypeError, ValueError):
        return False

    return True

```

## app/frontend/api_client.py

```python
"""
Klien API Frontend
==================

Klien HTTP untuk menghubungkan Streamlit dengan FastAPI.

Catatan:
- Frontend tidak mengakses Repository/Service/Database secara langsung.
- Seluruh request backend melewati FrontendApiClient.
- Endpoint lama project bisa berjalan dengan atau tanpa prefix /api/v1,
  sehingga client memakai fallback path untuk kompatibilitas.
"""

from __future__ import annotations

import json
from typing import Any, Callable, Mapping
from urllib.error import HTTPError, URLError
from urllib.parse import urlencode
from urllib.request import Request, urlopen


Transport = Callable[
    [str, str, dict[str, str], bytes | None, float],
    tuple[int, str],
]


class FrontendApiClient:
    """Klien HTTP untuk backend UMKM Copilot AI."""

    def __init__(
        self,
        api_base_url: str = "http://localhost:8000",
        *,
        timeout: float = 20.0,
        transport: Transport | None = None,
    ) -> None:
        """Inisialisasi API client."""

        self.api_base_url = self._normalize_base_url(api_base_url)
        self.timeout = self._validate_timeout(timeout)
        self._transport = transport or self._urllib_transport

    def health_check(self) -> dict[str, Any]:
        """Cek status layanan."""

        return self._normalize_health_response(self._request("GET", "/health"))

    def list_business_profiles(self, limit: int = 100) -> dict[str, Any]:
        """Ambil daftar business profile dari backend."""

        return self._request_with_fallback(
            "GET",
            [
                "/api/v1/business/profiles",
                "/business/profiles",
            ],
            query={"limit": limit},
        )

    def get_active_business_profile(self) -> dict[str, Any]:
        """Ambil business profile aktif dari backend."""

        return self._request_with_fallback(
            "GET",
            [
                "/api/v1/business/active-profile",
                "/business/active-profile",
            ],
        )

    def create_business_profile(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Buat atau resolve profil bisnis melalui router onboarding."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/onboarding/business-profile",
                "/onboarding/business-profile",
            ],
            json_body=dict(payload),
        )

    def create_product(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Buat produk melalui router onboarding."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/onboarding/products",
                "/onboarding/products",
            ],
            json_body=dict(payload),
        )

    def list_products(self, business_id: str, limit: int = 100) -> dict[str, Any]:
        """Ambil daftar produk dari router onboarding."""

        safe_business_id = self._safe_path(business_id)

        return self._request_with_fallback(
            "GET",
            [
                f"/api/v1/onboarding/products/{safe_business_id}",
                f"/onboarding/products/{safe_business_id}",
            ],
            query={"limit": limit},
        )

    def get_dashboard(self, business_id: str, limit: int = 1000) -> dict[str, Any]:
        """Ambil data dashboard dari backend."""

        safe_business_id = self._safe_path(business_id)

        return self._request_with_fallback(
            "GET",
            [
                f"/api/v1/analytics/dashboard/{safe_business_id}",
                f"/analytics/dashboard/{safe_business_id}",
            ],
            query={"limit": limit},
        )

    def get_sales_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Ambil ringkasan penjualan analytics."""

        safe_business_id = self._safe_path(business_id)

        return self._request_with_fallback(
            "GET",
            [
                f"/api/v1/analytics/sales/{safe_business_id}",
                f"/analytics/sales/{safe_business_id}",
            ],
            query={"limit": limit},
        )

    def get_inventory_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Ambil ringkasan inventory analytics."""

        safe_business_id = self._safe_path(business_id)

        return self._request_with_fallback(
            "GET",
            [
                f"/api/v1/analytics/inventory/{safe_business_id}",
                f"/analytics/inventory/{safe_business_id}",
            ],
            query={"limit": limit},
        )

    def get_product_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Ambil ringkasan produk analytics."""

        safe_business_id = self._safe_path(business_id)

        return self._request_with_fallback(
            "GET",
            [
                f"/api/v1/analytics/products/{safe_business_id}",
                f"/analytics/products/{safe_business_id}",
            ],
            query={"limit": limit},
        )

    def business_overview(
        self,
        business_id: str,
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Ambil ringkasan bisnis."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/business/overview",
                "/business/overview",
            ],
            json_body={
                "business_id": business_id,
                "limit": limit,
                "session_id": session_id,
            },
        )

    def business_health_check(
        self,
        business_id: str,
        limit: int = 1000,
        session_id: str | None = None,
    ) -> dict[str, Any]:
        """Ambil pemeriksaan kondisi bisnis."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/business/health-check",
                "/business/health-check",
            ],
            json_body={
                "business_id": business_id,
                "limit": limit,
                "session_id": session_id,
            },
        )

    def record_transaction(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Catat transaksi melalui endpoint transaksi backend."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/transactions/record",
                "/api/v1/transactions/record-payload",
                "/transactions/record",
                "/transactions/record-payload",
            ],
            json_body=dict(payload),
            fallback_statuses=(404, 405, 422),
        )

    def get_transaction_summary(
        self,
        business_id: str,
        limit: int = 1000,
    ) -> dict[str, Any]:
        """Ambil ringkasan transaksi."""

        safe_business_id = self._safe_path(business_id)

        return self._request_with_fallback(
            "GET",
            [
                f"/api/v1/transactions/summary/{safe_business_id}",
                f"/transactions/summary/{safe_business_id}",
            ],
            query={"limit": limit},
        )

    def get_marketing_context(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Ambil konteks pemasaran."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/marketing/context",
                "/marketing/context",
            ],
            json_body=dict(payload),
        )

    def create_marketing_record(
        self,
        payload: Mapping[str, Any],
    ) -> dict[str, Any]:
        """Simpan riwayat pemasaran."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/marketing/records",
                "/marketing/records",
            ],
            json_body=dict(payload),
        )

    def get_marketing_history(
        self,
        business_id: str,
        keyword: str | None = None,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Ambil riwayat pemasaran."""

        safe_business_id = self._safe_path(business_id)

        return self._request_with_fallback(
            "GET",
            [
                f"/api/v1/marketing/history/{safe_business_id}",
                f"/marketing/history/{safe_business_id}",
            ],
            query={"keyword": keyword, "limit": limit},
        )

    def get_insight_context(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Ambil konteks rekomendasi bisnis."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/insights/context",
                "/insights/context",
            ],
            json_body=dict(payload),
        )

    def create_insight(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Simpan rekomendasi bisnis."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/insights/records",
                "/insights/records",
            ],
            json_body=dict(payload),
        )

    def get_insight_review(
        self,
        business_id: str,
        keyword: str | None = None,
        insight_category: str | None = None,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Ambil daftar rekomendasi bisnis."""

        safe_business_id = self._safe_path(business_id)

        return self._request_with_fallback(
            "GET",
            [
                f"/api/v1/insights/review/{safe_business_id}",
                f"/insights/review/{safe_business_id}",
            ],
            query={
                "keyword": keyword,
                "insight_category": insight_category,
                "limit": limit,
            },
        )

    def export_dashboard(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Unduh data dashboard."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/exports/dashboard",
                "/exports/dashboard",
            ],
            json_body=dict(payload),
        )

    def export_sales_summary(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Unduh ringkasan penjualan."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/exports/sales-summary",
                "/exports/sales-summary",
            ],
            json_body=dict(payload),
        )

    def export_inventory_summary(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Unduh ringkasan persediaan."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/exports/inventory-summary",
                "/exports/inventory-summary",
            ],
            json_body=dict(payload),
        )

    def export_structured_data(self, payload: Mapping[str, Any]) -> dict[str, Any]:
        """Unduh data terstruktur."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/exports/structured",
                "/exports/structured",
            ],
            json_body=dict(payload),
        )

    def route(
        self,
        user_input: str,
        payload: Mapping[str, Any],
        explicit_route: str | None = None,
    ) -> dict[str, Any]:
        """Kirim pertanyaan ke asisten bisnis."""

        return self._request_with_fallback(
            "POST",
            [
                "/api/v1/router/route",
                "/router/route",
            ],
            json_body={
                "user_input": user_input,
                "payload": dict(payload),
                "explicit_route": explicit_route,
            },
        )

    def _request_with_fallback(
        self,
        method: str,
        paths: list[str],
        *,
        json_body: Mapping[str, Any] | None = None,
        query: Mapping[str, Any] | None = None,
        fallback_statuses: tuple[int, ...] = (404, 405),
    ) -> dict[str, Any]:
        """Coba beberapa path hingga mendapatkan response bukan fallback status."""

        attempts: list[str] = []
        last_response: dict[str, Any] | None = None

        for path in paths:
            response = self._request(
                method,
                path,
                json_body=json_body,
                query=query,
            )
            status = int(response.get("_http_status", 200))
            attempts.append(f"{method.upper()} {path} -> {status}")
            response["_path_attempts"] = attempts.copy()
            last_response = response

            if status not in fallback_statuses:
                return response

        return last_response or self._failure_response(
            "RouteNotFound",
            "Tidak ada endpoint yang tersedia.",
        )

    def _request(
        self,
        method: str,
        path: str,
        *,
        json_body: Mapping[str, Any] | None = None,
        query: Mapping[str, Any] | None = None,
    ) -> dict[str, Any]:
        """Eksekusi request HTTP."""

        method_upper = method.upper()
        url = self._build_url(path, query)
        headers = {"Accept": "application/json"}
        body: bytes | None = None

        if json_body is not None:
            body = json.dumps(
                self._remove_none_values(dict(json_body)),
                ensure_ascii=False,
                default=str,
            ).encode("utf-8")
            headers["Content-Type"] = "application/json"

        try:
            status_code, response_text = self._transport(
                method_upper,
                url,
                headers,
                body,
                self.timeout,
            )
            parsed = self._parse_response_text(response_text)

            if 200 <= status_code < 300:
                if "success" in parsed:
                    return parsed
                return {"success": True, "data": parsed, "error": None}

            parsed.setdefault("success", False)
            parsed["_http_status"] = status_code
            return parsed

        except HTTPError as exc:
            return self._handle_http_error(exc)
        except URLError:
            return self._failure_response(
                "ConnectionError",
                "Layanan backend belum dapat dijangkau. Periksa konfigurasi API base URL.",
            )
        except TimeoutError:
            return self._failure_response(
                "TimeoutError",
                "Permintaan melewati batas waktu. Silakan coba lagi.",
            )
        except Exception as exc:
            return self._failure_response(
                exc.__class__.__name__,
                "Layanan belum dapat memproses permintaan. Silakan coba lagi.",
            )

    def _urllib_transport(
        self,
        method: str,
        url: str,
        headers: dict[str, str],
        body: bytes | None,
        timeout: float,
    ) -> tuple[int, str]:
        """Transport HTTP bawaan."""

        request = Request(url=url, data=body, headers=headers, method=method)

        with urlopen(request, timeout=timeout) as response:
            status_code = int(response.status)
            response_text = response.read().decode("utf-8")

        return status_code, response_text

    def _handle_http_error(self, error: HTTPError) -> dict[str, Any]:
        """Ubah HTTPError menjadi response standar."""

        try:
            response_text = error.read().decode("utf-8")
            parsed = self._parse_response_text(response_text)
            parsed.setdefault("success", False)
            parsed["_http_status"] = int(error.code)
            return parsed
        except Exception:
            return self._failure_response(
                "HTTPError",
                "Layanan mengembalikan respons yang belum dapat diproses.",
                status_code=int(error.code),
            )

    def _build_url(
        self,
        path: str,
        query: Mapping[str, Any] | None = None,
    ) -> str:
        """Bangun URL lengkap."""

        if not path.startswith("/"):
            raise ValueError("path harus diawali '/'.")

        url = f"{self.api_base_url}{path}"
        filtered_query = self._remove_none_values(dict(query or {}))

        if filtered_query:
            url = f"{url}?{urlencode(filtered_query)}"

        return url

    def _parse_response_text(self, response_text: str) -> dict[str, Any]:
        """Parse teks response menjadi dictionary."""

        if not response_text.strip():
            return {"success": True, "data": {}, "error": None}

        parsed = json.loads(response_text)

        if isinstance(parsed, dict):
            return parsed

        return {"success": True, "data": parsed, "error": None}

    def _normalize_health_response(self, response: dict[str, Any]) -> dict[str, Any]:
        """Normalisasi response health check."""

        if response.get("success") is True:
            return response

        status = str(response.get("status", "")).lower()
        if status in {"ok", "healthy", "success"}:
            return {"success": True, "data": response, "error": None}

        return response

    def _failure_response(
        self,
        error_type: str,
        message: str,
        *,
        status_code: int | None = None,
    ) -> dict[str, Any]:
        """Bangun response gagal standar."""

        response: dict[str, Any] = {
            "success": False,
            "data": {},
            "error": {"type": error_type, "message": message},
        }

        if status_code is not None:
            response["_http_status"] = status_code

        return response

    def _normalize_base_url(self, api_base_url: str) -> str:
        """Normalisasi URL layanan."""

        if not isinstance(api_base_url, str) or not api_base_url.strip():
            raise ValueError("api_base_url wajib diisi.")

        return api_base_url.strip().rstrip("/")

    def _validate_timeout(self, timeout: float) -> float:
        """Validasi timeout."""

        if not isinstance(timeout, (int, float)) or timeout <= 0:
            raise ValueError("timeout harus berupa angka positif.")

        return float(timeout)

    def _safe_path(self, value: str) -> str:
        """Validasi komponen path."""

        if not isinstance(value, str) or not value.strip():
            raise ValueError("nilai path wajib diisi.")

        stripped = value.strip()

        if "/" in stripped or "\\" in stripped:
            raise ValueError("nilai path tidak boleh mengandung garis miring.")

        return stripped

    def _remove_none_values(self, data: dict[str, Any]) -> dict[str, Any]:
        """Hapus field bernilai None."""

        return {key: value for key, value in data.items() if value is not None}

```

## requirements.txt

```text
fastapi
uvicorn[standard]
streamlit
supabase
python-dotenv
pydantic
pydantic-settings
pandas
plotly
openpyxl
pillow
loguru
google-genai
google-generativeai==0.8.6
httpx
pytest
ruff

```

## pyproject.toml

```text
[project]
name = "go-umkm-ai"
version = "0.1.0"
requires-python = ">=3.12"

[tool.ruff]
target-version = "py312"
line-length = 100
src = ["app", "pages", "tests"]

[tool.ruff.lint]
select = ["E", "F", "I", "B", "UP"]
ignore = ["B008"]

[tool.ruff.lint.isort]
known-first-party = ["app"]

[tool.pytest.ini_options]
testpaths = ["tests"]
pythonpath = ["."]

```

## .env.example

```text
# ==========================================================
# Go-UMKM AI Environment Example
# ==========================================================
# Copy this file to .env for local development.
# Never commit real secrets.

# Application
APP_NAME="Go-UMKM AI"
APP_VERSION=0.1.0
APP_ENV=development
APP_DEBUG=False
LOG_LEVEL=INFO
LOG_TO_FILE=False

# Backend deployment
PORT=8000
HEALTHCHECK_INTERVAL=30
CORS_ALLOWED_ORIGINS=http://localhost:8501

# Supabase
SUPABASE_URL=
SUPABASE_KEY=

# Streamlit frontend
GO_UMKM_API_BASE_URL=http://localhost:8000
STREAMLIT_SERVER_PORT=8501

# Multi-LLM providers
PRIMARY_LLM_PROVIDER=gemini
LLM_PROVIDER_PRIORITY=gemini,openrouter,huggingface,ollama
ENABLE_PROVIDER_FAILOVER=True
MAX_PROVIDER_RETRIES=2
RETRY_BACKOFF_SECONDS=0.5

GEMINI_API_KEY=
GEMINI_MODEL=gemini-2.0-flash-lite
GEMINI_MODEL_NAME=gemini-2.0-flash-lite

OPENROUTER_API_KEY=
OPENROUTER_MODEL=google/gemini-2.0-flash-exp:free

HUGGINGFACE_API_KEY=
HUGGINGFACE_MODEL=HuggingFaceH4/zephyr-7b-beta

OPENAI_API_KEY=

OLLAMA_BASE_URL=http://localhost:11434
OLLAMA_MODEL=llama3.2

# Localization
DEFAULT_LANGUAGE=id
TIMEZONE=Asia/Jakarta
CURRENCY=IDR

# Feature flags
ENABLE_MARKETING=True
ENABLE_INSIGHT=True
ENABLE_EXPORT=False
ENABLE_ANALYTICS=True
ENABLE_AI_ASSISTANT=True

```

## .gitignore

```text
# ==========================================
# Environment
# ==========================================
.env

# ==========================================
# Python
# ==========================================
.venv/
__pycache__/
*.pyc

# ==========================================
# Streamlit
# ==========================================
.streamlit/*
!.streamlit/config.toml
!.streamlit/secrets.example.toml

# ==========================================
# Logs
# ==========================================
logs/
*.log

# ==========================================
# Storage
# ==========================================
storage/generated/*
storage/uploads/*

# Keep directory structure
!storage/generated/.gitkeep
!storage/uploads/.gitkeep

# ==========================================
# Testing
# ==========================================
.pytest_cache/

# ==========================================
# IDE
# ==========================================
.vscode/
.idea/

# ==========================================
# Operating System
# ==========================================
.DS_Store
Thumbs.db

# Tool caches
.ruff_cache/
.mypy_cache/

```

## render.yaml

```text
services:
  - type: web
    name: go-umkm-ai-backend
    runtime: python
    plan: free
    region: singapore
    buildCommand: "pip install --upgrade pip && pip install -r requirements.txt"
    startCommand: "uvicorn app.api.main:app --host 0.0.0.0 --port $PORT"
    healthCheckPath: "/health"
    envVars:
      - key: APP_ENV
        value: production
      - key: APP_DEBUG
        value: "False"
      - key: LOG_LEVEL
        value: INFO
      - key: CORS_ALLOWED_ORIGINS
        sync: false
      - key: SUPABASE_URL
        sync: false
      - key: SUPABASE_KEY
        sync: false
      - key: LLM_PROVIDER_PRIORITY
        value: gemini,openrouter,huggingface,ollama
      - key: GEMINI_API_KEY
        sync: false
      - key: OPENROUTER_API_KEY
        sync: false
      - key: HUGGINGFACE_API_KEY
        sync: false
      - key: OPENAI_API_KEY
        sync: false
      - key: OLLAMA_BASE_URL
        value: http://localhost:11434

```

## Dockerfile

```text
FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential curl \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["sh", "-c", "uvicorn app.api.main:app --host 0.0.0.0 --port ${PORT:-8000}"]

```

## Procfile

```text
web: uvicorn app.api.main:app --host 0.0.0.0 --port ${PORT:-8000}

```

## runtime.txt

```text
python-3.12.1

```

## .streamlit/config.toml

```text
[server]
headless = true

[browser]
gatherUsageStats = false

[theme]
primaryColor = "#2563EB"
backgroundColor = "#F8FAFC"
secondaryBackgroundColor = "#FFFFFF"
textColor = "#0F172A"
font = "sans serif"

```

## .streamlit/secrets.example.toml

```text
# Streamlit Community Cloud secrets example.
# Configure these in Streamlit Cloud Secrets UI.
# Do not commit real secrets.

GO_UMKM_API_BASE_URL = "https://your-render-backend.onrender.com"

[api]
base_url = "https://your-render-backend.onrender.com"

```

## .github/workflows/ci.yml

```text
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  quality:
    name: Ruff and Pytest
    runs-on: ubuntu-latest

    env:
      APP_ENV: testing
      APP_DEBUG: "False"
      LOG_LEVEL: INFO
      SUPABASE_URL: https://example.supabase.co
      SUPABASE_KEY: test-supabase-key
      GEMINI_API_KEY: test-gemini-key
      CORS_ALLOWED_ORIGINS: http://localhost:8501

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.12"

      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          python -m pip install -r requirements.txt

      - name: Ruff check
        run: ruff check app pages tests

      - name: Ruff format check
        run: ruff format app pages tests --check

      - name: Pytest
        run: pytest

      - name: Build verification
        run: |
          python -m py_compile app/api/main.py
          python -m py_compile app.py
          python - <<'PY'
          from app.api.main import create_app
          app = create_app()
          routes = {route.path for route in app.routes}
          assert "/health" in routes
          assert "/api/v1/health" in routes
          assert "/openapi.json" in routes
          print("Build verification passed.")
          PY

```

## DEPLOYMENT.md

```text
# Go-UMKM AI Deployment Guide

## Architecture

```text
GitHub
  -> Render Web Service (FastAPI backend)
  -> Streamlit Community Cloud (frontend)
  -> Supabase PostgreSQL
  -> Multi-LLM Providers
```

The application remains cloud-agnostic. Render can be replaced by Railway,
Fly.io, Google Cloud Run, Azure App Service, or AWS App Runner using the same
start command.

## Backend Deployment on Render

Recommended Render settings:

```text
Runtime: Python
Build Command: pip install --upgrade pip && pip install -r requirements.txt
Start Command: uvicorn app.api.main:app --host 0.0.0.0 --port $PORT
Health Check Path: /health
Python: 3.12
```

You may also use `render.yaml`.

## Frontend Deployment on Streamlit Community Cloud

Deploy `app.py`.

Configure Streamlit Secrets:

```toml
GO_UMKM_API_BASE_URL = "https://your-render-backend.onrender.com"

[api]
base_url = "https://your-render-backend.onrender.com"
```

Configuration priority:

1. Streamlit Secrets
2. Environment Variables
3. Local fallback

## Backend Environment Variables

```env
APP_ENV=production
APP_DEBUG=False
LOG_LEVEL=INFO
SUPABASE_URL=
SUPABASE_KEY=
CORS_ALLOWED_ORIGINS=https://your-streamlit-app.streamlit.app
```

LLM variables:

```env
PRIMARY_LLM_PROVIDER=gemini
LLM_PROVIDER_PRIORITY=gemini,openrouter,huggingface,ollama
ENABLE_PROVIDER_FAILOVER=True
MAX_PROVIDER_RETRIES=2
RETRY_BACKOFF_SECONDS=0.5

GEMINI_API_KEY=
OPENROUTER_API_KEY=
HUGGINGFACE_API_KEY=
OPENAI_API_KEY=
OLLAMA_BASE_URL=http://localhost:11434
```

Frontend:

```env
GO_UMKM_API_BASE_URL=https://your-render-backend.onrender.com
```

## Health Verification

```bash
curl https://your-render-backend.onrender.com/health
curl https://your-render-backend.onrender.com/ready
curl https://your-render-backend.onrender.com/openapi.json
```

Swagger:

```text
https://your-render-backend.onrender.com/docs
```

## Common Troubleshooting

### Frontend cannot reach backend

Check Streamlit Secrets:

```toml
GO_UMKM_API_BASE_URL = "https://your-render-backend.onrender.com"
```

Check backend CORS:

```env
CORS_ALLOWED_ORIGINS=https://your-streamlit-app.streamlit.app
```

### Supabase connection fails

Verify `SUPABASE_URL` and `SUPABASE_KEY` on Render.

### Gemini quota exceeded

Add `OPENROUTER_API_KEY` or `HUGGINGFACE_API_KEY` and keep failover enabled.

## Rollback

1. Revert the latest deployment commit.
2. Push to `main`.
3. Render redeploys backend automatically.
4. Streamlit Community Cloud redeploys frontend automatically.
5. Verify `/health`, `/docs`, and frontend connectivity.

## Production Checklist

- [ ] `.env` is not committed.
- [ ] Supabase secrets are configured in Render.
- [ ] LLM provider secrets are configured in Render.
- [ ] Streamlit backend URL is configured in Secrets UI.
- [ ] `CORS_ALLOWED_ORIGINS` contains the Streamlit domain.
- [ ] `/health` returns healthy.
- [ ] `/ready` returns ready.
- [ ] `/docs` opens Swagger.
- [ ] `/openapi.json` is accessible.
- [ ] Frontend can load dashboard.
- [ ] AI Assistant handles provider failure gracefully.
- [ ] CI passes ruff and pytest.

```

## docs/LATEST_GIT_RECONCILIATION.md

```text
# Latest Git Reconciliation Patch

## Baseline

This patch was generated from the latest uploaded git ZIP:

```text
umkm-copilot-ai-main (2).zip
```

The baseline already contains:

- AI Local Business Intelligence Layer
- Dashboard business switcher
- API `/api/v1` compatibility
- Stage 3-5 frontend redesign
- Sidebar contrast fix

## Reconciled Missing Work

This patch restores the missing parts that were not present in the latest git ZIP:

1. Stage 2 SaaS landing/welcome page in `app.py`
2. Dicoding meta tag injection in `app.py`
3. Streamlit Secrets / environment / local fallback frontend config
4. Production-ready FastAPI app wiring
5. Environment-driven CORS
6. Safe API exception handlers
7. `/ready` readiness endpoint
8. Render deployment files
9. Streamlit Cloud config examples
10. Docker/Procfile/runtime portability files
11. GitHub Actions CI without mypy
12. Deployment documentation

## Deliberate Exclusions

`mypy` is not part of this reconciliation patch or CI workflow because the
current repository has broad historical typing debt. CI runs ruff and pytest.

## Modified Files

- `app.py`
- `app/api/main.py`
- `app/api/routers/health.py`
- `app/config/settings.py`
- `app/utils/logger.py`
- `app/database/connection.py`
- `app/frontend/session.py`
- `app/frontend/api_client.py`
- `requirements.txt`
- `pyproject.toml`
- `.env.example`
- `.gitignore`

## New Files

- `app/frontend/config.py`
- `render.yaml`
- `Dockerfile`
- `Procfile`
- `runtime.txt`
- `.streamlit/config.toml`
- `.streamlit/secrets.example.toml`
- `.github/workflows/ci.yml`
- `DEPLOYMENT.md`

## Validation

```bash
python -m py_compile app.py
python -m py_compile app/api/main.py
python -m py_compile app/api/routers/health.py
python -m py_compile app/config/settings.py
python -m py_compile app/utils/logger.py
python -m py_compile app/database/connection.py
python -m py_compile app/frontend/config.py
python -m py_compile app/frontend/session.py
python -m py_compile app/frontend/api_client.py

ruff check app pages tests
ruff format app pages tests --check
pytest
```

```