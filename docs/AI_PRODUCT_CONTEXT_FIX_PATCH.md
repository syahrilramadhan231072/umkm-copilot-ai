# AI Product Context Fix Patch

## Problem

The AI local-context fallback answered product questions with dashboard KPI labels:

- Total Revenue
- Completed Transactions
- Active Products
- Low Stock Items
- Estimated Unique Customers

This happened because `AIGenerationService` scanned arbitrary nested dictionaries
and accepted generic keys such as `label` and `title` as product names. Dashboard
KPI cards contain `label`, so they were incorrectly interpreted as product records.

## Root Cause

There were two issues:

1. Product extraction was too broad.
2. AI Conversation context did not explicitly include the active product catalog.

## Scope

This patch uses the existing approved architecture:

Repository -> Service -> Tools -> Workflow -> Agent -> API -> Streamlit

No Repository changes.
No database schema changes.
No API contract changes.
No frontend behaviour changes.

The patch makes the smallest safe changes:

- `AIGenerationService` now extracts products only from explicit product containers.
- `AIConversationWorkflow` now adds active products to AI context using existing `ProductTools`.
- `dependencies.py` injects the already-existing `ProductTools` into `AIConversationWorkflow`.

## Modified Files

- `app/services/ai_generation_service.py`
- `app/workflows/ai_conversation_workflow.py`
- `app/api/dependencies.py`

## New Test Files

- `tests/test_ai_generation_service_product_context_guard.py`
- `tests/test_ai_conversation_workflow_product_context.py`

## Deleted Files

None.

## Expected Behaviour

User asks:

`produk apa saja yang dijual?`

Expected answer uses real active products from `ProductTools.list_active_products(...)`.

If product context is empty, the assistant answers that it cannot find product data,
instead of incorrectly listing KPI labels.

## Validation Commands

```bash
python -m py_compile app/services/ai_generation_service.py
python -m py_compile app/workflows/ai_conversation_workflow.py
python -m py_compile app/api/dependencies.py

pytest tests/test_ai_generation_service_product_context_guard.py
pytest tests/test_ai_conversation_workflow_product_context.py
pytest tests/test_ai_conversation_workflow.py
pytest tests/test_ai_generation_service_local_context_fallback.py
```

## Restart

```bash
set -a
source .env
set +a

pkill -f "uvicorn app.api.main:app" || true
uvicorn app.api.main:app --reload

streamlit run app.py
```
