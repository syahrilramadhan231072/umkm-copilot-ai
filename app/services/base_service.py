"""
Base Service
============

Common helper utilities for all services.
"""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

from app.utils.logger import logger


class BaseService:
    """
    Base class for every service.

    Responsibilities
    ----------------
    * project logger
    * reusable validation helpers
    * reusable conversion helpers
    * reusable repository result helpers

    This class never accesses repositories directly.
    """

    def __init__(self) -> None:
        self._logger = logger

    @staticmethod
    def _required_text(value: Any, field_name: str) -> str:
        """Validate required non-empty text."""
        if value is None:
            raise ValueError(f"{field_name} is required.")

        text = str(value).strip()

        if not text:
            raise ValueError(f"{field_name} cannot be empty.")

        return text

    @staticmethod
    def _validate_positive_number(
        value: int | float,
        field_name: str,
    ) -> None:
        """Validate positive numeric value."""
        if value <= 0:
            raise ValueError(f"{field_name} must be greater than zero.")

    @staticmethod
    def _validate_non_negative_number(
        value: int | float,
        field_name: str,
    ) -> None:
        """Validate non-negative numeric value."""
        if value < 0:
            raise ValueError(f"{field_name} cannot be negative.")

    @staticmethod
    def _validate_limit(limit: int) -> None:
        """Validate list limit."""
        if not isinstance(limit, int) or limit <= 0:
            raise ValueError("limit must be a positive integer.")

    @staticmethod
    def _to_dict(
        value: Mapping[str, Any],
        field_name: str,
    ) -> dict[str, Any]:
        """Convert mapping into dictionary."""
        if not isinstance(value, Mapping):
            raise ValueError(f"{field_name} must be a mapping.")

        result = dict(value)

        if not result:
            raise ValueError(f"{field_name} cannot be empty.")

        return result

    @staticmethod
    def _ensure_dict(
        value: Any,
        message: str,
    ) -> dict[str, Any]:
        """Ensure repository returned a dictionary."""
        if not isinstance(value, dict):
            raise RuntimeError(message)

        return value

    @staticmethod
    def _ensure_list(
        value: Any,
        message: str,
    ) -> list[dict[str, Any]]:
        """Ensure repository returned a list."""
        if not isinstance(value, list):
            raise RuntimeError(message)

        return value

    @staticmethod
    def _ensure_not_none(
        value: Any,
        message: str,
    ) -> Any:
        """Ensure value is not None."""
        if value is None:
            raise LookupError(message)

        return value

    def handle_exception(
        self,
        exception: Exception,
    ) -> None:
        """Log then re-raise exception."""
        self._logger.exception(str(exception))
        raise exception
