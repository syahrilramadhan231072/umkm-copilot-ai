# AI Conversation Gemini Patch

Patch ini memperbaiki AI Conversation yang sebelumnya selalu menampilkan ringkasan dashboard yang sama.

## Root Cause

Alur lama:

Streamlit `pages/AI_Assistant.py`
→ `FrontendApiClient.route()`
→ `POST /router/route`
→ `RouterAgent.classify_intent()`
→ default `business`
→ `BusinessWorkflow.run_business_overview()`
→ frontend membuat template dashboard sendiri.

Gemini tidak dipanggil pada alur tersebut.

## Perubahan

Endpoint tetap sama:

- `POST /router/route`

Kontrak request tetap sama:

```json
{
  "user_input": "...",
  "payload": {...},
  "explicit_route": null
}
```

Patch menambahkan chain backend:

`RouterAgent`
→ `AIConversationWorkflow`
→ `AIGenerationService`
→ `GeminiClient` lazy init
→ Gemini

## File Baru

- `app/services/ai_generation_service.py`
- `app/workflows/ai_conversation_workflow.py`

## File Diubah

- `app/agents/router_agent.py`
- `app/api/dependencies.py`
- `pages/AI_Assistant.py`

## Perilaku Baru

- `Hi`, `Hello`, pertanyaan umum, dan pertanyaan konseptual masuk ke route `conversation`.
- `Apa itu break even point?` dijawab Gemini sebagai konsep umum.
- `What is the best product?` dapat dijawab Gemini dengan business context.
- Frontend tidak lagi membuat jawaban template dashboard untuk semua prompt.
- Frontend menampilkan `answer/text` dari backend.

## Environment

Pastikan salah satu environment variable tersedia:

```bash
export GEMINI_API_KEY="..."
# atau
export GOOGLE_API_KEY="..."
```

## Instalasi

```bash
unzip -o umkm_ai_conversation_gemini_patch.zip

python -m py_compile app/services/ai_generation_service.py
python -m py_compile app/workflows/ai_conversation_workflow.py
python -m py_compile app/agents/router_agent.py
python -m py_compile app/api/dependencies.py
python -m py_compile pages/AI_Assistant.py
```

Jalankan ulang backend dan frontend:

```bash
uvicorn app.api.main:app --reload
streamlit run app.py
```

Tes yang relevan:

```bash
pytest tests/test_ai_generation_service.py tests/test_ai_conversation_workflow.py tests/test_router_agent_ai_conversation.py
```
