"""
Transaction Service Tests
=========================

Pytest tests for TransactionService with real repositories.
"""

from __future__ import annotations

from uuid import uuid4

import pytest

from app.repositories.business_repository import BusinessRepository
from app.repositories.product_repository import ProductRepository
from app.repositories.transaction_repository import TransactionRepository
from app.services.product_service import ProductService
from app.services.transaction_service import TransactionService


@pytest.fixture()
def business_repository() -> BusinessRepository:
    """Return real business repository."""
    return BusinessRepository()


@pytest.fixture()
def product_repository() -> ProductRepository:
    """Return real product repository."""
    return ProductRepository()


@pytest.fixture()
def transaction_repository() -> TransactionRepository:
    """Return real transaction repository."""
    return TransactionRepository()


@pytest.fixture()
def service(
    transaction_repository: TransactionRepository,
    product_repository: ProductRepository,
) -> TransactionService:
    """Return TransactionService with real repositories."""
    return TransactionService(transaction_repository, product_repository)


def _business_id(repository: BusinessRepository) -> str:
    """Return demo business ID."""
    profile = repository.get_profile()
    if profile is None:
        pytest.skip("No business profile demo data available.")
    return str(profile["id"])


def _create_product(business_id: str, repository: ProductRepository) -> dict[str, object]:
    """Create a product for transaction integration test."""
    token = uuid4().hex[:12]
    return ProductService(repository).create_product(
        business_id,
        {
            "id": str(uuid4()),
            "name": f"Transaction Product {token}",
            "category": "Testing",
            "sku": f"TRX-{token}",
            "description": "Created by TransactionService test.",
            "selling_price": 30000,
            "cost_price": 10000,
            "stock": 10,
            "minimum_stock": 2,
            "unit": "pcs",
            "barcode": f"898{uuid4().int % 10_000_000_000:010d}",
            "is_active": True,
        },
    )


def test_transaction_service_create_update_delete(
    business_repository: BusinessRepository,
    product_repository: ProductRepository,
    transaction_repository: TransactionRepository,
    service: TransactionService,
) -> None:
    """Assert that service creates, updates, and deletes transaction."""
    business_id = _business_id(business_repository)
    product = _create_product(business_id, product_repository)
    product_id = str(product["id"])
    transaction_id: str | None = None

    try:
        created = service.create_transaction(
            business_id=business_id,
            product_id=product_id,
            quantity=2,
            payment_method="cash",
        )
        transaction_id = str(created["id"])

        assert created["total_price"] == 60000
        assert created["quantity"] == 2

        stocked_product = product_repository.get(product_id)
        assert stocked_product is not None
        assert stocked_product["stock"] == 8

        updated = service.update_transaction_status(transaction_id, "refunded")
        assert updated["status"] == "refunded"

    finally:
        if transaction_id and transaction_repository.get(transaction_id) is not None:
            transaction_repository.delete(transaction_id)
        if product_repository.get(product_id) is not None:
            product_repository.delete(product_id)


def test_transaction_service_calculates_total(service: TransactionService) -> None:
    """Assert that service calculates transaction total."""
    assert service.calculate_transaction_total(12000, 3) == 36000


def test_transaction_service_rejects_invalid_quantity(
    business_repository: BusinessRepository,
    product_repository: ProductRepository,
    service: TransactionService,
) -> None:
    """Assert that service rejects invalid quantity."""
    business_id = _business_id(business_repository)
    product = _create_product(business_id, product_repository)

    try:
        with pytest.raises(ValueError):
            service.create_transaction(business_id, str(product["id"]), 0)
    finally:
        if product_repository.get(str(product["id"])) is not None:
            product_repository.delete(str(product["id"]))
