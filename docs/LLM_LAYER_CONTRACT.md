# LLM LAYER CONTRACT

**Project:** UMKM Copilot AI  
**Layer:** LLM Layer  
**Status:** Official Architecture Contract  
**Phase:** Phase 8  

---

## 1. Tujuan LLM Layer

LLM Layer adalah lapisan yang bertanggung jawab untuk interaksi dengan model bahasa, pengelolaan prompt template, pembangunan prompt final, dan formatting output model.

LLM Layer menjadi satu-satunya tempat yang boleh berhubungan dengan provider LLM seperti Gemini.

Tujuan utama LLM Layer adalah:

1. Mengisolasi integrasi Gemini dari layer lain.
2. Menyediakan client LLM yang testable.
3. Menyediakan prompt loader yang konsisten.
4. Menyediakan prompt builder yang aman dan eksplisit.
5. Menyediakan response formatter untuk hasil LLM.
6. Menjaga agar Agent tidak memanggil provider LLM langsung.
7. Menjaga agar Workflow tidak membuat prompt.
8. Menjaga agar Tool tidak membuat prompt.
9. Menjaga agar Service tetap bebas dari AI logic.
10. Menjaga agar Repository tetap hanya mengakses database.

LLM Layer tidak boleh mengakses database, tidak boleh memanggil Repository, tidak boleh melakukan CRUD, tidak boleh mengatur LangGraph flow, dan tidak boleh mengandung UI logic.

---

## 2. Posisi LLM dalam Architecture

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

LLM Layer digunakan oleh Agent Layer untuk menghasilkan, menafsirkan, atau memformat output AI.

Arah dependency yang benar:

```text
Agent Layer → LLM Layer
LLM Layer → Gemini Provider
LLM Layer → Prompt Files
```

Arah dependency yang salah:

```text
LLM Layer → Repository Layer
LLM Layer → Service Layer
LLM Layer → Tool Layer
LLM Layer → Workflow Layer
LLM Layer → Supabase
LLM Layer → Streamlit
LLM Layer → FastAPI Request
```

---

## 3. Core Principle

Prinsip utama LLM Layer adalah:

```text
Load prompt.
Build prompt.
Call LLM.
Format response.
Never access database.
Never orchestrate workflow.
```

LLM Layer hanya boleh:

1. Membaca prompt template.
2. Membangun prompt final dari template dan context.
3. Memanggil Gemini melalui GeminiClient.
4. Memformat response LLM.
5. Mengekstrak JSON dari output LLM.
6. Menormalisasi text output.
7. Menangani error provider LLM.
8. Menyediakan response terstruktur.
9. Mendukung dependency injection untuk testing.
10. Menggunakan logger project.

LLM Layer tidak boleh:

1. Mengakses Repository.
2. Mengakses Supabase.
3. Menjalankan query database.
4. Memanggil Service.
5. Memanggil Tool.
6. Memanggil Workflow.
7. Mengatur LangGraph node atau edge.
8. Melakukan CRUD.
9. Mengandung UI logic.
10. Membaca user input dari Streamlit secara langsung.

---

## 4. Dependency Rules

LLM Layer hanya boleh bergantung pada:

1. Python standard library.
2. Gemini SDK atau injected transport/model.
3. Prompt file di folder `prompts/`.
4. Utility umum dari `app/utils/`.
5. Logger project.
6. Type internal bila diperlukan.

LLM Layer tidak boleh bergantung pada:

1. Repository Layer.
2. Service Layer.
3. Analytics Layer.
4. Tool Layer.
5. Workflow Layer.
6. Memory Layer.
7. Agent Layer.
8. Supabase client.
9. Database connection.
10. Streamlit.
11. FastAPI object.
12. UI component.

---

## 5. Dependency Injection Rules

Seluruh dependency eksternal pada LLM Layer wajib dapat di-inject.

GeminiClient harus mendukung injected model atau transport agar dapat diuji tanpa memanggil jaringan.

Benar:

```python
client = GeminiClient(model=fake_model)
```

Salah:

```python
class MarketingAgent:
    def handle(self, payload):
        model = genai.GenerativeModel("gemini-pro")
        return model.generate_content(...)
```

Aturan dependency injection:

1. Gemini model boleh diberikan melalui constructor.
2. API key boleh diberikan melalui constructor atau environment variable.
3. Prompt directory boleh diberikan melalui constructor.
4. Constructor tidak boleh memanggil model.
5. Constructor tidak boleh membaca semua prompt secara otomatis tanpa kebutuhan.
6. Test harus dapat berjalan tanpa koneksi internet.
7. Test harus dapat berjalan tanpa API key asli.
8. LLM Layer tidak boleh membuat dependency ke Repository, Service, Tool, atau Workflow.

---

## 6. LLM Classes

LLM Layer Phase 8 terdiri dari:

```text
GeminiClient
PromptLoader
PromptBuilder
ResponseFormatter
```

Lokasi file:

```text
app/llm/gemini_client.py
app/llm/prompt_loader.py
app/llm/prompt_builder.py
app/llm/response_formatter.py
```

Lokasi test:

```text
tests/test_gemini_client.py
tests/test_prompt_loader.py
tests/test_prompt_builder.py
tests/test_response_formatter.py
```

---

## 7. GeminiClient Responsibilities

GeminiClient bertanggung jawab untuk komunikasi dengan Gemini provider.

GeminiClient boleh:

1. Menerima API key.
2. Menerima nama model.
3. Menerima injected fake model untuk test.
4. Memanggil generate content.
5. Mengatur generation config.
6. Mengatur safety settings bila tersedia.
7. Mengembalikan response terstruktur.
8. Menangani error provider.
9. Menormalisasi text output.

GeminiClient tidak boleh:

1. Mengakses database.
2. Mengakses Repository.
3. Membaca prompt file.
4. Membuat prompt dari context.
5. Mengatur workflow.
6. Memanggil Tool.
7. Memanggil Service.
8. Mengandung UI logic.

---

## 8. PromptLoader Responsibilities

PromptLoader bertanggung jawab membaca prompt template dari folder `prompts/`.

PromptLoader boleh:

1. Membaca file prompt `.md`, `.txt`, atau `.j2`.
2. Memvalidasi nama template.
3. Mengembalikan isi template sebagai string.
4. Menyediakan daftar template tersedia.
5. Menangani file tidak ditemukan.

PromptLoader tidak boleh:

1. Memanggil LLM.
2. Mengakses database.
3. Mengakses Repository.
4. Mengubah prompt file.
5. Mengandung business logic.
6. Mengandung UI logic.

---

## 9. PromptBuilder Responsibilities

PromptBuilder bertanggung jawab membangun prompt final dari template dan context.

PromptBuilder boleh:

1. Menerima template string.
2. Menerima variables dictionary.
3. Mengisi placeholder `{variable}` secara eksplisit.
4. Menggabungkan system instruction, context, dan user input.
5. Menormalisasi whitespace.
6. Memvalidasi missing variables.
7. Menyusun prompt payload untuk GeminiClient.

PromptBuilder tidak boleh:

1. Membaca file prompt langsung.
2. Memanggil LLM.
3. Mengakses database.
4. Memanggil Service.
5. Memanggil Tool.
6. Mengandung provider-specific call.
7. Menjalankan workflow.

---

## 10. ResponseFormatter Responsibilities

ResponseFormatter bertanggung jawab menormalisasi dan memformat response LLM.

ResponseFormatter boleh:

1. Membersihkan text response.
2. Mengekstrak JSON object dari text.
3. Mengekstrak JSON array dari text.
4. Membuat response sukses standar.
5. Membuat response gagal standar.
6. Mengubah output menjadi markdown aman.
7. Menyediakan fallback text bila response kosong.

ResponseFormatter tidak boleh:

1. Memanggil LLM.
2. Mengakses database.
3. Mengakses Repository.
4. Memanggil Service.
5. Memanggil Tool.
6. Mengatur workflow.
7. Mengandung UI rendering.

---

## 11. Response Contract

GeminiClient wajib mengembalikan response dictionary:

```python
{
    "success": True,
    "provider": "gemini",
    "model": "gemini-model-name",
    "text": "model output",
    "raw": {},
    "error": None,
}
```

Response gagal:

```python
{
    "success": False,
    "provider": "gemini",
    "model": "gemini-model-name",
    "text": "",
    "raw": None,
    "error": {
        "type": "RuntimeError",
        "message": "LLM generation failed.",
    },
}
```

Aturan response:

1. Selalu ada key `success`.
2. Selalu ada key `provider`.
3. Selalu ada key `model`.
4. Selalu ada key `text`.
5. Selalu ada key `raw`.
6. Selalu ada key `error`.
7. Error tidak boleh menampilkan API key.
8. Error tidak boleh menampilkan credential.
9. Raw response boleh disederhanakan agar aman.
10. Text harus string.

---

## 12. Prompt Template Rules

Prompt template harus:

1. Disimpan di folder `prompts/`.
2. Menggunakan nama file yang jelas.
3. Menggunakan placeholder eksplisit.
4. Tidak menyimpan API key.
5. Tidak menyimpan credential.
6. Tidak menyimpan data pribadi statis.
7. Tidak menyimpan koneksi database.
8. Tidak menyimpan konfigurasi Supabase.

Contoh placeholder:

```text
Halo {business_name}, berikut ringkasan data:
{business_context}
```

PromptBuilder wajib memastikan placeholder yang dibutuhkan tersedia di variables.

---

## 13. Validation Rules

LLM Layer melakukan validasi input.

Validasi minimal:

1. Prompt tidak boleh kosong.
2. Template name tidak boleh kosong.
3. Template path harus aman.
4. Variables harus mapping.
5. Required variables harus tersedia.
6. Model name tidak boleh kosong.
7. API key tidak boleh kosong bila real model dibuat.
8. Response text harus string.
9. JSON extraction harus eksplisit gagal bila JSON invalid.

---

## 14. Exception Handling Rules

LLM Layer wajib menangani exception secara eksplisit.

Aturan:

1. GeminiClient mengubah provider error menjadi response gagal terstruktur.
2. PromptLoader menaikkan `FileNotFoundError` bila template tidak tersedia.
3. PromptBuilder menaikkan `ValueError` bila variable kurang.
4. ResponseFormatter menaikkan `ValueError` bila JSON tidak ditemukan atau invalid.
5. Jangan mengekspos API key.
6. Jangan mengekspos credential.
7. Jangan mengembalikan raw exception object.
8. Log error penting dengan logger project.

---

## 15. Logging Rules

LLM Layer wajib menggunakan logger project.

Logger digunakan untuk:

1. Mencatat model generation dimulai.
2. Mencatat model generation gagal.
3. Mencatat template loading.
4. Mencatat prompt building gagal.
5. Mencatat response formatting gagal.

Logger tidak boleh digunakan untuk:

1. Menampilkan API key.
2. Menampilkan credential.
3. Menampilkan prompt lengkap yang mengandung data sensitif.
4. Menampilkan raw private user data secara berlebihan.
5. Menggantikan structured response.

---

## 16. Typing Rules

Seluruh file LLM Layer wajib:

1. Menggunakan `from __future__ import annotations`.
2. Menggunakan modern Python typing.
3. Memberikan type hint untuk semua argument.
4. Memberikan type hint untuk semua return value.
5. Menggunakan `dict[str, Any]` untuk response dinamis.
6. Menggunakan `Mapping[str, Any]` untuk variables.
7. Menggunakan `str | None`, bukan `Optional[str]`.
8. Menggunakan `Any` hanya bila struktur provider response dinamis.

---

## 17. Naming Convention

Nama class wajib:

```text
GeminiClient
PromptLoader
PromptBuilder
ResponseFormatter
```

Nama file wajib:

```text
gemini_client.py
prompt_loader.py
prompt_builder.py
response_formatter.py
```

Nama test wajib:

```text
test_gemini_client.py
test_prompt_loader.py
test_prompt_builder.py
test_response_formatter.py
```

---

## 18. Method Naming Convention

Pola method LLM Layer:

```text
generate
generate_text
load_template
list_templates
build_prompt
build_chat_prompt
format_text
extract_json
success_response
error_response
```

Method LLM Layer tidak boleh bernama seperti operasi database:

```text
insert_prompt
update_response
delete_template
select_model
```

---

## 19. Testing Convention

LLM Layer wajib diuji dengan `pytest`.

Aturan test:

1. Test GeminiClient menggunakan fake model.
2. Test tidak boleh memanggil Gemini asli.
3. Test tidak boleh membutuhkan API key asli.
4. Test PromptLoader menggunakan `tmp_path`.
5. Test PromptBuilder menggunakan template sederhana.
6. Test ResponseFormatter menggunakan string statis.
7. Test tidak boleh mengakses database.
8. Test tidak boleh mengakses Repository.
9. Test tidak boleh menguji UI.
10. Test harus deterministik.
11. Test harus menguji sukses dan gagal.

---

## 20. Things That Are Forbidden

Hal berikut dilarang di LLM Layer:

1. Mengakses Repository.
2. Mengakses Supabase.
3. Membuat Repository.
4. Membuat Service.
5. Membuat Tool.
6. Membuat Workflow.
7. Mengakses database.
8. Melakukan CRUD.
9. Mengatur LangGraph.
10. Mengakses Streamlit.
11. Mengakses FastAPI object.
12. Menggunakan `print`.
13. Menyimpan API key di source code.
14. Menampilkan API key di log.
15. Menampilkan credential di log.
16. Mengembalikan raw exception object.
17. Mengembalikan credential dalam response.
18. Membaca prompt file dari path tidak aman.
19. Mengubah arsitektur Repository.
20. Mengubah arsitektur Service.
21. Mengubah arsitektur Tool.
22. Mengubah arsitektur Workflow.
23. Membuat dependency melingkar.

---

## Final Contract Statement

LLM Layer adalah satu-satunya lapisan yang boleh berinteraksi dengan provider LLM dan prompt template.

Kontrak utama LLM Layer adalah:

```text
LLM Layer boleh memuat prompt.
LLM Layer boleh membangun prompt.
LLM Layer boleh memanggil Gemini melalui GeminiClient.
LLM Layer boleh memformat response LLM.
LLM Layer tidak boleh mengakses Repository.
LLM Layer tidak boleh mengakses database langsung.
LLM Layer tidak boleh memanggil Service.
LLM Layer tidak boleh memanggil Tool.
LLM Layer tidak boleh memanggil Workflow.
LLM Layer tidak boleh mengatur UI.
```

Kontrak ini berlaku untuk seluruh file LLM Layer dan seluruh test LLM Layer dalam proyek UMKM Copilot AI.
