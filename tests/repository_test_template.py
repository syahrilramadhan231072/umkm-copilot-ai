"""
Repository Test Template
========================

Shared test helpers for repository layer tests.

Responsibilities
----------------
- Provide reusable assertions for repository CRUD tests
- Provide reusable helpers for demo data access
- Keep repository tests consistent
- Use real Supabase database access through repositories

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from typing import Any
from uuid import UUID

import pytest

from app.utils.logger import logger


def assert_repository_ping(repository: Any) -> None:
    """
    Assert that repository can access its Supabase table.

    Args:
        repository: Repository instance.
    """

    assert repository.ping() is True


def assert_repository_count(repository: Any) -> None:
    """
    Assert that repository count method returns an integer.

    Args:
        repository: Repository instance.
    """

    total = repository.count()

    assert isinstance(total, int)
    assert total >= 0


def assert_repository_list(
    repository: Any,
    limit: int = 10,
) -> list[dict[str, Any]]:
    """
    Assert that repository list method returns records as a list.

    Args:
        repository: Repository instance.
        limit: Maximum number of records returned.

    Returns:
        List of records returned by repository.
    """

    records = repository.list(limit=limit)

    assert isinstance(records, list)

    for record in records:
        assert isinstance(record, dict)

    return records


def get_first_record(
    repository: Any,
) -> dict[str, Any]:
    """
    Get the first available record from repository.

    Args:
        repository: Repository instance.

    Returns:
        First repository record.

    Raises:
        pytest.skip: If demo data is not available.
    """

    records = repository.list(limit=1)

    if not records:
        pytest.skip(f"No demo data available for {repository.TABLE_NAME}.")

    return records[0]


def get_record_id(
    record: dict[str, Any],
) -> UUID | str:
    """
    Get record ID from a repository record.

    Args:
        record: Repository record.

    Returns:
        Record ID.

    Raises:
        AssertionError: If ID is not available.
    """

    record_id = record.get("id")

    assert record_id is not None

    return record_id


def assert_repository_get(
    repository: Any,
    record_id: UUID | str,
) -> dict[str, Any]:
    """
    Assert that repository get method returns a record.

    Args:
        repository: Repository instance.
        record_id: Record ID.

    Returns:
        Record returned by repository.
    """

    record = repository.get(record_id)

    assert record is not None
    assert isinstance(record, dict)
    assert str(record["id"]) == str(record_id)

    return record


def assert_repository_exists(
    repository: Any,
    record_id: UUID | str,
) -> None:
    """
    Assert that repository exists method returns True for a record.

    Args:
        repository: Repository instance.
        record_id: Record ID.
    """

    assert repository.exists(record_id) is True


def assert_repository_create_update_delete(
    repository: Any,
    create_data: dict[str, Any],
    update_values: dict[str, Any],
) -> None:
    """
    Assert that repository can create, update, and delete a record.

    Args:
        repository: Repository instance.
        create_data: Data used to create a record.
        update_values: Values used to update created record.
    """

    created = repository.create(create_data)

    assert isinstance(created, dict)
    assert created.get("id") is not None

    record_id = created["id"]

    fetched = repository.get(record_id)

    assert fetched is not None
    assert str(fetched["id"]) == str(record_id)

    updated = repository.update(
        record_id,
        update_values,
    )

    assert isinstance(updated, dict)
    assert str(updated["id"]) == str(record_id)

    for key, value in update_values.items():
        assert updated[key] == value

    repository.delete(record_id)

    deleted = repository.get(record_id)

    assert deleted is None

    logger.success(f"{repository.TABLE_NAME} create-update-delete test OK.")


def assert_required_keys(
    record: dict[str, Any],
    required_keys: set[str],
) -> None:
    """
    Assert that a record contains required keys.

    Args:
        record: Repository record.
        required_keys: Required record keys.
    """

    missing_keys = required_keys.difference(record.keys())

    assert not missing_keys


def assert_records_have_business_id(
    records: list[dict[str, Any]],
    business_id: UUID | str,
) -> None:
    """
    Assert that all records belong to a business.

    Args:
        records: Repository records.
        business_id: Business ID.
    """

    for record in records:
        assert str(record["business_id"]) == str(business_id)


def assert_records_limit(
    records: list[dict[str, Any]],
    limit: int,
) -> None:
    """
    Assert that returned records do not exceed limit.

    Args:
        records: Repository records.
        limit: Maximum allowed record count.
    """

    assert len(records) <= limit


def assert_sorted_desc(
    records: list[dict[str, Any]],
    field_name: str,
) -> None:
    """
    Assert that records are sorted descending by a field.

    Args:
        records: Repository records.
        field_name: Field used for sorting.
    """

    values = [
        record[field_name] for record in records if record.get(field_name) is not None
    ]

    assert values == sorted(
        values,
        reverse=True,
    )


def assert_sorted_asc(
    records: list[dict[str, Any]],
    field_name: str,
) -> None:
    """
    Assert that records are sorted ascending by a field.

    Args:
        records: Repository records.
        field_name: Field used for sorting.
    """

    values = [
        record[field_name] for record in records if record.get(field_name) is not None
    ]

    assert values == sorted(values)


def get_business_profile(
    business_repository: Any,
) -> dict[str, Any]:
    """
    Get existing business profile from demo database.

    Args:
        business_repository: Business repository instance.

    Returns:
        Business profile record.

    Raises:
        pytest.skip: If business profile demo data is not available.
    """

    profile = business_repository.get_profile()

    if profile is None:
        pytest.skip("No business profile demo data available.")

    return profile


def get_business_id(
    business_repository: Any,
) -> UUID | str:
    """
    Get business ID from existing business profile.

    Args:
        business_repository: Business repository instance.

    Returns:
        Business ID.
    """

    profile = get_business_profile(business_repository)

    return get_record_id(profile)
