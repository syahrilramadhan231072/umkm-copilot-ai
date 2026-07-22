# Go-UMKM AI Deployment Guide

## Architecture

```text
GitHub
  -> Render Web Service (FastAPI backend)
  -> Streamlit Community Cloud (frontend)
  -> Supabase PostgreSQL
  -> Multi-LLM Providers
```

The application remains cloud-agnostic. Render can be replaced by Railway,
Fly.io, Google Cloud Run, Azure App Service, or AWS App Runner using the same
start command.

## Backend Deployment on Render

Recommended Render settings:

```text
Runtime: Python
Build Command: pip install --upgrade pip && pip install -r requirements.txt
Start Command: uvicorn app.api.main:app --host 0.0.0.0 --port $PORT
Health Check Path: /health
Python: 3.12
```

You may also use `render.yaml`.

## Frontend Deployment on Streamlit Community Cloud

Deploy `app.py`.

Configure Streamlit Secrets:

```toml
GO_UMKM_API_BASE_URL = "https://your-render-backend.onrender.com"

[api]
base_url = "https://your-render-backend.onrender.com"
```

Configuration priority:

1. Streamlit Secrets
2. Environment Variables
3. Local fallback

## Backend Environment Variables

```env
APP_ENV=production
APP_DEBUG=False
LOG_LEVEL=INFO
SUPABASE_URL=
SUPABASE_KEY=
CORS_ALLOWED_ORIGINS=https://your-streamlit-app.streamlit.app
```

LLM variables:

```env
PRIMARY_LLM_PROVIDER=gemini
LLM_PROVIDER_PRIORITY=gemini,openrouter,huggingface,ollama
ENABLE_PROVIDER_FAILOVER=True
MAX_PROVIDER_RETRIES=2
RETRY_BACKOFF_SECONDS=0.5

GEMINI_API_KEY=
OPENROUTER_API_KEY=
HUGGINGFACE_API_KEY=
OPENAI_API_KEY=
OLLAMA_BASE_URL=http://localhost:11434
```

Frontend:

```env
GO_UMKM_API_BASE_URL=https://your-render-backend.onrender.com
```

## Health Verification

```bash
curl https://your-render-backend.onrender.com/health
curl https://your-render-backend.onrender.com/ready
curl https://your-render-backend.onrender.com/openapi.json
```

Swagger:

```text
https://your-render-backend.onrender.com/docs
```

## Common Troubleshooting

### Frontend cannot reach backend

Check Streamlit Secrets:

```toml
GO_UMKM_API_BASE_URL = "https://your-render-backend.onrender.com"
```

Check backend CORS:

```env
CORS_ALLOWED_ORIGINS=https://your-streamlit-app.streamlit.app
```

### Supabase connection fails

Verify `SUPABASE_URL` and `SUPABASE_KEY` on Render.

### Gemini quota exceeded

Add `OPENROUTER_API_KEY` or `HUGGINGFACE_API_KEY` and keep failover enabled.

## Rollback

1. Revert the latest deployment commit.
2. Push to `main`.
3. Render redeploys backend automatically.
4. Streamlit Community Cloud redeploys frontend automatically.
5. Verify `/health`, `/docs`, and frontend connectivity.

## Production Checklist

- [ ] `.env` is not committed.
- [ ] Supabase secrets are configured in Render.
- [ ] LLM provider secrets are configured in Render.
- [ ] Streamlit backend URL is configured in Secrets UI.
- [ ] `CORS_ALLOWED_ORIGINS` contains the Streamlit domain.
- [ ] `/health` returns healthy.
- [ ] `/ready` returns ready.
- [ ] `/docs` opens Swagger.
- [ ] `/openapi.json` is accessible.
- [ ] Frontend can load dashboard.
- [ ] AI Assistant handles provider failure gracefully.
- [ ] CI passes ruff and pytest.
