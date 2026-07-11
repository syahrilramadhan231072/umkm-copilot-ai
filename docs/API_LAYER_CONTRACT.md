# API LAYER CONTRACT

**Project:** UMKM Copilot AI  
**Layer:** API Layer  
**Status:** Official Architecture Contract  
**Phase:** Phase 9  
**Framework:** FastAPI  

---

## 1. Tujuan API Layer

API Layer adalah lapisan opsional yang menyediakan HTTP interface untuk mengakses kemampuan UMKM Copilot AI.

API Layer bertugas menerima request HTTP, memvalidasi request schema, memanggil Agent Layer atau Workflow Layer melalui dependency injection, lalu mengembalikan response HTTP yang terstruktur.

API Layer tidak boleh mengandung business logic, tidak boleh mengakses database langsung, tidak boleh memanggil Repository, tidak boleh memanggil Supabase, dan tidak boleh memanggil LLM provider langsung.

Tujuan utama API Layer adalah:

1. Menyediakan HTTP endpoint untuk frontend, integrasi eksternal, atau client lain.
2. Menstandarkan request dan response.
3. Menyediakan dependency injection FastAPI.
4. Menyediakan routing domain untuk transaction, marketing, insight, analytics, export, dan business.
5. Menjaga agar business logic tetap berada di Service Layer.
6. Menjaga agar orchestration tetap berada di Workflow Layer.
7. Menjaga agar reasoning tetap berada di Agent Layer.
8. Menjaga agar database access tetap berada di Repository Layer.
9. Menyediakan API yang mudah diuji dengan `pytest` dan `TestClient`.
10. Menyediakan titik masuk aplikasi FastAPI yang production-ready.

---

## 2. Posisi API dalam Architecture

Arsitektur resmi proyek UMKM Copilot AI adalah:

```text
Frontend (Streamlit)
        ↓
API Layer (FastAPI, optional)
        ↓
Agent Layer
        ↓
Workflow Layer
        ↓
Tool Layer
        ↓
Service Layer
        ↓
Repository Layer
        ↓
Supabase PostgreSQL
```

Untuk endpoint read-only analytics, API Layer tetap memanggil Agent, Workflow, atau Tool dependency yang sudah disediakan, bukan Repository langsung.

Arah dependency yang benar:

```text
API Layer → Agent Layer → Workflow Layer → Tool Layer → Service Layer → Repository Layer
API Layer → Workflow Layer → Tool Layer → Analytics Layer → Repository Layer
```

Arah dependency yang salah:

```text
API Layer → Repository Layer
API Layer → Supabase
API Layer → Database Connection
API Layer → Gemini Provider
API Layer → Prompt File
API Layer → Streamlit UI
```

Dependency wiring di `dependencies.py` boleh membuat object graph dari Repository sampai Agent karena file tersebut adalah composition root untuk HTTP runtime. Namun router endpoint tetap tidak boleh memanggil Repository, Service, Tool, atau LLM secara langsung.

---

## 3. Core Principle

Prinsip utama API Layer adalah:

```text
Receive HTTP request.
Validate request schema.
Call Agent or Workflow dependency.
Return structured HTTP response.
Do not own business logic.
```

API Layer hanya boleh:

1. Mendefinisikan FastAPI app.
2. Mendefinisikan router.
3. Mendefinisikan request schema.
4. Mendefinisikan response helper.
5. Menggunakan dependency injection FastAPI.
6. Memanggil Agent atau Workflow dependency.
7. Mengubah agent/workflow response menjadi HTTP response.
8. Menyediakan health check.
9. Menyediakan OpenAPI metadata.
10. Menyediakan test client coverage.

API Layer tidak boleh:

1. Menjalankan query database.
2. Mengakses Supabase client.
3. Mengakses Repository di router.
4. Mengandung business logic.
5. Menghitung KPI sendiri.
6. Membuat prompt.
7. Memanggil Gemini.
8. Memanggil provider LLM langsung.
9. Melakukan AI reasoning.
10. Mengandung UI Streamlit.

---

## 4. Dependency Rules

Router API hanya boleh bergantung pada:

1. FastAPI.
2. Pydantic schema.
3. Dependency provider dari `app/api/dependencies.py`.
4. Agent Layer.
5. Workflow Layer bila endpoint memang direct workflow.
6. Response helper API.
7. Logger project.

Router API tidak boleh bergantung pada:

1. Repository Layer.
2. Supabase client.
3. Database connection.
4. Gemini client.
5. Prompt loader.
6. Prompt builder.
7. Streamlit.
8. UI component.

`app/api/dependencies.py` adalah composition root. File tersebut boleh mengimpor Repository, Service, Analytics, Tool, Workflow, Memory, dan Agent untuk membuat dependency graph. Composition root tidak boleh menjalankan query atau business action saat import.

---

## 5. Dependency Injection Rules

Semua endpoint wajib memakai FastAPI `Depends`.

Endpoint tidak boleh membuat object service, repository, workflow, atau agent secara manual.

Benar:

```python
@router.post("/transactions/record")
def record_transaction(
    request: RecordTransactionRequest,
    agent: TransactionAgent = Depends(get_transaction_agent),
) -> dict[str, Any]:
    return build_http_response(agent.record_transaction(request.model_dump()))
```

Salah:

```python
@router.post("/transactions/record")
def record_transaction(request):
    repo = TransactionRepository()
    service = TransactionService(repo)
    return service.create_transaction(...)
```

Aturan dependency injection:

1. Dependency dibuat di `dependencies.py`.
2. Endpoint hanya menerima dependency melalui `Depends`.
3. Dependency dapat dioverride pada test.
4. Constructor tidak boleh menjalankan workflow.
5. Dependency provider tidak boleh melakukan request-time mutation kecuali melalui dependency yang dipanggil endpoint.
6. Test harus menggunakan `app.dependency_overrides`.

---

## 6. API Response Contract

API Layer mengembalikan response JSON.

Response sukses:

```json
{
  "success": true,
  "agent": "TransactionAgent",
  "intent": "record_transaction",
  "workflow": {},
  "data": {},
  "error": null
}
```

Response gagal:

```json
{
  "success": false,
  "agent": "TransactionAgent",
  "intent": "record_transaction",
  "workflow": null,
  "data": {},
  "error": {
    "type": "ValueError",
    "message": "business_id is required."
  }
}
```

Aturan status code:

1. Response sukses menggunakan HTTP 200.
2. Input validation Pydantic menggunakan HTTP 422.
3. Agent/workflow/tool failure menggunakan HTTP 400.
4. Health check sukses menggunakan HTTP 200.
5. Unexpected API exception menggunakan HTTP 500.

Response tidak boleh mengandung:

1. API key.
2. Credential.
3. Raw Supabase response.
4. Raw exception object.
5. Prompt lengkap yang mengandung data sensitif.
6. Stack trace.

---

## 7. API Files

API Layer Phase 9 terdiri dari:

```text
app/api/__init__.py
app/api/main.py
app/api/dependencies.py
app/api/response.py
app/api/schemas.py
app/api/routers/__init__.py
app/api/routers/health.py
app/api/routers/router.py
app/api/routers/business.py
app/api/routers/transactions.py
app/api/routers/marketing.py
app/api/routers/insights.py
app/api/routers/analytics.py
app/api/routers/exports.py
```

Test API Layer:

```text
tests/test_api_health.py
tests/test_api_router_agent.py
tests/test_api_business_router.py
tests/test_api_transactions_router.py
tests/test_api_marketing_router.py
tests/test_api_insights_router.py
tests/test_api_analytics_router.py
tests/test_api_exports_router.py
```

---

## 8. Endpoint Domains

Endpoint domain resmi:

```text
GET  /health
POST /api/v1/router/route

POST /api/v1/business/overview
POST /api/v1/business/health-check

POST /api/v1/transactions/record
POST /api/v1/transactions/record-payload
GET  /api/v1/transactions/summary/{business_id}

POST /api/v1/marketing/context
POST /api/v1/marketing/records
GET  /api/v1/marketing/history/{business_id}

POST /api/v1/insights/context
POST /api/v1/insights/records
GET  /api/v1/insights/review/{business_id}

GET  /api/v1/analytics/dashboard/{business_id}
GET  /api/v1/analytics/sales/{business_id}
GET  /api/v1/analytics/inventory/{business_id}
GET  /api/v1/analytics/products/{business_id}
GET  /api/v1/analytics/customers/{business_id}

POST /api/v1/exports/dashboard
POST /api/v1/exports/sales-summary
POST /api/v1/exports/inventory-summary
POST /api/v1/exports/structured
```

---

## 9. Router Responsibilities

Router bertanggung jawab untuk:

1. Mendefinisikan path operation.
2. Menerima request schema.
3. Menerima dependency.
4. Memanggil method agent/workflow.
5. Mengembalikan HTTP response.
6. Menggunakan response helper.

Router tidak boleh:

1. Mengakses Repository.
2. Mengakses Supabase.
3. Membuat service.
4. Membuat tool.
5. Membuat workflow.
6. Membuat agent.
7. Mengandung business logic.
8. Mengandung prompt logic.
9. Mengandung LLM call.
10. Mengandung UI logic.

---

## 10. Request Schema Rules

Request schema wajib menggunakan Pydantic `BaseModel`.

Aturan schema:

1. Gunakan nama request yang jelas.
2. Gunakan type hint eksplisit.
3. Gunakan `Field` untuk deskripsi penting.
4. Gunakan default hanya bila aman.
5. Hindari `Any` kecuali payload memang dinamis.
6. Gunakan `dict[str, Any]` untuk structured payload dinamis.
7. Gunakan `list[dict[str, Any]]` untuk structured export data.
8. Jangan menyimpan logic bisnis di schema.

---

## 11. Error Handling Rules

API Layer wajib:

1. Menggunakan response helper untuk agent/workflow failure.
2. Mengembalikan 400 jika dependency response `success=False`.
3. Mengembalikan 500 untuk exception tidak terduga di router.
4. Tidak menampilkan raw exception object.
5. Tidak menampilkan stack trace.
6. Tidak menampilkan credential.
7. Log exception dengan logger project.
8. Membiarkan Pydantic validation error menjadi 422.

---

## 12. Logging Rules

API Layer wajib menggunakan logger project.

Logger digunakan untuk:

1. Mencatat app startup bila diperlukan.
2. Mencatat router failure.
3. Mencatat dependency wiring failure bila terjadi.
4. Mencatat HTTP operation penting tanpa data sensitif.

Logger tidak boleh digunakan untuk:

1. Menampilkan API key.
2. Menampilkan credential.
3. Menampilkan raw prompt.
4. Menampilkan raw personal data berlebihan.
5. Menggantikan HTTP response.

---

## 13. Typing Rules

Seluruh file API Layer wajib:

1. Menggunakan `from __future__ import annotations`.
2. Menggunakan modern Python typing.
3. Memberikan type hint untuk semua endpoint.
4. Memberikan type hint untuk dependency provider.
5. Menggunakan `dict[str, Any]` untuk dynamic response.
6. Menggunakan `str | None`, bukan `Optional[str]`.
7. Menggunakan `Any` hanya bila payload dinamis.

---

## 14. Testing Convention

API Layer wajib diuji dengan `pytest` dan FastAPI `TestClient`.

Aturan test:

1. Test menggunakan `create_app()`.
2. Test menggunakan `app.dependency_overrides`.
3. Test tidak boleh mengakses database.
4. Test tidak boleh mengakses Repository.
5. Test tidak boleh memanggil LLM.
6. Test tidak boleh membutuhkan API key.
7. Test harus menguji response sukses.
8. Test harus menguji response gagal.
9. Test harus menguji status code.
10. Test harus deterministik.
11. Test harus membersihkan dependency overrides setelah test.

---

## 15. Things That Are Forbidden

Hal berikut dilarang di API Layer router:

1. Mengakses Repository.
2. Mengakses Supabase.
3. Membuat Repository.
4. Membuat Service.
5. Membuat Tool.
6. Membuat Workflow.
7. Membuat Agent.
8. Memanggil Gemini.
9. Memanggil provider LLM langsung.
10. Membuat prompt.
11. Membaca prompt file.
12. Melakukan business logic.
13. Melakukan analytics calculation.
14. Mengandung UI logic.
15. Menggunakan `print`.
16. Mengembalikan raw exception object.
17. Mengembalikan credential.
18. Mengembalikan raw Supabase response.
19. Mengubah arsitektur Repository.
20. Membuat dependency melingkar.

---

## Final Contract Statement

API Layer adalah HTTP interface opsional untuk UMKM Copilot AI.

Kontrak utama API Layer adalah:

```text
API boleh menerima HTTP request.
API boleh memvalidasi request schema.
API boleh memanggil Agent atau Workflow dependency.
API tidak boleh memanggil Repository langsung.
API tidak boleh mengakses database langsung.
API tidak boleh memanggil Gemini langsung.
API tidak boleh membuat prompt.
API tidak boleh mengandung business logic.
API wajib mengembalikan HTTP response terstruktur.
```

Kontrak ini berlaku untuk seluruh file API Layer dan seluruh test API Layer dalam proyek UMKM Copilot AI.
