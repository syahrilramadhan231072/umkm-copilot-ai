# Pytest Supabase Collection Fix

## Problem

`tests/test_transaction_repository.py` instantiated `TransactionRepository()`
at module import time. That immediately called `get_supabase()`, which
failed during pytest collection if `SUPABASE_URL` and `SUPABASE_KEY` were
not configured.

## Fix

The test is now a normal pytest function and the Supabase integration smoke
test is opt-in.

It only runs when all of the following are set:

```bash
export RUN_SUPABASE_INTEGRATION_TESTS=1
export SUPABASE_URL="..."
export SUPABASE_KEY="..."
```

Otherwise, the test is skipped instead of crashing collection.

## Ruff command not found

If `ruff` is missing in the current virtual environment, install updated
dependencies after applying the reconciliation patch:

```bash
python -m pip install -r requirements.txt
```

Or install only ruff:

```bash
python -m pip install ruff
```

Then prefer:

```bash
python -m ruff check app pages tests
python -m ruff format app pages tests --check
pytest
```
