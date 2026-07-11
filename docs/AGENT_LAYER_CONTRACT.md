# AGENT LAYER CONTRACT

**Project:** UMKM Copilot AI  
**Layer:** Agent Layer  
**Status:** Official Architecture Contract  
**Phase:** Phase 7  

---

## 1. Tujuan Agent Layer

Agent Layer adalah lapisan yang bertanggung jawab untuk reasoning aplikasi berbasis intent, pemilihan alur kerja, dan pengambilan keputusan tingkat tinggi sebelum sebuah workflow dijalankan.

Agent Layer tidak boleh mengakses database secara langsung, tidak boleh memanggil Repository, tidak boleh memanggil Supabase, dan tidak boleh menjalankan operasi CRUD sendiri.

Agent Layer bertugas memahami maksud pengguna, memilih workflow yang tepat, menyusun payload eksekusi, lalu memanggil Workflow Layer.

Tujuan utama Agent Layer adalah:

1. Melakukan intent reasoning.
2. Memilih workflow yang sesuai.
3. Menyiapkan payload workflow.
4. Menggunakan Memory Layer untuk context bila tersedia.
5. Menggunakan Workflow Layer untuk menjalankan aksi.
6. Menjaga agar Agent tidak mengakses database.
7. Menjaga agar Tool tetap menjadi adapter.
8. Menjaga agar Service tetap menangani business rule.
9. Menjaga agar LLM Layer hanya bertanggung jawab pada prompt dan output AI.
10. Menyediakan response agent yang terstruktur dan mudah diuji.

Pada Phase 7, Agent Layer dapat menggunakan deterministic reasoning berbasis rule dan structured input. Integrasi LLM secara penuh masuk ke Phase 8 melalui LLM Layer.

---

## 2. Posisi Agent dalam Architecture

Arsitektur resmi proyek UMKM Copilot AI adalah:

```text
Frontend (Streamlit)
        ↓
API Layer (FastAPI, optional)
        ↓
LangGraph Workflow
        ↓
Tool Layer
        ↓
Service Layer
        ↓
Repository Layer
        ↓
Supabase PostgreSQL
```

Agent Layer berada di atas Workflow Layer dan dapat menggunakan Memory Layer sebagai context provider.

Arah dependency yang benar:

```text
Agent Layer → Workflow Layer → Tool Layer → Service Layer → Repository Layer
Agent Layer → Memory Layer → Service Layer → Repository Layer
Agent Layer → Memory Layer → Tool Layer → Analytics Layer → Repository Layer
```

Arah dependency yang salah:

```text
Agent Layer → Repository Layer
Agent Layer → Supabase
Agent Layer → Service Layer
Agent Layer → Tool Layer
Agent Layer → Analytics Layer
Agent Layer → Streamlit
Agent Layer → FastAPI Request
```

Agent Layer boleh memanggil LLM Layer setelah Phase 8 tersedia, tetapi tidak boleh memanggil provider LLM secara langsung.

---

## 3. Core Principle

Prinsip utama Agent Layer adalah:

```text
Understand intent.
Select workflow.
Prepare workflow input.
Call workflow.
Return structured agent response.
Never access database directly.
```

Agent Layer hanya boleh:

1. Melakukan reasoning intent.
2. Melakukan routing agent.
3. Memanggil Workflow Layer.
4. Memanggil Memory Layer.
5. Menyusun payload workflow.
6. Menangani workflow response.
7. Mengembalikan response agent terstruktur.
8. Menyimpan conversation melalui Memory Layer bila tersedia.
9. Membuat fallback response non-LLM.
10. Menggunakan LLM Layer setelah Phase 8 tersedia.

Agent Layer tidak boleh:

1. Mengakses Repository.
2. Mengakses Supabase.
3. Mengakses database connection.
4. Memanggil Service langsung.
5. Memanggil Tool langsung.
6. Memanggil Analytics langsung.
7. Membuat prompt final di luar LLM Layer.
8. Memanggil Gemini langsung.
9. Melakukan CRUD langsung.
10. Mengandung UI logic.

---

## 4. Dependency Rules

Agent Layer hanya boleh bergantung pada:

1. Workflow Layer.
2. Memory Layer.
3. LLM Layer setelah Phase 8 tersedia.
4. Utility umum dari `app/utils/`.
5. Logger project.
6. Python standard library.
7. Type internal bila diperlukan.

Agent Layer tidak boleh bergantung pada:

1. Repository Layer.
2. Service Layer.
3. Tool Layer.
4. Analytics Layer.
5. Supabase client.
6. Database connection.
7. Streamlit.
8. FastAPI object.
9. Prompt file langsung.
10. Provider LLM langsung.

---

## 5. Dependency Injection Rules

Seluruh dependency Agent Layer wajib diberikan melalui constructor.

Agent tidak boleh membuat instance Workflow, Memory, Service, Tool, Repository, atau LLM client di dalam method.

Benar:

```python
class TransactionAgent:
    def __init__(
        self,
        transaction_workflow: TransactionWorkflow,
        conversation_memory: ConversationMemory | None = None,
    ) -> None:
        self._transaction_workflow = transaction_workflow
        self._conversation_memory = conversation_memory
```

Salah:

```python
class TransactionAgent:
    def handle(self, payload: dict[str, Any]) -> dict[str, Any]:
        workflow = TransactionWorkflow(...)
        return workflow.run_record_transaction(...)
```

Aturan dependency injection:

1. Workflow diberikan melalui constructor.
2. Memory diberikan melalui constructor bila diperlukan.
3. LLM dependency diberikan melalui constructor setelah Phase 8.
4. Agent tidak membuat dependency sendiri.
5. Dependency disimpan sebagai protected attribute dengan awalan `_`.
6. Constructor tidak boleh menjalankan workflow.
7. Constructor tidak boleh membaca database.
8. Constructor tidak boleh memanggil LLM.
9. Dependency yang tidak dipakai tidak boleh disuntikkan.

---

## 6. Agent Response Contract

Semua method Agent Layer wajib mengembalikan dictionary terstruktur.

Format response sukses:

```python
{
    "success": True,
    "agent": "agent_name",
    "intent": "intent_name",
    "workflow": {},
    "data": {},
    "error": None,
}
```

Format response gagal:

```python
{
    "success": False,
    "agent": "agent_name",
    "intent": "intent_name",
    "workflow": None,
    "data": {},
    "error": {
        "type": "ValueError",
        "message": "business_id is required.",
    },
}
```

Aturan response:

1. Selalu ada key `success`.
2. Selalu ada key `agent`.
3. Selalu ada key `intent`.
4. Selalu ada key `workflow`.
5. Selalu ada key `data`.
6. Selalu ada key `error`.
7. Error tidak boleh menampilkan credential.
8. Error tidak boleh menampilkan raw Supabase response.
9. Workflow response disimpan pada key `workflow`.
10. Data berisi ringkasan response yang mudah dipakai layer atas.

---

## 7. Agent Classes

Agent Layer Phase 7 terdiri dari:

```text
RouterAgent
TransactionAgent
MarketingAgent
InsightAgent
ExportAgent
```

Lokasi file:

```text
app/agents/router_agent.py
app/agents/transaction_agent.py
app/agents/marketing_agent.py
app/agents/insight_agent.py
app/agents/export_agent.py
```

Lokasi test:

```text
tests/test_router_agent.py
tests/test_transaction_agent.py
tests/test_marketing_agent.py
tests/test_insight_agent.py
tests/test_export_agent.py
```

---

## 8. RouterAgent Responsibilities

RouterAgent bertanggung jawab untuk memilih agent atau workflow domain berdasarkan intent pengguna.

RouterAgent boleh:

1. Menganalisis user input secara deterministic.
2. Menerima explicit intent.
3. Memilih route transaction, marketing, insight, export, atau business.
4. Memanggil domain agent yang sesuai.
5. Mengembalikan route metadata.
6. Menyimpan user message melalui ConversationMemory bila tersedia.
7. Menyediakan fallback route.

RouterAgent tidak boleh:

1. Mengakses Repository.
2. Mengakses Service.
3. Mengakses Tool.
4. Memanggil LLM langsung.
5. Membuat prompt final.
6. Menjalankan CRUD sendiri.

---

## 9. TransactionAgent Responsibilities

TransactionAgent bertanggung jawab untuk reasoning domain transaksi.

TransactionAgent boleh:

1. Memvalidasi payload transaksi secara ringan.
2. Memilih workflow transaksi.
3. Memanggil TransactionWorkflow.
4. Meminta refresh summary transaksi.
5. Menggunakan ConversationMemory bila tersedia.
6. Mengembalikan response transaksi terstruktur.

TransactionAgent tidak boleh:

1. Mengakses TransactionRepository.
2. Mengakses ProductRepository.
3. Mengubah stok langsung.
4. Menghitung revenue sendiri.
5. Memanggil TransactionService langsung.

---

## 10. MarketingAgent Responsibilities

MarketingAgent bertanggung jawab untuk reasoning domain marketing.

MarketingAgent boleh:

1. Memilih workflow marketing context.
2. Memilih workflow create marketing record.
3. Memilih workflow marketing history review.
4. Menggunakan ConversationMemory bila tersedia.
5. Mengembalikan response marketing terstruktur.

MarketingAgent tidak boleh:

1. Membuat copywriting final dengan LLM langsung.
2. Membuat prompt final.
3. Mengakses MarketingRepository.
4. Memanggil MarketingService langsung.
5. Memanggil Gemini langsung.

---

## 11. InsightAgent Responsibilities

InsightAgent bertanggung jawab untuk reasoning domain insight.

InsightAgent boleh:

1. Memilih workflow insight context.
2. Memilih workflow create insight.
3. Memilih workflow insight review.
4. Menggunakan ConversationMemory bila tersedia.
5. Mengembalikan response insight terstruktur.

InsightAgent tidak boleh:

1. Menghasilkan narasi AI final langsung.
2. Membuat prompt final.
3. Mengakses InsightsRepository.
4. Memanggil InsightService langsung.
5. Menghitung dashboard sendiri.

---

## 12. ExportAgent Responsibilities

ExportAgent bertanggung jawab untuk reasoning domain export.

ExportAgent boleh:

1. Memilih workflow export dashboard.
2. Memilih workflow export sales summary.
3. Memilih workflow export inventory summary.
4. Memilih workflow export structured data.
5. Menggunakan ConversationMemory bila tersedia.
6. Mengembalikan response export terstruktur.

ExportAgent tidak boleh:

1. Menulis file fisik langsung.
2. Mengakses Repository.
3. Mengakses database.
4. Mengakses Streamlit download component.
5. Memanggil LLM.

---

## 13. Validation Rules

Agent Layer melakukan validasi ringan.

Contoh validasi:

1. `business_id` tidak boleh kosong bila diperlukan.
2. `user_input` tidak boleh kosong.
3. `intent` tidak boleh kosong bila explicit intent digunakan.
4. Payload agent harus mapping.
5. Required payload field harus tersedia sebelum workflow dipanggil.
6. `session_id` boleh kosong bila memory tidak digunakan.
7. `limit` harus integer positif bila digunakan.

Business rule tetap berada di Service Layer.

Flow orchestration tetap berada di Workflow Layer.

Tool response handling tetap berada di Tool Layer.

---

## 14. Exception Handling Rules

Agent Layer wajib menangkap exception dan mengubahnya menjadi response gagal terstruktur.

Aturan:

1. Jangan membiarkan exception bocor tanpa struktur.
2. Jangan mengembalikan raw exception object.
3. Jangan menampilkan credential.
4. Jangan menampilkan raw Supabase response.
5. Jangan menelan exception tanpa konteks.
6. Log error penting dengan logger project.
7. Jika workflow gagal, agent response juga gagal kecuali intent tersebut memang optional.
8. Response harus tetap sesuai Agent Response Contract.

---

## 15. Logging Rules

Agent Layer wajib menggunakan logger project.

Logger digunakan untuk:

1. Mencatat agent execution.
2. Mencatat intent yang dipilih.
3. Mencatat workflow yang dipanggil.
4. Mencatat workflow gagal.
5. Mencatat fallback intent.

Logger tidak boleh digunakan untuk:

1. Menampilkan credential.
2. Menampilkan API key.
3. Menampilkan raw prompt.
4. Menampilkan data pribadi pelanggan secara berlebihan.
5. Menggantikan structured response.

---

## 16. Typing Rules

Seluruh file Agent Layer wajib:

1. Menggunakan `from __future__ import annotations`.
2. Menggunakan modern Python typing.
3. Memberikan type hint untuk semua argument.
4. Memberikan type hint untuk semua return value.
5. Menggunakan `dict[str, Any]` untuk agent response.
6. Menggunakan `Mapping[str, Any]` untuk payload input.
7. Menggunakan `str | None`, bukan `Optional[str]`.
8. Menggunakan `Any` hanya untuk payload dinamis.

---

## 17. Naming Convention

Nama class wajib:

```text
RouterAgent
TransactionAgent
MarketingAgent
InsightAgent
ExportAgent
```

Nama file wajib:

```text
router_agent.py
transaction_agent.py
marketing_agent.py
insight_agent.py
export_agent.py
```

Nama test wajib:

```text
test_router_agent.py
test_transaction_agent.py
test_marketing_agent.py
test_insight_agent.py
test_export_agent.py
```

---

## 18. Method Naming Convention

Pola method Agent Layer:

```text
handle_<domain>
route
classify_intent
execute_<intent>
```

Contoh:

```text
route
classify_intent
handle_transaction
record_transaction
refresh_transaction_summary
handle_marketing
build_marketing_context
create_marketing_record
handle_insight
build_insight_context
create_insight
handle_export
export_dashboard
```

Method Agent tidak boleh bernama seperti operasi database:

```text
insert_transaction
update_table
delete_row
select_products
```

---

## 19. Testing Convention

Agent Layer wajib diuji dengan `pytest`.

Aturan test:

1. Test menggunakan fake workflow.
2. Test menggunakan fake memory bila diperlukan.
3. Test tidak boleh mengakses Repository.
4. Test tidak boleh mengakses Supabase.
5. Test tidak boleh memanggil LLM.
6. Test tidak boleh menguji UI.
7. Test harus menguji intent routing.
8. Test harus menguji workflow sukses.
9. Test harus menguji workflow gagal.
10. Test harus menguji validasi input invalid.
11. Test harus memverifikasi Agent Response Contract.
12. Test harus deterministik.

---

## 20. Things That Are Forbidden

Hal berikut dilarang di Agent Layer:

1. Mengakses Repository.
2. Mengakses Supabase.
3. Membuat Repository.
4. Membuat Service.
5. Membuat Tool.
6. Membuat Workflow di dalam method.
7. Membuat Memory di dalam method.
8. Memanggil Service langsung.
9. Memanggil Tool langsung.
10. Memanggil Analytics langsung.
11. Melakukan CRUD langsung.
12. Menghitung KPI kompleks sendiri.
13. Membuat prompt final.
14. Membaca prompt file langsung.
15. Memanggil Gemini langsung.
16. Memanggil LLM provider langsung.
17. Mengakses Streamlit.
18. Mengakses FastAPI object.
19. Menggunakan `print`.
20. Mengembalikan raw exception object.
21. Mengembalikan raw Supabase response.
22. Menyimpan credential.
23. Menampilkan credential di log.
24. Menempatkan business logic detail di Agent.
25. Menempatkan UI logic di Agent.
26. Mengubah arsitektur Repository.
27. Mengubah arsitektur Service.
28. Mengubah arsitektur Tool.
29. Mengubah arsitektur Workflow.
30. Membuat dependency melingkar.

---

## Final Contract Statement

Agent Layer adalah lapisan reasoning dan routing tingkat tinggi.

Kontrak utama Agent Layer adalah:

```text
Agent boleh memanggil Workflow.
Agent boleh memanggil Memory.
Agent boleh memanggil LLM Layer setelah Phase 8.
Agent tidak boleh memanggil Repository.
Agent tidak boleh memanggil Service langsung.
Agent tidak boleh memanggil Tool langsung.
Agent tidak boleh mengakses database langsung.
Agent tidak boleh memanggil provider LLM langsung.
Agent tidak boleh membuat prompt final.
Agent wajib mengembalikan response agent terstruktur.
```

Kontrak ini berlaku untuk seluruh file Agent Layer dan seluruh test Agent Layer dalam proyek UMKM Copilot AI.
