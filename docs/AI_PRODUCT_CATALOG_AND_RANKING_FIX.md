# AI Product Catalog and Ranking Fix

## Problem

AI Conversation could answer `produk apa yang dijual?`, but it mixed product catalog data with ranked analytics data. It returned products such as `Chicken Sandwich Promo - nilai 2214000`, which are top-revenue analytics entries, not necessarily active catalog items.

Follow-up questions such as `yang paling laku` still fell through to the LLM provider and failed when all providers were unavailable.

## Root Cause

`AIGenerationService` treated ranked analytics containers (`top_products_by_revenue`, `top_products_by_quantity`) as normal product catalog containers. It also did not have deterministic fallback logic for best-selling product questions.

## Fix

- Product catalog questions now use only active product containers, especially `products` populated from `ProductTools.list_active_products`.
- Ranked analytics are excluded from catalog answers.
- Best-selling questions are answered locally from `top_products_by_quantity` first, then revenue ranking when appropriate.
- Revenue-specific questions use `top_products_by_revenue`.
- AIConversationWorkflow receives `ProductTools` via dependency injection and adds active product catalog context.

## Modified Files

- `app/services/ai_generation_service.py`
- `app/workflows/ai_conversation_workflow.py`
- `app/api/dependencies.py`

## New Tests

- `tests/test_ai_generation_service_product_catalog_ranking.py`
- `tests/test_ai_conversation_workflow_product_context_ranking.py`

## Validation

```bash
python -m py_compile app/services/ai_generation_service.py
python -m py_compile app/workflows/ai_conversation_workflow.py
python -m py_compile app/api/dependencies.py

pytest tests/test_ai_generation_service_product_catalog_ranking.py
pytest tests/test_ai_conversation_workflow_product_context_ranking.py
pytest tests/test_ai_conversation_workflow.py
pytest tests/test_ai_generation_service_local_context_fallback.py
```
