# UMKM Copilot AI – Backend Connected Onboarding Patch

Patch ini mengubah onboarding dari mode lokal menjadi mode operasional backend.

## Tujuan

Alur baru:

```text
Profil Bisnis
↓
POST /api/v1/onboarding/business-profile
↓
Backend menyimpan business_profile dan mengembalikan business_id
↓
Produk
↓
POST /api/v1/onboarding/products
↓
Backend menyimpan product dan mengembalikan product_id
↓
Transaksi Pertama
↓
POST /api/v1/transactions/record
↓
Dashboard, Asisten AI, Pemasaran, Rekomendasi, Export aktif
```

## File baru/diubah

```text
app/api/routers/onboarding.py
app/api/main.py
app/frontend/api_client.py
app/frontend/session.py
app/frontend/onboarding.py
app/frontend/navigation.py
app/frontend/ui_components.py

pages/Business_Profile.py
pages/Products.py
pages/First_Transaction.py
pages/Dashboard.py
pages/AI_Assistant.py
pages/Marketing.py
pages/Insights.py
pages/Export.py
pages/Settings.py

tests/test_api_onboarding_router.py
tests/test_frontend_onboarding.py
tests/test_frontend_session.py
```

## Catatan integrasi

Router onboarding memakai service/repository yang sudah ada dengan pendekatan adapter ringan.
Jika nama method service/repository di project Anda berbeda, cukup sesuaikan bagian helper
di `app/api/routers/onboarding.py`.

Patch ini tidak mengubah skema database.
