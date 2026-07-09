#!/usr/bin/env bash

set -euo pipefail

echo "============================================================"
echo "UMKM Copilot AI - Database Integrity Check"
echo "============================================================"

echo
echo "[1/8] Repository Test"
python -m tests.test_transaction_repository

echo
echo "[2/8] Check business_profile"
python - <<'PY'
from app.database.connection import get_supabase

db = get_supabase()

rows = db.table("business_profile").select("id").execute().data
print("business_profile :", len(rows))

assert len(rows) == 1
PY

echo
echo "[3/8] Check products"
python - <<'PY'
from app.database.connection import get_supabase

db = get_supabase()

rows = db.table("products").select("id").execute().data
print("products :", len(rows))

assert len(rows) > 0
PY

echo
echo "[4/8] Check transactions"
python - <<'PY'
from app.database.connection import get_supabase

db = get_supabase()

rows = db.table("transactions").select("id").execute().data
print("transactions :", len(rows))

assert len(rows) > 0
PY

echo
echo "[5/8] Check marketing_history"
python - <<'PY'
from app.database.connection import get_supabase

db = get_supabase()

rows = db.table("marketing_history").select("id").execute().data
print("marketing_history :", len(rows))

assert len(rows) > 0
PY

echo
echo "[6/8] Check ai_conversations"
python - <<'PY'
from app.database.connection import get_supabase

db = get_supabase()

rows = db.table("ai_conversations").select("id").execute().data
print("ai_conversations :", len(rows))

assert len(rows) > 0
PY

echo
echo "[7/8] Check insights"
python - <<'PY'
from app.database.connection import get_supabase

db = get_supabase()

rows = db.table("insights").select("id").execute().data
print("insights :", len(rows))

assert len(rows) > 0
PY

echo
echo "[8/8] Check Views"

python - <<'PY'
from app.database.connection import get_supabase

db = get_supabase()

for view in (
    "sales_summary",
    "product_summary",
    "inventory_summary",
):
    rows = db.table(view).select("*").limit(1).execute().data
    print(f"{view}: OK ({len(rows)} row sampled)")
PY

echo
echo "============================================================"
echo "DATABASE INTEGRITY PASSED"
echo "============================================================"
