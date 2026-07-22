from __future__ import annotations

import os

import pytest

from app.repositories.transaction_repository import TransactionRepository


def _supabase_test_enabled() -> bool:
    """Return whether Supabase-backed repository integration tests are enabled."""

    return (
        os.getenv("RUN_SUPABASE_INTEGRATION_TESTS") == "1"
        and bool(os.getenv("SUPABASE_URL", "").strip())
        and bool(os.getenv("SUPABASE_KEY", "").strip())
    )


def test_transaction_repository_ping_and_list() -> None:
    """
    Smoke-test TransactionRepository only when Supabase integration is enabled.

    This file used to instantiate TransactionRepository at import time, which
    made the entire pytest collection fail whenever SUPABASE_URL/SUPABASE_KEY
    were not configured. Repository integration tests should be opt-in because
    local CI and public pull requests should not require real Supabase secrets.
    """

    if not _supabase_test_enabled():
        pytest.skip(
            "Set RUN_SUPABASE_INTEGRATION_TESTS=1 with SUPABASE_URL and "
            "SUPABASE_KEY to run Supabase repository integration tests."
        )

    repo = TransactionRepository()

    assert isinstance(repo.ping(), bool)

    rows = repo.list(limit=5)

    assert isinstance(rows, list)
    if rows:
        assert isinstance(rows[0], dict)
