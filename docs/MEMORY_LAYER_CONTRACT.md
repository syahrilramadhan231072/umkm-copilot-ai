# MEMORY LAYER CONTRACT

**Project:** UMKM Copilot AI  
**Layer:** Memory Layer  
**Status:** Official Architecture Contract  
**Phase:** Phase 6  

---

## 1. Tujuan Memory Layer

Memory Layer adalah lapisan yang bertanggung jawab untuk menyiapkan, membaca, dan menyimpan context yang digunakan oleh Workflow Layer, Agent Layer, dan LangGraph state.

Memory Layer menjadi jembatan antara kebutuhan stateful AI dan data aplikasi yang tersimpan di database, tetapi tidak boleh mengakses database secara langsung.

Tujuan utama Memory Layer adalah:

1. Menyediakan business context untuk workflow dan agent.
2. Menyediakan conversation memory untuk session AI.
3. Mengubah data aplikasi menjadi state yang aman digunakan LangGraph.
4. Menyimpan percakapan melalui Service Layer.
5. Membaca riwayat percakapan melalui Service Layer.
6. Menjaga agar Agent tidak mengakses database.
7. Menjaga agar Workflow tidak menyimpan memory secara langsung.
8. Menjaga agar LLM Layer tidak mengetahui detail penyimpanan conversation.
9. Menyediakan struktur context yang konsisten.
10. Menyediakan memory yang mudah diuji dengan dependency injection.

Memory Layer tidak boleh melakukan AI reasoning, tidak boleh membuat prompt final, tidak boleh memanggil LLM, dan tidak boleh mengakses Repository atau Supabase secara langsung.

---

## 2. Posisi Memory dalam Architecture

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

Memory Layer digunakan sebagai pendukung LangGraph Workflow dan Agent Layer untuk mengelola state dan history.

Arah dependency yang benar:

```text
Workflow Layer → Memory Layer → Service Layer → Repository Layer
Agent Layer → Memory Layer → Service Layer → Repository Layer
Memory Layer → Tool Layer
Memory Layer → Service Layer
```

Memory Layer boleh menggunakan Service Layer untuk operasi memory yang bersifat aplikasi, seperti mengambil business profile dan conversation history.

Memory Layer boleh menggunakan Tool Layer untuk mengambil context yang sudah distandardisasi, seperti analytics context atau insight context, selama tidak menyebabkan dependency melingkar.

Arah dependency yang salah:

```text
Memory Layer → Repository Layer
Memory Layer → Supabase
Memory Layer → Gemini
Memory Layer → Streamlit
Memory Layer → FastAPI Request
Service Layer → Memory Layer
Repository Layer → Memory Layer
```

---

## 3. Core Principle

Prinsip utama Memory Layer adalah:

```text
Load context.
Store conversation.
Prepare workflow state.
Never own business logic.
Never call LLM.
Never access database directly.
```

Memory Layer hanya boleh:

1. Membaca context melalui Service atau Tool.
2. Menyimpan conversation melalui ConversationService.
3. Membaca conversation history melalui ConversationService.
4. Menyiapkan dictionary state untuk workflow atau agent.
5. Menormalisasi context agar aman digunakan layer atas.
6. Melakukan validasi ringan terhadap input memory.
7. Menyediakan trimming conversation history berdasarkan limit.
8. Menyediakan metadata memory seperti `business_id`, `session_id`, dan `message_count`.

Memory Layer tidak boleh:

1. Mengakses Repository.
2. Mengakses Supabase.
3. Menjalankan query database.
4. Membuat prompt final.
5. Memanggil Gemini.
6. Memanggil LLM.
7. Melakukan AI reasoning.
8. Mengatur node dan edge LangGraph secara langsung.
9. Menjalankan CRUD selain melalui Service yang tepat.
10. Mengandung UI logic.

---

## 4. Dependency Rules

Memory Layer hanya boleh bergantung pada:

1. Service Layer.
2. Tool Layer bila dibutuhkan untuk context yang sudah distandardisasi.
3. Utility umum dari `app/utils/`.
4. Logger project.
5. Python standard library.
6. Type internal bila diperlukan.

Memory Layer tidak boleh bergantung pada:

1. Repository Layer.
2. Supabase client.
3. Database connection.
4. LangGraph internals.
5. Gemini client.
6. Prompt Builder.
7. Prompt Loader.
8. Streamlit.
9. FastAPI object.
10. UI component.

---

## 5. Dependency Injection Rules

Seluruh dependency Memory Layer wajib diberikan melalui constructor.

Memory class tidak boleh membuat instance Service, Tool, Repository, atau LLM client di dalam method.

Benar:

```python
class ConversationMemory:
    def __init__(self, conversation_service: ConversationService) -> None:
        self._conversation_service = conversation_service
```

Salah:

```python
class ConversationMemory:
    def load_history(self, business_id: str, session_id: str) -> list[dict[str, str]]:
        conversation_service = ConversationService(...)
        return conversation_service.build_session_history(business_id, session_id)
```

Aturan dependency injection:

1. Service atau Tool diberikan melalui constructor.
2. Dependency disimpan sebagai protected attribute dengan awalan `_`.
3. Constructor tidak boleh membaca database.
4. Constructor tidak boleh menjalankan flow.
5. Constructor tidak boleh membuat prompt.
6. Dependency yang tidak digunakan tidak boleh disuntikkan.
7. Dependency wajib eksplisit agar mudah diuji.

---

## 6. Memory Classes

Memory Layer Phase 6 terdiri dari:

```text
BusinessContext
ConversationMemory
```

Lokasi file:

```text
app/memory/business_context.py
app/memory/conversation_memory.py
```

Lokasi test:

```text
tests/test_business_context.py
tests/test_conversation_memory.py
```

---

## 7. BusinessContext Responsibilities

BusinessContext bertanggung jawab untuk menyediakan context bisnis yang akan digunakan workflow, tool, agent, atau prompt builder pada phase berikutnya.

BusinessContext boleh:

1. Membaca business profile melalui BusinessService.
2. Membaca business context melalui BusinessService.
3. Membaca dashboard context melalui AnalyticsTools bila tersedia.
4. Membaca insight context melalui InsightTools bila tersedia.
5. Menyusun state bisnis untuk workflow.
6. Menyusun context ringkas untuk agent.
7. Menyediakan metadata business.
8. Melakukan validasi ringan terhadap business_id.

BusinessContext tidak boleh:

1. Mengakses BusinessRepository.
2. Mengakses Repository apa pun.
3. Mengakses Supabase.
4. Membuat business profile langsung.
5. Mengubah data business tanpa Service.
6. Membuat prompt final.
7. Memanggil LLM.
8. Melakukan AI reasoning.

---

## 8. ConversationMemory Responsibilities

ConversationMemory bertanggung jawab untuk menyimpan dan membaca riwayat percakapan.

ConversationMemory boleh:

1. Menyimpan user message melalui ConversationService.
2. Menyimpan assistant message melalui ConversationService.
3. Menyimpan system message melalui ConversationService.
4. Membaca session history melalui ConversationService.
5. Membaca recent conversations melalui ConversationService.
6. Menyusun memory state untuk agent.
7. Melakukan trimming history berdasarkan limit.
8. Menghitung jumlah pesan session melalui ConversationService.
9. Menghapus conversation record bila service menyediakan dan use case membutuhkan.

ConversationMemory tidak boleh:

1. Mengakses ConversationRepository.
2. Mengakses Supabase.
3. Mengatur LangGraph node atau edge.
4. Memanggil LLM.
5. Membuat prompt final.
6. Melakukan AI reasoning.
7. Menulis file.
8. Mengandung UI logic.

---

## 9. Memory State Contract

Memory Layer wajib mengembalikan dictionary terstruktur.

Business context state minimal:

```python
{
    "business_id": "business-id",
    "business_profile": {},
    "business_context": {},
    "dashboard_context": {},
    "insight_context": {},
    "metadata": {
        "source": "BusinessContext",
    },
}
```

Conversation memory state minimal:

```python
{
    "business_id": "business-id",
    "session_id": "session-id",
    "history": [
        {
            "role": "user",
            "message": "Hello",
            "agent": "router",
        }
    ],
    "message_count": 1,
    "metadata": {
        "source": "ConversationMemory",
    },
}
```

Aturan state:

1. State harus dictionary.
2. State tidak boleh mengandung raw exception object.
3. State tidak boleh mengandung raw Supabase response.
4. State tidak boleh mengandung credential.
5. State harus aman digunakan oleh Workflow atau Agent.
6. State tidak boleh berisi prompt final.
7. State tidak boleh berisi hasil reasoning LLM.

---

## 10. Validation Rules

Memory Layer melakukan validasi ringan.

Validasi minimal:

1. `business_id` tidak boleh kosong.
2. `session_id` tidak boleh kosong bila conversation memory digunakan.
3. `role` conversation harus valid.
4. `message` tidak boleh kosong.
5. `limit` harus integer positif.
6. `state` harus mapping bila digabungkan.
7. Optional context flag harus boolean.

Business rule tetap berada di Service Layer.

Analytics calculation tetap berada di Analytics Layer.

Tool response validation tetap berada di Tool Layer.

---

## 11. Exception Handling Rules

Memory Layer boleh menaikkan exception eksplisit untuk input invalid.

Aturan exception:

1. Gunakan `ValueError` untuk input invalid.
2. Gunakan `RuntimeError` untuk response Tool yang gagal.
3. Jangan menelan exception tanpa konteks.
4. Jangan mengembalikan raw exception object.
5. Jangan mengekspos raw Supabase error.
6. Jangan mengekspos credential.
7. Log error penting dengan logger project.
8. Exception harus dapat diuji dengan pytest.

---

## 12. Logging Rules

Memory Layer wajib menggunakan logger project.

Logger digunakan untuk:

1. Mencatat context loading.
2. Mencatat conversation memory loading.
3. Mencatat conversation memory saving.
4. Mencatat context tool failure.
5. Mencatat validasi gagal bila relevan.

Logger tidak boleh digunakan untuk:

1. Menampilkan credential.
2. Menampilkan API key.
3. Menampilkan raw prompt.
4. Menampilkan data pribadi pelanggan secara berlebihan.
5. Menggantikan exception handling.

---

## 13. Typing Rules

Seluruh file Memory Layer wajib:

1. Menggunakan `from __future__ import annotations`.
2. Menggunakan modern Python typing.
3. Memberikan type hint untuk semua argument.
4. Memberikan type hint untuk semua return value.
5. Menggunakan `dict[str, Any]` untuk state dinamis.
6. Menggunakan `list[dict[str, str]]` untuk history.
7. Menggunakan `str | None`, bukan `Optional[str]`.
8. Menggunakan `Any` hanya bila struktur state memang dinamis.

---

## 14. Naming Convention

Nama class wajib:

```text
BusinessContext
ConversationMemory
```

Nama file wajib:

```text
business_context.py
conversation_memory.py
```

Nama test wajib:

```text
test_business_context.py
test_conversation_memory.py
```

---

## 15. Method Naming Convention

Pola method Memory Layer:

```text
load_<context>
build_<state>
save_<message_type>
append_<context>
clear_<memory>
```

Contoh:

```text
load_business_profile
load_business_context
build_business_state
append_business_context
load_history
build_memory_state
save_user_message
save_assistant_message
save_system_message
count_session_messages
```

Method Memory Layer tidak boleh bernama seperti operasi repository teknis:

```text
select_conversation
insert_message_row
update_table
delete_from_supabase
```

---

## 16. Testing Convention

Memory Layer wajib diuji dengan `pytest`.

Aturan test:

1. Test menggunakan fake service atau fake tool.
2. Test tidak boleh mengakses Repository.
3. Test tidak boleh mengakses Supabase.
4. Test tidak boleh memanggil LLM.
5. Test tidak boleh menguji UI.
6. Test harus menguji context loading sukses.
7. Test harus menguji memory saving sukses.
8. Test harus menguji validasi input invalid.
9. Test harus menguji Tool response gagal bila dependency tool digunakan.
10. Test harus memverifikasi struktur state.
11. Test harus deterministik.

---

## 17. Things That Are Forbidden

Hal berikut dilarang di Memory Layer:

1. Mengakses Repository.
2. Mengakses Supabase.
3. Membuat Repository.
4. Membuat Service di dalam method.
5. Membuat Tool di dalam method.
6. Membuat LLM client.
7. Membuat prompt final.
8. Membaca prompt file.
9. Memanggil Gemini.
10. Memanggil LLM.
11. Melakukan AI reasoning.
12. Mengatur node dan edge LangGraph.
13. Mengakses Streamlit.
14. Mengakses FastAPI object.
15. Menggunakan `print`.
16. Mengembalikan raw exception object.
17. Mengembalikan raw Supabase response.
18. Menyimpan credential.
19. Menampilkan credential di log.
20. Menempatkan business logic detail di Memory.
21. Menempatkan UI logic di Memory.
22. Mengubah arsitektur Repository.
23. Mengubah arsitektur Service.
24. Mengubah arsitektur Tool.
25. Membuat dependency melingkar.

---

## Final Contract Statement

Memory Layer adalah lapisan context dan conversation memory untuk Workflow, Agent, dan LangGraph state.

Kontrak utama Memory Layer adalah:

```text
Memory boleh memanggil Service.
Memory boleh memanggil Tool bila dibutuhkan untuk context.
Memory tidak boleh memanggil Repository.
Memory tidak boleh mengakses database langsung.
Memory tidak boleh memanggil LLM.
Memory tidak boleh membuat prompt final.
Memory tidak boleh menjalankan AI reasoning.
Memory wajib mengembalikan state terstruktur.
```

Kontrak ini berlaku untuk seluruh file Memory Layer dan seluruh test Memory Layer dalam proyek UMKM Copilot AI.
