# Multi-LLM Provider Patch

## Audit Summary

The existing AI implementation coupled `AIGenerationService` to `GeminiClient`.
When Gemini returned quota, rate-limit, timeout, or server errors, AI generation
failed entirely because there was no provider abstraction, provider health state,
retry policy, circuit breaker, or automatic failover.

The application layers remain unchanged:

Repository -> Service -> Tools -> Workflow -> Agent -> API -> Streamlit

Only the AI provider subsystem is refactored.

## Modified Files

- `app/services/ai_generation_service.py`
- `app/llm/gemini_client.py`

## New Files

- `app/llm/providers/__init__.py`
- `app/llm/providers/base.py`
- `app/llm/providers/config.py`
- `app/llm/providers/default_registry.py`
- `app/llm/providers/errors.py`
- `app/llm/providers/gemini_provider.py`
- `app/llm/providers/huggingface_provider.py`
- `app/llm/providers/http_utils.py`
- `app/llm/providers/ollama_provider.py`
- `app/llm/providers/openrouter_provider.py`
- `app/llm/providers/provider_manager.py`
- `app/llm/providers/registry.py`

## Deleted Files

None.

## Architecture

AIGenerationService
    -> ProviderManager
        -> BaseLLMProvider
            -> GeminiProvider
            -> OpenRouterProvider
            -> HuggingFaceProvider
            -> OllamaProvider

## Environment Variables

```env
LLM_PROVIDER_PRIORITY=gemini,openrouter,huggingface,ollama

GEMINI_API_KEY=
GEMINI_MODEL=gemini-2.0-flash-lite
GEMINI_MODEL_NAME=gemini-2.0-flash-lite

OPENROUTER_API_KEY=
OPENROUTER_MODEL=google/gemini-2.0-flash-exp:free
OPENROUTER_BASE_URL=https://openrouter.ai/api/v1
OPENROUTER_SITE_URL=http://localhost
OPENROUTER_APP_NAME="UMKM Copilot AI"

HUGGINGFACE_API_KEY=
HUGGINGFACE_MODEL=HuggingFaceH4/zephyr-7b-beta
HUGGINGFACE_BASE_URL=https://api-inference.huggingface.co/models

OLLAMA_BASE_URL=http://localhost:11434
OLLAMA_MODEL=llama3.2

LLM_RETRY_MAX_ATTEMPTS=2
LLM_RETRY_BASE_DELAY_SECONDS=0.5
LLM_RETRY_MAX_DELAY_SECONDS=4.0
LLM_PROVIDER_TIMEOUT_SECONDS=30
LLM_CIRCUIT_BREAKER_FAILURE_THRESHOLD=3
LLM_CIRCUIT_BREAKER_COOLDOWN_SECONDS=60
```

## Migration Steps

```bash
unzip -o umkm_multi_llm_provider_patch.zip
python -m py_compile app/services/ai_generation_service.py
python -m py_compile app/llm/gemini_client.py
python -m py_compile app/llm/providers/*.py
pytest tests/test_provider_manager.py tests/test_ai_generation_service_multi_provider.py
uvicorn app.api.main:app --reload
streamlit run app.py
```

## Validation Commands

```bash
ruff check app/llm/providers app/llm/gemini_client.py app/services/ai_generation_service.py tests/test_provider_manager.py tests/test_ai_generation_service_multi_provider.py
ruff format app/llm/providers app/llm/gemini_client.py app/services/ai_generation_service.py tests/test_provider_manager.py tests/test_ai_generation_service_multi_provider.py
mypy app/llm/providers app/llm/gemini_client.py app/services/ai_generation_service.py
pytest tests/test_provider_manager.py tests/test_ai_generation_service_multi_provider.py
```

## Expected Runtime Behavior

1. Gemini is tried first.
2. If Gemini returns retryable failure such as HTTP 429, quota exceeded, timeout,
   or HTTP 5xx, ProviderManager retries with exponential backoff.
3. If Gemini remains unavailable, ProviderManager switches to OpenRouter.
4. If OpenRouter fails, it switches to Hugging Face.
5. If Hugging Face fails, it switches to Ollama.
6. If all providers fail, the user receives only:

`The AI service is temporarily unavailable. Please try again shortly.`

Raw provider errors are logged internally only.
