# Landing and AI Route Fix

## Problems fixed

1. Landing page showed raw HTML tags in Streamlit.
2. AI Assistant routed business-reading questions such as
   `produk apa yang terjual` to transaction creation, causing
   `quantity must be an integer`.

## Changes

- `app.py`
  - Renders the landing page with native Streamlit components instead
    of one large raw HTML block.
  - Keeps the same onboarding/CTA workflow.

- `app/agents/router_agent.py`
  - Routes BI/product/stok/margin/alert questions to AI conversation.
  - Keeps real transaction creation prompts routed to transaction agent.

- `app/services/ai_generation_service.py`
  - Treats sold-product questions as best-selling/sold-product BI intent.

- `tests/test_router_agent_business_query_routing.py`
  - Adds regression coverage for the AI routing bug.

## Validate

```bash
python -m ruff check app.py app/agents/router_agent.py app/services/ai_generation_service.py tests/test_router_agent_business_query_routing.py
python -m py_compile app.py app/agents/router_agent.py app/services/ai_generation_service.py tests/test_router_agent_business_query_routing.py
pytest
```
