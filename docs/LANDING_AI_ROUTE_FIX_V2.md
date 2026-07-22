# Landing and AI Route Fix v2

This is the same landing + AI routing fix, with additional Ruff cleanup:

- Adds explicit `strict=` to `zip()` calls in `app.py` for B905.
- Keeps import block compatible with Ruff/isort.
- Excludes generated `__pycache__` and `.pyc` files from the patch archive.

## Apply

```bash
unzip -o go_umkm_landing_ai_route_fix_v2_patch.zip
```

## Validate

```bash
python -m ruff check app.py app/agents/router_agent.py app/services/ai_generation_service.py tests/test_router_agent_business_query_routing.py
python -m py_compile app.py app/agents/router_agent.py app/services/ai_generation_service.py tests/test_router_agent_business_query_routing.py
pytest
```
