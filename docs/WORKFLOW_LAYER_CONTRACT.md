# WORKFLOW LAYER CONTRACT

**Project:** UMKM Copilot AI  
**Layer:** Workflow Layer  
**Status:** Official Architecture Contract  
**Phase:** Phase 5  

---

## 1. Tujuan Workflow Layer

Workflow Layer adalah lapisan yang bertanggung jawab untuk mengatur alur eksekusi use case aplikasi.

Workflow Layer tidak menyimpan data secara langsung, tidak membaca database secara langsung, tidak memanggil Repository, tidak memanggil Supabase, dan tidak menjalankan business logic detail.

Workflow Layer bertugas menyusun urutan langkah antar-tool agar proses aplikasi berjalan konsisten, terstruktur, dan mudah diuji.

Tujuan utama Workflow Layer adalah:

1. Mengatur flow antar-tool.
2. Menentukan urutan operasi aplikasi.
3. Menghentikan flow ketika salah satu langkah gagal.
4. Menggabungkan output beberapa tool menjadi payload terstruktur.
5. Menyediakan contract flow yang dapat dipakai Agent Layer.
6. Menjaga Agent tetap fokus pada reasoning.
7. Menjaga Tool tetap menjadi adapter tipis.
8. Menjaga Service tetap fokus pada use case dan business validation.
9. Menjaga Repository tetap hanya mengakses database.
10. Menjaga seluruh workflow dapat diuji dengan pytest.

Workflow Layer tidak boleh melakukan CRUD database secara langsung.

---

## 2. Posisi Workflow dalam Architecture

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

Workflow Layer berada di atas Tool Layer.

Arah dependency yang benar:

```text
Workflow Layer → Tool Layer → Service Layer → Repository Layer
Workflow Layer → Tool Layer → Analytics Layer → Repository Layer
```

Arah dependency yang salah:

```text
Workflow Layer → Service Layer
Workflow Layer → Analytics Layer
Workflow Layer → Repository Layer
Workflow Layer → Supabase
Workflow Layer → Gemini
Workflow Layer → Streamlit
```

---

## 3. Core Principle

Prinsip utama Workflow Layer adalah:

```text
Orchestrate steps.
Call tools.
Stop safely on failure.
Return structured state.
Do not own business logic.
```

Workflow Layer hanya boleh:

1. Menentukan urutan pemanggilan tool.
2. Menyusun state antar-step.
3. Mengecek response tool sukses atau gagal.
4. Menggabungkan output tool.
5. Memberikan workflow result terstruktur.
6. Melakukan validasi ringan terhadap input workflow.
7. Menyediakan metadata flow.
8. Menyediakan status eksekusi workflow.

Workflow Layer tidak boleh:

1. Mengakses Repository.
2. Mengakses Supabase.
3. Memanggil Service langsung.
4. Memanggil Analytics langsung.
5. Melakukan business logic detail.
6. Menghitung KPI sendiri.
7. Membuat prompt.
8. Memanggil LLM.
9. Melakukan AI reasoning.
10. Menampilkan UI.

---

## 4. Dependency Rules

Workflow Layer hanya boleh bergantung pada:

1. Tool Layer.
2. Utility umum dari `app/utils/`.
3. Logger project.
4. Python standard library.
5. Type internal bila diperlukan.

Workflow Layer tidak boleh bergantung pada:

1. Repository Layer.
2. Service Layer.
3. Analytics Layer.
4. Database connection.
5. Supabase client.
6. LLM Layer.
7. Gemini client.
8. Prompt Loader.
9. Prompt Builder.
10. Agent Layer.
11. Streamlit.
12. FastAPI object.

---

## 5. Dependency Injection Rules

Seluruh dependency Workflow Layer wajib diberikan melalui constructor.

Workflow tidak boleh membuat instance tool di dalam method.

Benar:

```python
class TransactionWorkflow:
    def __init__(
        self,
        transaction_tools: TransactionTools,
        analytics_tools: AnalyticsTools,
    ) -> None:
        self._transaction_tools = transaction_tools
        self._analytics_tools = analytics_tools
```

Salah:

```python
class TransactionWorkflow:
    def run(self, data: dict[str, Any]) -> dict[str, Any]:
        transaction_tools = TransactionTools(...)
        return transaction_tools.create_transaction(...)
```

Aturan dependency injection:

1. Tool diberikan melalui constructor.
2. Workflow tidak membuat Tool sendiri.
3. Workflow tidak membuat Service sendiri.
4. Workflow tidak membuat Repository sendiri.
5. Workflow tidak membuat Analytics sendiri.
6. Dependency disimpan sebagai protected attribute dengan awalan `_`.
7. Constructor tidak boleh menjalankan flow.
8. Constructor tidak boleh membaca database.

---

## 6. Workflow Response Contract

Semua method Workflow Layer wajib mengembalikan dictionary terstruktur.

Format response sukses:

```python
{
    "success": True,
    "workflow": "workflow_method_name",
    "steps": [
        {
            "name": "step_name",
            "success": True,
            "tool": "tool_method_name",
        }
    ],
    "data": {},
    "error": None,
}
```

Format response gagal:

```python
{
    "success": False,
    "workflow": "workflow_method_name",
    "steps": [
        {
            "name": "step_name",
            "success": False,
            "tool": "tool_method_name",
        }
    ],
    "data": {},
    "error": {
        "type": "WorkflowStepError",
        "message": "Step create_transaction failed.",
        "step": "create_transaction",
    },
}
```

Aturan response:

1. Selalu ada key `success`.
2. Selalu ada key `workflow`.
3. Selalu ada key `steps`.
4. Selalu ada key `data`.
5. Selalu ada key `error`.
6. Workflow harus berhenti jika required step gagal.
7. Workflow boleh melanjutkan optional step bila optional step gagal, tetapi error harus dicatat sebagai warning di data.
8. Error tidak boleh menampilkan credential.
9. Error tidak boleh menampilkan raw Supabase response.
10. Data harus terstruktur.

---

## 7. Workflow Classes

Workflow Layer Phase 5 terdiri dari:

```text
BusinessWorkflow
TransactionWorkflow
MarketingWorkflow
InsightWorkflow
ExportWorkflow
```

Lokasi file:

```text
app/workflows/business_workflow.py
app/workflows/transaction_workflow.py
app/workflows/marketing_workflow.py
app/workflows/insight_workflow.py
app/workflows/export_workflow.py
```

Lokasi test:

```text
tests/test_business_workflow.py
tests/test_transaction_workflow.py
tests/test_marketing_workflow.py
tests/test_insight_workflow.py
tests/test_export_workflow.py
```

---

## 8. BusinessWorkflow Responsibilities

BusinessWorkflow mengatur alur yang berkaitan dengan ringkasan kondisi bisnis.

Boleh melakukan:

1. Build dashboard overview.
2. Build business health check.
3. Mengambil analytics summary melalui AnalyticsTools.
4. Mengambil insight context melalui InsightTools.
5. Menyimpan conversation log melalui ConversationTools bila diperlukan.
6. Menggabungkan output tool menjadi business workflow state.

Tidak boleh:

1. Mengakses BusinessRepository.
2. Mengakses ProductRepository.
3. Mengakses database.
4. Menghitung KPI sendiri.
5. Menghasilkan AI reasoning.
6. Membuat prompt.

---

## 9. TransactionWorkflow Responsibilities

TransactionWorkflow mengatur alur transaksi.

Boleh melakukan:

1. Record transaction.
2. Membaca hasil transaksi.
3. Refresh sales summary setelah transaksi.
4. Refresh inventory summary setelah transaksi.
5. Menyimpan conversation log bila diperlukan.
6. Mengembalikan workflow state transaksi.

Tidak boleh:

1. Membuat transaksi langsung tanpa TransactionTools.
2. Mengakses TransactionRepository.
3. Mengubah stok langsung.
4. Menghitung revenue sendiri.
5. Memanggil LLM.

---

## 10. MarketingWorkflow Responsibilities

MarketingWorkflow mengatur alur marketing berbasis data.

Boleh melakukan:

1. Build product marketing context.
2. Simpan marketing record.
3. List marketing history.
4. Refresh product summary atau dashboard melalui AnalyticsTools.
5. Simpan conversation log bila diperlukan.

Tidak boleh:

1. Menghasilkan copywriting final.
2. Membuat prompt.
3. Memanggil Gemini.
4. Mengakses MarketingRepository.
5. Melakukan AI reasoning.

---

## 11. InsightWorkflow Responsibilities

InsightWorkflow mengatur alur insight berbasis data terstruktur.

Boleh melakukan:

1. Build business insight context.
2. Read recent insights.
3. Create insight record.
4. Refresh analytics summary.
5. Menyimpan conversation log bila diperlukan.

Tidak boleh:

1. Menghasilkan narasi AI final.
2. Memanggil LLM.
3. Membuat prompt.
4. Mengakses repository.
5. Menghitung dashboard sendiri.

---

## 12. ExportWorkflow Responsibilities

ExportWorkflow mengatur alur ekspor data.

Boleh melakukan:

1. Export dashboard.
2. Export sales summary.
3. Export inventory summary.
4. Export structured data.
5. Menyusun metadata export.
6. Menyimpan conversation log bila diperlukan.

Tidak boleh:

1. Menulis file fisik tanpa instruksi eksplisit layer aplikasi.
2. Mengakses Repository.
3. Mengakses database.
4. Mengakses Streamlit download component.
5. Memanggil LLM.

---

## 13. Validation Rules

Workflow Layer hanya melakukan validasi ringan.

Contoh validasi:

1. `business_id` tidak boleh kosong.
2. Payload workflow harus berupa mapping.
3. Required field workflow harus tersedia.
4. `limit` harus integer positif.
5. `export_format` harus diserahkan ke ExportTools untuk validasi detail.
6. Optional logging parameter boleh kosong.

Business rule tetap berada di Service Layer.

Analytics calculation tetap berada di Analytics Layer.

---

## 14. Exception Handling Rules

Workflow Layer wajib menangkap exception internal workflow dan mengubahnya menjadi response gagal.

Aturan:

1. Workflow harus mengecek `success` dari setiap response tool.
2. Required step gagal harus menghentikan workflow.
3. Optional step gagal tidak harus menghentikan workflow.
4. Optional step gagal harus dicatat dalam `data.warnings`.
5. Workflow tidak boleh membocorkan raw exception object.
6. Workflow tidak boleh membocorkan credential.
7. Workflow harus log error dengan logger project.
8. Workflow result harus tetap terstruktur.

---

## 15. Logging Rules

Workflow Layer wajib menggunakan logger project.

Logger digunakan untuk:

1. Mencatat workflow dimulai.
2. Mencatat workflow selesai.
3. Mencatat required step gagal.
4. Mencatat optional step gagal.
5. Mencatat nama workflow dan step.

Logger tidak boleh digunakan untuk:

1. Menampilkan credential.
2. Menampilkan API key.
3. Menampilkan prompt mentah.
4. Menampilkan data pribadi pelanggan secara berlebihan.
5. Menggantikan structured response.

---

## 16. Typing Rules

Seluruh file Workflow Layer wajib:

1. Menggunakan `from __future__ import annotations`.
2. Menggunakan modern Python typing.
3. Memberikan type hint untuk seluruh argument.
4. Memberikan type hint untuk seluruh return value.
5. Menggunakan `dict[str, Any]` untuk workflow response.
6. Menggunakan `list[dict[str, Any]]` untuk steps.
7. Menggunakan `str | None`, bukan `Optional[str]`.
8. Menggunakan `Any` hanya untuk payload dinamis.

---

## 17. Naming Convention

Nama class wajib:

```text
BusinessWorkflow
TransactionWorkflow
MarketingWorkflow
InsightWorkflow
ExportWorkflow
```

Nama file wajib:

```text
business_workflow.py
transaction_workflow.py
marketing_workflow.py
insight_workflow.py
export_workflow.py
```

Nama test wajib:

```text
test_business_workflow.py
test_transaction_workflow.py
test_marketing_workflow.py
test_insight_workflow.py
test_export_workflow.py
```

---

## 18. Method Naming Convention

Nama method harus menggambarkan alur.

Pola method:

```text
run_<workflow_name>
build_<workflow_payload>
execute_<workflow_name>
```

Contoh:

```text
run_business_overview
run_business_health_check
run_record_transaction
run_transaction_summary_refresh
run_create_marketing_record
run_generate_marketing_context
run_create_insight
run_insight_context
run_export_dashboard
run_export_sales_summary
```

Method Workflow tidak boleh bernama seperti operasi database:

```text
insert_transaction
update_table
delete_row
select_products
```

---

## 19. Testing Convention

Workflow Layer wajib diuji dengan `pytest`.

Aturan test:

1. Test menggunakan fake tools.
2. Test tidak boleh mengakses Repository.
3. Test tidak boleh mengakses Supabase.
4. Test tidak boleh memanggil LLM.
5. Test tidak boleh menguji UI.
6. Test harus menguji workflow sukses.
7. Test harus menguji required step gagal.
8. Test harus menguji optional step gagal bila workflow memiliki optional step.
9. Test harus memverifikasi `steps`.
10. Test harus memverifikasi `success`.
11. Test harus memverifikasi `data`.
12. Test harus deterministik.

---

## 20. Things That Are Forbidden

Hal berikut dilarang di Workflow Layer:

1. Mengakses Repository.
2. Mengakses Supabase.
3. Membuat Repository.
4. Membuat Service.
5. Membuat Analytics.
6. Membuat Tool di dalam method.
7. Melakukan CRUD langsung.
8. Menghitung KPI kompleks sendiri.
9. Membuat prompt.
10. Membaca prompt file.
11. Memanggil Gemini.
12. Memanggil LLM.
13. Melakukan AI reasoning.
14. Mengakses Streamlit.
15. Mengakses FastAPI object.
16. Menggunakan `print`.
17. Mengembalikan raw exception object.
18. Mengembalikan raw Supabase response.
19. Mengubah arsitektur Repository.
20. Mengubah arsitektur Service.
21. Mengubah arsitektur Tool.
22. Membuat dependency melingkar.
23. Menempatkan business logic detail di Workflow.
24. Menempatkan UI logic di Workflow.
25. Menempatkan prompt logic di Workflow.

---

## Final Contract Statement

Workflow Layer adalah lapisan orkestrasi flow aplikasi.

Kontrak utama Workflow Layer adalah:

```text
Workflow boleh memanggil Tool.
Workflow tidak boleh memanggil Repository.
Workflow tidak boleh memanggil Service langsung.
Workflow tidak boleh memanggil Analytics langsung.
Workflow tidak boleh mengakses database langsung.
Workflow tidak boleh memanggil LLM.
Workflow tidak boleh membuat prompt.
Workflow tidak boleh menjalankan AI reasoning.
Workflow wajib mengembalikan workflow response terstruktur.
```

Kontrak ini berlaku untuk seluruh file Workflow Layer dan seluruh test Workflow Layer dalam proyek UMKM Copilot AI.
