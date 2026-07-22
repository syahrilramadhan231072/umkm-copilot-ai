"""
Go-UMKM AI Landing Page
=======================

Production SaaS welcome page for Go-UMKM AI.

This file is Streamlit frontend only. It does not modify backend contracts,
business workflows, repositories, services, tools, agents, APIs, database
schema, or the AI provider layer.
"""

from __future__ import annotations

from collections.abc import Mapping
from html import escape
from typing import Any

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
        create_new_business_mode=bool(st.session_state.get("create_new_business_mode")),
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

    meta_tag = f'<meta name="dicoding:email" content="{escape(DICODING_EMAIL)}">'
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
    """Render landing page sections with native Streamlit components."""

    business_name = str(preferences.get("business_name") or "").strip()
    business_type = str(preferences.get("business_type") or "").strip()
    workspace_label = business_name or "Indonesian MSMEs"
    workspace_subtitle = business_type or "AI-powered business workspace"

    st.markdown("## 🛍️ Go-UMKM AI")
    st.caption("Grow Your Business with AI")

    hero_col, workspace_col = st.columns([0.62, 0.38], vertical_alignment="center")

    with hero_col:
        st.markdown("### AI-Powered Business Assistant")
        st.markdown("# Grow Indonesian MSMEs with intelligent business insights.")
        st.write(
            "AI-powered assistant for Indonesian MSMEs. Analyze transactions, "
            "generate insights, forecast trends, and receive intelligent "
            "recommendations."
        )

        benefit_cols = st.columns(4)
        benefits = [
            ("📊", "AI Insights", "Understand your business better"),
            ("📈", "Smart Forecast", "Predict trends and demand"),
            ("💡", "Recommendations", "Get AI-powered suggestions"),
            ("🚀", "Business Growth", "Make better decisions"),
        ]
        for column, (icon, title, description) in zip(benefit_cols, benefits, strict=True):
            with column:
                st.markdown(f"### {icon}")
                st.markdown(f"**{title}**")
                st.caption(description)

    with workspace_col:
        st.info(state_label)
        st.markdown(f"### {workspace_label}")
        st.write(workspace_subtitle)
        st.markdown(f"**Primary action:** {primary_label}")

    _render_native_feature_sections(st)


def _render_native_feature_sections(st: Any) -> None:
    """Render feature, technology, and value sections without raw HTML blocks."""

    st.divider()
    st.markdown("## Features")
    st.write(
        "Professional tools for daily sales, inventory awareness, analytics, "
        "marketing, and decision support."
    )

    features = [
        ("📊", "Sales Analytics", "Track revenue movement and daily transactions."),
        ("📦", "Product Insights", "Read stock signals and catalog health."),
        ("🤖", "AI Business Assistant", "Ask practical questions about your business."),
        ("📈", "Forecast", "Anticipate demand patterns and trends."),
        ("🛡️", "Business Health", "Monitor signals that indicate risk or strength."),
        ("📣", "Marketing", "Generate campaign ideas and customer messages."),
        ("📄", "Reports", "Prepare summaries for monitoring and planning."),
        ("⬇️", "Export", "Download structured business summaries."),
    ]

    for row_start in range(0, len(features), 4):
        columns = st.columns(4)
        for column, (icon, title, description) in zip(
            columns,
            features[row_start : row_start + 4],
            strict=False,
        ):
            with column:
                st.markdown(f"### {icon}")
                st.markdown(f"**{title}**")
                st.caption(description)

    st.divider()
    stack_col, failover_col = st.columns(2)

    with stack_col:
        st.markdown("## Technology Stack")
        st.write(
            "Frontend and backend stay decoupled through the approved FastAPI "
            "contract while Streamlit provides an interactive user interface."
        )
        st.markdown("`Python` · `FastAPI` · `Streamlit` · `Supabase` · `Multi-LLM Architecture`")

    with failover_col:
        st.markdown("## Automatic AI Failover")
        st.write(
            "Provider priority is designed for stable demos and production "
            "continuity when quota, rate limits, or temporary failures happen."
        )
        st.markdown(
            "1. Gemini\n2. OpenRouter\n3. Hugging Face\n4. OpenAI optional\n5. Ollama optional"
        )

    st.divider()
    st.markdown("## Why Go-UMKM AI")
    why_cols = st.columns(4)
    why_items = [
        ("MSME-first UX", "Practical wording for daily operators."),
        ("Demo resilient", "Presentable even when AI vendors are rate limited."),
        ("Actionable insights", "Outputs focus on business action."),
        ("SaaS-ready frontend", "Reusable sections, spacing, and brand tokens."),
    ]
    for column, (title, description) in zip(why_cols, why_items, strict=True):
        with column:
            st.markdown("### ✓")
            st.markdown(f"**{title}**")
            st.caption(description)


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
                '<a class="go-secondary-link" href="#go-features">Explore Features</a>',
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
        f'<span class="go-stack-badge">{escape(item)}</span>' for item in stack_items
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
