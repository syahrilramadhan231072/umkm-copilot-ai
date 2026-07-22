"""
Base Analytics
==============

Base class for all read-only analytics components.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from collections import defaultdict
from collections.abc import Iterable, Mapping
from decimal import Decimal, InvalidOperation
from typing import Any

from app.utils.logger import logger


class BaseAnalytics:
    """
    Base class for Analytics Layer components.

    BaseAnalytics provides reusable validation, numeric parsing, grouping,
    aggregation, and sorting helpers. It does not access repositories directly
    and does not perform any database mutation.
    """

    def __init__(self) -> None:
        """Initialize base analytics with project logger."""

        self._logger = logger

    def _validate_required_text(self, value: Any, *, field_name: str) -> str:
        """
        Validate that a required value can be represented as non-empty text.

        Args:
            value: Value to validate.
            field_name: Field name used in error messages.

        Returns:
            Stripped text.

        Raises:
            ValueError: If value is missing or empty.
        """

        if value is None:
            raise ValueError(f"{field_name} is required.")

        text = str(value).strip()

        if not text:
            raise ValueError(f"{field_name} cannot be empty.")

        return text

    def _validate_positive_int(self, value: Any, *, field_name: str) -> int:
        """
        Validate that a value is a positive integer.

        Args:
            value: Value to validate.
            field_name: Field name used in error messages.

        Returns:
            Validated integer.

        Raises:
            ValueError: If value is not a positive integer.
        """

        if not isinstance(value, int):
            raise ValueError(f"{field_name} must be an integer.")

        if value <= 0:
            raise ValueError(f"{field_name} must be greater than zero.")

        return value

    def _validate_non_negative_int(self, value: Any, *, field_name: str) -> int:
        """
        Validate that a value is a non-negative integer.

        Args:
            value: Value to validate.
            field_name: Field name used in error messages.

        Returns:
            Validated integer.

        Raises:
            ValueError: If value is not a non-negative integer.
        """

        if not isinstance(value, int):
            raise ValueError(f"{field_name} must be an integer.")

        if value < 0:
            raise ValueError(f"{field_name} cannot be negative.")

        return value

    def _ensure_list(
        self,
        value: Any,
        *,
        field_name: str,
    ) -> list[dict[str, Any]]:
        """
        Ensure that a repository response is a list of dictionaries.

        Args:
            value: Repository response.
            field_name: Field name used in error messages.

        Returns:
            List of dictionaries.

        Raises:
            RuntimeError: If the response is not a list of dictionaries.
        """

        if not isinstance(value, list):
            raise RuntimeError(f"{field_name} must be a list.")

        for item in value:
            if not isinstance(item, dict):
                raise RuntimeError(f"{field_name} must contain dictionaries.")

        return value

    def _ensure_mapping(
        self,
        value: Any,
        *,
        field_name: str,
    ) -> dict[str, Any]:
        """
        Ensure that a value is a dictionary.

        Args:
            value: Value to validate.
            field_name: Field name used in error messages.

        Returns:
            Dictionary value.

        Raises:
            RuntimeError: If value is not a dictionary.
        """

        if not isinstance(value, dict):
            raise RuntimeError(f"{field_name} must be a dictionary.")

        return value

    def _to_decimal(self, value: Any) -> Decimal:
        """
        Convert value to Decimal safely.

        Args:
            value: Value to convert.

        Returns:
            Decimal value. Invalid values become Decimal zero.
        """

        if value is None:
            return Decimal("0")

        try:
            return Decimal(str(value))
        except (InvalidOperation, ValueError):
            return Decimal("0")

    def _to_int(self, value: Any) -> int:
        """
        Convert value to integer safely.

        Args:
            value: Value to convert.

        Returns:
            Integer value. Invalid values become zero.
        """

        try:
            return int(self._to_decimal(value))
        except (OverflowError, ValueError):
            return 0

    def _sum_numeric(
        self,
        records: Iterable[Mapping[str, Any]],
        field_name: str,
    ) -> int:
        """
        Sum numeric field values.

        Args:
            records: Records containing numeric values.
            field_name: Numeric field name.

        Returns:
            Integer sum.
        """

        total = Decimal("0")

        for record in records:
            total += self._to_decimal(record.get(field_name))

        return int(total)

    def _average_numeric(
        self,
        records: list[Mapping[str, Any]],
        field_name: str,
    ) -> float:
        """
        Calculate average numeric value.

        Args:
            records: Records containing numeric values.
            field_name: Numeric field name.

        Returns:
            Average value.
        """

        if not records:
            return 0.0

        total = self._sum_numeric(records, field_name)

        return round(total / len(records), 2)

    def _safe_divide(
        self,
        numerator: int | float,
        denominator: int | float,
        *,
        precision: int = 2,
    ) -> float:
        """
        Divide numbers safely.

        Args:
            numerator: Numerator value.
            denominator: Denominator value.
            precision: Decimal precision.

        Returns:
            Division result, or zero when denominator is zero.
        """

        if denominator == 0:
            return 0.0

        return round(numerator / denominator, precision)

    def _group_count(
        self,
        records: Iterable[Mapping[str, Any]],
        field_name: str,
        *,
        default: str = "unknown",
    ) -> dict[str, int]:
        """
        Count records by field.

        Args:
            records: Records to group.
            field_name: Field used as group key.
            default: Default key for missing values.

        Returns:
            Count per group.
        """

        grouped: dict[str, int] = defaultdict(int)

        for record in records:
            key = record.get(field_name)
            text_key = default if key is None or str(key).strip() == "" else str(key)
            grouped[text_key] += 1

        return dict(grouped)

    def _group_sum(
        self,
        records: Iterable[Mapping[str, Any]],
        group_field: str,
        value_field: str,
        *,
        default: str = "unknown",
    ) -> dict[str, int]:
        """
        Sum numeric values by group.

        Args:
            records: Records to group.
            group_field: Field used as group key.
            value_field: Numeric field to sum.
            default: Default key for missing values.

        Returns:
            Sum per group.
        """

        grouped: dict[str, Decimal] = defaultdict(lambda: Decimal("0"))

        for record in records:
            key = record.get(group_field)
            text_key = default if key is None or str(key).strip() == "" else str(key)
            grouped[text_key] += self._to_decimal(record.get(value_field))

        return {key: int(value) for key, value in grouped.items()}

    def _sort_mapping_desc(
        self,
        values: Mapping[str, int | float],
        *,
        limit: int,
    ) -> list[dict[str, Any]]:
        """
        Sort mapping items by numeric value descending.

        Args:
            values: Mapping to sort.
            limit: Maximum number of items returned.

        Returns:
            Sorted list of dictionaries.
        """

        self._validate_positive_int(limit, field_name="limit")

        sorted_items = sorted(
            values.items(),
            key=lambda item: item[1],
            reverse=True,
        )

        return [
            {
                "key": key,
                "value": value,
            }
            for key, value in sorted_items[:limit]
        ]

    def _filter_by_business_id(
        self,
        records: Iterable[Mapping[str, Any]],
        business_id: str,
    ) -> list[dict[str, Any]]:
        """
        Filter records by business ID.

        Args:
            records: Records to filter.
            business_id: Business identifier.

        Returns:
            Matching records as dictionaries.
        """

        return [
            dict(record) for record in records if str(record.get("business_id")) == str(business_id)
        ]

    def _only_completed_transactions(
        self,
        records: Iterable[Mapping[str, Any]],
    ) -> list[dict[str, Any]]:
        """
        Filter completed transaction records.

        Args:
            records: Transaction records.

        Returns:
            Completed transaction records.
        """

        return [
            dict(record)
            for record in records
            if str(record.get("status", "completed")) == "completed"
        ]

    def _build_empty_summary(
        self,
        business_id: str,
        *,
        summary_type: str,
    ) -> dict[str, Any]:
        """
        Build standard empty summary.

        Args:
            business_id: Business identifier.
            summary_type: Summary type.

        Returns:
            Empty summary payload.
        """

        return {
            "business_id": str(business_id),
            "summary_type": summary_type,
            "is_empty": True,
        }
