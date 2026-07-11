# ANALYTICS LAYER CONTRACT

**Project:** UMKM Copilot AI  
**Layer:** Analytics Layer  
**Status:** Official Architecture Contract  
**Phase:** Phase 3  

---

## 1. Tujuan Analytics Layer

Analytics Layer adalah lapisan read-only yang bertanggung jawab untuk membaca data aplikasi dan mengubahnya menjadi ringkasan, agregasi, metrik, KPI, tren, serta struktur data dashboard.

Analytics Layer membantu UMKM memahami kondisi bisnis berdasarkan data yang sudah tersimpan melalui Repository Layer.

Tujuan utama Analytics Layer adalah:

1. Menyediakan perhitungan metrik bisnis.
2. Menyediakan ringkasan penjualan.
3. Menyediakan ringkasan inventory.
4. Menyediakan ringkasan performa produk.
5. Menyediakan ringkasan perilaku pelanggan bila data tersedia.
6. Menyediakan payload dashboard.
7. Menyediakan data terstruktur untuk Tool Layer dan Insight Layer.
8. Menjaga agar Service Layer tidak dipenuhi logic agregasi.
9. Menjaga agar Tool Layer tidak menghitung KPI langsung.
10. Menjaga agar Agent Layer tidak membaca database atau menghitung KPI sendiri.

Analytics Layer tidak menghasilkan output AI, tidak membuat prompt, tidak memanggil LLM, dan tidak mengatur LangGraph workflow.

---

## 2. Posisi Analytics dalam Architecture

Arsitektur utama proyek UMKM Copilot AI adalah:

```text
Frontend (Streamlit)
        |
API Layer (FastAPI, optional)
        |
LangGraph Workflow
        |
Tool Layer
        |
Service Layer
        |
Repository Layer
        |
Supabase PostgreSQL
```

Analytics Layer adalah jalur read-only untuk agregasi dan KPI.

Arah dependency yang benar:

```text
Tool Layer -> Analytics Layer -> Repository Layer
```

Arah lain yang diperbolehkan untuk komposisi dashboard:

```text
DashboardAnalytics -> SalesAnalytics
DashboardAnalytics -> InventoryAnalytics
DashboardAnalytics -> ProductAnalytics
DashboardAnalytics -> CustomerAnalytics
```

Analytics Layer tidak boleh menjadi jalur operasi tulis.

---

## 3. Core Principle

Prinsip utama Analytics Layer adalah:

```text
Read data.
Calculate metrics.
Return structured results.
Never mutate data.
```

Analytics Layer hanya boleh melakukan:

1. Read.
2. Filter.
3. Sort.
4. Count.
5. Sum.
6. Average.
7. Grouping.
8. Aggregation.
9. KPI calculation.
10. Dashboard data preparation.

Analytics Layer tidak boleh melakukan:

1. Insert.
2. Update.
3. Delete.
4. Upsert.
5. Stock adjustment.
6. Transaction creation.
7. Prompt generation.
8. AI reasoning.
9. LLM call.
10. Workflow orchestration.

---

## 4. Dependency Rules

Analytics Layer hanya boleh bergantung pada:

1. Repository Layer.
2. Schema atau type internal bila tersedia.
3. Utility umum dari `app/utils/`.
4. Logger project.
5. Python standard library.
6. Analytics class lain untuk komposisi dashboard.

Analytics Layer tidak boleh bergantung pada:

1. Supabase client secara langsung.
2. LangGraph.
3. Gemini.
4. Streamlit.
5. FastAPI object.
6. Agent Layer.
7. Workflow Layer.
8. Tool Layer.
9. LLM Layer.
10. Prompt file.
11. UI component.

Arah dependency wajib tetap satu arah:

```text
Analytics Layer -> Repository Layer
```

Tidak boleh ada dependency terbalik:

```text
Repository Layer -> Analytics Layer
```

---

## 5. Dependency Injection Rules

Seluruh dependency Analytics Layer wajib diberikan melalui constructor.

Analytics class tidak boleh membuat instance repository sendiri.

Benar:

```python
class SalesAnalytics(BaseAnalytics):
    def __init__(
        self,
        transaction_repository: TransactionRepository,
    ) -> None:
        super().__init__()
        self._transaction_repository = transaction_repository
```

Salah:

```python
class SalesAnalytics(BaseAnalytics):
    def get_sales_summary(self) -> dict[str, int]:
        transaction_repository = TransactionRepository()
        return transaction_repository.list()
```

Aturan dependency injection:

1. Repository diberikan melalui constructor.
2. Analytics tidak membuat repository sendiri.
3. Analytics tidak membuat Supabase client.
4. Analytics tidak membaca konfigurasi database langsung.
5. Dependency disimpan sebagai protected attribute dengan awalan `_`.
6. Dependency wajib eksplisit.
7. Dependency yang tidak dipakai tidak boleh disuntikkan.
8. Constructor tidak boleh menjalankan query.

---

## 6. BaseAnalytics Contract

`BaseAnalytics` adalah class dasar untuk seluruh Analytics Layer.

Seluruh analytics class wajib mewarisi `BaseAnalytics`.

Tanggung jawab `BaseAnalytics`:

1. Menyediakan logger.
2. Menyediakan helper validasi umum.
3. Menyediakan helper parsing angka.
4. Menyediakan helper pembulatan metrik.
5. Menyediakan helper validasi limit.
6. Menyediakan helper safe division.
7. Menyediakan helper grouping sederhana.
8. Menyediakan helper sorting metric.
9. Menyediakan helper normalisasi hasil repository.

`BaseAnalytics` tidak boleh:

1. Mengakses Supabase langsung.
2. Menjalankan query database.
3. Menulis data.
4. Mengandung logic spesifik penjualan.
5. Mengandung logic spesifik inventory.
6. Mengandung logic spesifik produk.
7. Mengandung logic spesifik pelanggan.
8. Memanggil LLM.
9. Membuat prompt.

---

## 7. Analytics Classes

Analytics Layer Phase 3 terdiri dari:

```text
BaseAnalytics
SalesAnalytics
InventoryAnalytics
ProductAnalytics
CustomerAnalytics
DashboardAnalytics
```

Lokasi file:

```text
app/analytics/base_analytics.py
app/analytics/sales_analytics.py
app/analytics/inventory_analytics.py
app/analytics/product_analytics.py
app/analytics/customer_analytics.py
app/analytics/dashboard_analytics.py
```

Lokasi test:

```text
tests/test_base_analytics.py
tests/test_sales_analytics.py
tests/test_inventory_analytics.py
tests/test_product_analytics.py
tests/test_customer_analytics.py
tests/test_dashboard_analytics.py
```

---

## 8. SalesAnalytics Responsibilities

SalesAnalytics bertanggung jawab untuk membaca transaksi dan menghitung metrik penjualan.

Contoh metrik:

1. Total transaksi.
2. Total revenue.
3. Total quantity sold.
4. Average order value.
5. Sales by product.
6. Sales by payment method.
7. Sales by status.
8. Top selling products.
9. Completed sales only.
10. Revenue contribution.

SalesAnalytics tidak boleh membuat transaksi, mengubah status transaksi, menghapus transaksi, mengubah stok, memanggil ProductService, atau memanggil LLM.

---

## 9. InventoryAnalytics Responsibilities

InventoryAnalytics bertanggung jawab untuk membaca produk dan menghitung metrik inventory.

Contoh metrik:

1. Total inventory items.
2. Total stock units.
3. Low stock count.
4. Out of stock count.
5. Safe stock count.
6. Inventory cost value.
7. Inventory selling value.
8. Inventory potential margin.
9. Low stock items.
10. Stock status distribution.

InventoryAnalytics tidak boleh menambah stok, mengurangi stok, mengubah minimum stock, menghapus produk, atau membuat movement inventory.

---

## 10. ProductAnalytics Responsibilities

ProductAnalytics bertanggung jawab untuk membaca produk dan transaksi untuk menghitung performa produk.

Contoh metrik:

1. Total products.
2. Active products.
3. Inactive products.
4. Products by category.
5. Product revenue.
6. Product quantity sold.
7. Top products by revenue.
8. Top products by quantity.
9. Product profitability approximation.
10. Product margin estimate.

ProductAnalytics tidak boleh membuat produk, mengubah produk, menghapus produk, mengubah stok, atau menghasilkan promosi AI.

---

## 11. CustomerAnalytics Responsibilities

CustomerAnalytics bertanggung jawab untuk membaca transaksi dan menghitung metrik pelanggan bila data pelanggan tersedia.

Karena proyek dapat memiliki data pelanggan eksplisit atau hanya data transaksi umum, CustomerAnalytics harus aman terhadap data pelanggan yang tidak lengkap.

Contoh metrik:

1. Estimated unique customer count.
2. Customer purchase frequency.
3. Revenue by customer.
4. Top customers by revenue.
5. Anonymous transaction count.
6. Payment preference distribution.
7. Customer fields availability.
8. Customer summary.

CustomerAnalytics tidak boleh membuat customer, mengubah customer, menghapus customer, mengirim pesan, atau membuat segmentasi AI dengan LLM.

---

## 12. DashboardAnalytics Responsibilities

DashboardAnalytics bertanggung jawab menggabungkan hasil analytics read-only menjadi ringkasan dashboard.

DashboardAnalytics boleh menerima analytics class lain melalui constructor.

Contoh output:

1. Sales summary.
2. Inventory summary.
3. Product summary.
4. Customer summary.
5. KPI cards.
6. Alerts.
7. Executive summary data.
8. Dashboard payload terstruktur.

DashboardAnalytics tidak boleh mengakses database langsung bila sudah menggunakan analytics class lain, menulis data, menjalankan CRUD, membuat prompt, memanggil LLM, atau mengatur UI Streamlit.

---

## 13. Validation Rules

Analytics Layer wajib melakukan validasi untuk input method.

Validasi minimal:

1. `business_id` tidak boleh kosong bila diperlukan.
2. `limit` harus integer positif.
3. `top_n` harus integer positif.
4. `status` tidak boleh kosong bila digunakan.
5. `category` tidak boleh kosong bila digunakan.
6. `field_name` untuk grouping tidak boleh kosong.
7. Data hasil repository harus berupa list atau dict sesuai kebutuhan.

Analytics Layer tidak bertanggung jawab terhadap validasi UI, prompt, output AI, schema database teknis, atau aturan CRUD Service Layer.

---

## 14. Exception Handling Rules

Analytics Layer wajib menaikkan exception eksplisit jika input tidak valid.

Aturan exception:

1. Gunakan `ValueError` untuk input invalid.
2. Gunakan `RuntimeError` untuk hasil repository yang tidak sesuai kontrak.
3. Jangan menelan exception tanpa konteks.
4. Jangan mengembalikan nilai palsu untuk error serius.
5. Jangan mengekspos raw Supabase error ke layer atas.
6. Jangan mencampur error handling dengan UI.
7. Jangan menggunakan broad exception tanpa alasan.

---

## 15. Logging Rules

Analytics Layer wajib menggunakan logger project.

Logger digunakan untuk mencatat proses analytics penting, perhitungan dashboard, kondisi data kosong, dan error analytics yang relevan.

Logger tidak boleh digunakan untuk menampilkan credential, API key, data pribadi pelanggan secara berlebihan, raw prompt, atau menggantikan exception.

---

## 16. Typing Rules

Seluruh file Analytics Layer wajib:

1. Menggunakan `from __future__ import annotations`.
2. Menggunakan modern Python typing.
3. Menggunakan `list[dict[str, Any]]`.
4. Menggunakan `dict[str, Any]`.
5. Menggunakan `str | None`, bukan `Optional[str]`.
6. Memberikan type hint untuk semua argument.
7. Memberikan type hint untuk semua return value.
8. Menggunakan `Any` hanya bila struktur data repository memang dinamis.
9. Menghindari return type ambigu.

---

## 17. Naming Convention

Nama analytics class wajib menggunakan format:

```text
<EntityName>Analytics
```

Nama file wajib menggunakan snake_case:

```text
base_analytics.py
sales_analytics.py
inventory_analytics.py
product_analytics.py
customer_analytics.py
dashboard_analytics.py
```

Nama test wajib menggunakan format:

```text
test_<analytics_name>.py
```

---

## 18. Method Naming Convention

Nama method harus menggambarkan metrik atau ringkasan yang dihitung.

Pola method yang disarankan:

```text
get_<domain>_summary
get_<metric_name>
get_<metric>_by_<dimension>
get_top_<entity>_by_<metric>
calculate_<metric>
build_<payload_name>
```

Contoh:

```text
get_sales_summary
get_revenue_by_product
get_sales_by_payment_method
get_inventory_summary
get_stock_status_distribution
get_product_summary
get_top_products_by_revenue
get_customer_summary
build_dashboard_payload
```

Method Analytics tidak boleh bernama seperti operasi CRUD:

```text
create_report
insert_metric
update_dashboard
delete_summary
save_analytics
```

---

## 19. Testing Convention

Analytics Layer wajib memiliki test menggunakan `pytest`.

Aturan test:

1. Gunakan repository asli.
2. Gunakan dependency injection.
3. Test harus read-only.
4. Test tidak boleh membuat data kecuali benar-benar diperlukan.
5. Test tidak boleh mengubah data.
6. Test tidak boleh menghapus data.
7. Test harus aman bila demo data belum tersedia.
8. Test boleh menggunakan `pytest.skip` jika data demo tidak tersedia.
9. Test harus menguji output type.
10. Test harus menguji struktur hasil.
11. Test harus menguji validasi input invalid.
12. Test tidak boleh memanggil LLM.
13. Test tidak boleh menguji UI.
14. Test tidak boleh menguji LangGraph flow.

---

## 20. Things That Are Forbidden

Hal berikut dilarang di Analytics Layer:

1. Mengakses Supabase client langsung.
2. Menulis query database langsung.
3. Membuat repository di dalam method.
4. Membuat data baru.
5. Mengubah data.
6. Menghapus data.
7. Melakukan upsert.
8. Menyesuaikan stok.
9. Membuat transaksi.
10. Mengubah status transaksi.
11. Membuat prompt.
12. Membaca file prompt.
13. Memanggil Gemini.
14. Memanggil LLM.
15. Melakukan AI reasoning.
16. Mengatur LangGraph workflow.
17. Mengakses Streamlit.
18. Mengakses FastAPI object.
19. Menggunakan `print`.
20. Mengubah arsitektur Repository.
21. Mengembalikan raw Supabase response tanpa normalisasi.
22. Menggunakan mutable default argument.
23. Membuat dependency melingkar.
24. Mencampur UI logic dengan analytics.
25. Mencampur analytics read-only dengan business mutation.

---

## 21. Example Class Structure

```python
from __future__ import annotations

from typing import Any

from app.analytics.base_analytics import BaseAnalytics
from app.repositories.transaction_repository import TransactionRepository


class SalesAnalytics(BaseAnalytics):
    """Read-only analytics for sales metrics."""

    def __init__(self, transaction_repository: TransactionRepository) -> None:
        """Initialize sales analytics."""
        super().__init__()
        self._transaction_repository = transaction_repository

    def get_sales_summary(
        self,
        business_id: str,
        limit: int = 100,
    ) -> dict[str, Any]:
        """Return sales summary for a business."""
        self._validate_required_text(business_id, field_name="business_id")
        self._validate_positive_int(limit, field_name="limit")

        transactions = self._transaction_repository.list(
            business_id=business_id,
            limit=limit,
        )

        records = self._ensure_list(transactions, field_name="transactions")

        return {
            "business_id": business_id,
            "transaction_count": len(records),
            "total_revenue": self._sum_numeric(records, "total_price"),
        }
```

---

## Final Contract Statement

Analytics Layer adalah lapisan read-only untuk summary, aggregation, KPI, dan dashboard.

Kontrak utama Analytics Layer adalah:

```text
Analytics boleh membaca data melalui Repository.
Analytics boleh menghitung metrik.
Analytics boleh menggabungkan data untuk dashboard.
Analytics tidak boleh INSERT.
Analytics tidak boleh UPDATE.
Analytics tidak boleh DELETE.
Analytics tidak boleh mengakses Supabase langsung.
Analytics tidak boleh memanggil LLM.
Analytics tidak boleh membuat prompt.
Analytics tidak boleh mengatur workflow.
Analytics tidak boleh menjalankan AI reasoning.
```

Kontrak ini berlaku untuk seluruh file Analytics Layer dan seluruh test Analytics Layer dalam proyek UMKM Copilot AI.
