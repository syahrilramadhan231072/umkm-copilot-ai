"""
Business Service
================

Service layer for business profile use cases in UMKM Copilot AI.
"""

from __future__ import annotations

from typing import Any, Mapping

from app.repositories.business_repository import BusinessRepository
from app.services.base_service import BaseService
from app.utils.logger import logger


class BusinessService(BaseService):
    """Coordinate business profile use cases through BusinessRepository."""

    def __init__(self, business_repository: BusinessRepository) -> None:
        """Initialize service with injected business repository."""
        super().__init__()
        self._business_repository = business_repository
        self._logger = logger

    def create_business_profile(self, data: Mapping[str, Any]) -> dict[str, Any]:
        """Create a business profile after validating business data."""
        values = self._to_dict(data, "data")
        self._validate_profile(values, require_name=True)

        if self._business_repository.exists():
            raise RuntimeError("Business profile already exists.")

        self._logger.info("Creating business profile.")
        created = self._business_repository.create(values)
        return self._ensure_dict(created, "Business profile creation failed.")

    def get_business_profile(self) -> dict[str, Any]:
        """Return the active business profile."""
        profile = self._business_repository.get_profile()
        if profile is None:
            raise LookupError("Business profile does not exist.")
        return profile

    def list_business_profiles(self, limit: int = 100) -> list[dict[str, Any]]:
        """Return business profile records."""
        self._validate_limit(limit)
        records = self._business_repository.list(limit=limit)
        if not isinstance(records, list):
            raise RuntimeError("Business profile list operation failed.")
        return records

    def update_business_profile(self, values: Mapping[str, Any]) -> dict[str, Any]:
        """Update the active business profile."""
        update_values = self._to_dict(values, "values")
        self._validate_profile(update_values, require_name=False)
        self.get_business_profile()

        self._logger.info("Updating business profile.")
        updated = self._business_repository.update_profile(update_values)
        return self._ensure_dict(updated, "Business profile update failed.")

    def delete_business_profile(self) -> bool:
        """Delete the active business profile when it exists."""
        if not self._business_repository.exists():
            return False

        self._logger.info("Deleting business profile.")
        self._business_repository.delete()
        return True

    def business_profile_exists(self) -> bool:
        """Return whether the active business profile exists."""
        return bool(self._business_repository.exists())

    def count_business_profiles(self) -> int:
        """Return total business profile records."""
        total = self._business_repository.count()
        if not isinstance(total, int):
            raise RuntimeError("Business profile count operation failed.")
        return total

    def get_business_id(self) -> str:
        """Return active business profile ID."""
        profile = self.get_business_profile()
        business_id = profile.get("id")
        if business_id is None:
            raise RuntimeError("Business profile ID is missing.")
        return str(business_id)

    def get_business_context(self) -> dict[str, Any]:
        """Return structured business context for upper layers."""
        profile = self.get_business_profile()
        return {
            "business_id": str(profile["id"]),
            "business_name": profile.get("business_name"),
            "owner_name": profile.get("owner_name"),
            "business_type": profile.get("business_type"),
            "currency": profile.get("currency"),
            "timezone": profile.get("timezone"),
            "address": profile.get("address"),
        }

    def _validate_profile(
        self,
        values: Mapping[str, Any],
        *,
        require_name: bool,
    ) -> None:
        """Validate business profile values."""
        if require_name or "business_name" in values:
            self._required_text(values.get("business_name"), "business_name")

        if values.get("email") is not None:
            email = str(values["email"]).strip()
            if "@" not in email or "." not in email.rsplit("@", maxsplit=1)[-1]:
                raise ValueError("email format is invalid.")

        for field_name in ("currency", "timezone"):
            if field_name in values:
                self._required_text(values.get(field_name), field_name)

    def _to_dict(self, value: Mapping[str, Any], field_name: str) -> dict[str, Any]:
        """Convert mapping input into a non-empty dictionary."""
        if not isinstance(value, Mapping):
            raise ValueError(f"{field_name} must be a mapping.")
        result = dict(value)
        if not result:
            raise ValueError(f"{field_name} cannot be empty.")
        return result

    def _required_text(self, value: Any, field_name: str) -> str:
        """Validate and return required text value."""
        if value is None:
            raise ValueError(f"{field_name} is required.")
        text = str(value).strip()
        if not text:
            raise ValueError(f"{field_name} cannot be empty.")
        return text

    def _validate_limit(self, limit: int) -> None:
        """Validate list limit."""
        if not isinstance(limit, int) or limit <= 0:
            raise ValueError("limit must be a positive integer.")

    def _ensure_dict(self, value: Any, message: str) -> dict[str, Any]:
        """Ensure repository result is a dictionary."""
        if not isinstance(value, dict):
            raise RuntimeError(message)
        return value
