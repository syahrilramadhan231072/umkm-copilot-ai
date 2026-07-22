# Transaction Workflow Logging Fix

## Problem

Pytest passed, but the console still showed an ERROR traceback:

```text
ValueError: quantity must be a positive integer.
```

That traceback comes from an expected validation path in
`TransactionWorkflow`. The workflow correctly returns a failure response,
but the helper logged every exception with `logger.exception`, so expected
validation failures looked like runtime errors.

## Fix

This patch changes logging only:

- `ValueError` validation failures are logged as `warning` without traceback.
- Unexpected exceptions still use `logger.exception` with traceback.

Business logic, API response shape, and validation behavior are unchanged.

## Validate

```bash
python -m py_compile app/workflows/transaction_workflow.py
python -m ruff check app/workflows/transaction_workflow.py
pytest
```
