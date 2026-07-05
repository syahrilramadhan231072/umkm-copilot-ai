from app.repositories.transaction_repository import (
    TransactionRepository,
)

repo = TransactionRepository()

print("=" * 60)
print("Repository Ping")
print("=" * 60)

print(repo.ping())

print("=" * 60)

rows = repo.list(limit=5)

print(f"Retrieved : {len(rows)}")

if rows:
    print(rows[0])

print("=" * 60)
