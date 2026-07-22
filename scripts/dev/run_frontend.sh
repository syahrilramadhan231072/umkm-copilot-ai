#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/../.."

set -a
if [ -f .env ]; then
  source .env
fi
set +a

export GO_UMKM_API_BASE_URL="${GO_UMKM_API_BASE_URL:-http://localhost:8000}"

python -m streamlit cache clear || true

python -m streamlit run app.py \
  --server.address 0.0.0.0 \
  --server.port 8501 \
  --server.enableCORS false \
  --server.enableXsrfProtection false
