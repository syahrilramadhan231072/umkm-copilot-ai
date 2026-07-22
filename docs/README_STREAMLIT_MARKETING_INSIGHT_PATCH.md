# README + Streamlit + Marketing/Insight Patch

## Isi patch

- Mengganti `README.md` menjadi versi Bahasa Indonesia.
- Menambahkan gambar desain ke `docs/images/go-umkm-ai-design-system.png`.
- Menambahkan konfigurasi `.streamlit/config.toml`.
- Menambahkan panduan `docs/TROUBLESHOOTING_STREAMLIT_CODESPACES.md`.
- Menambahkan helper `scripts/dev/run_frontend.sh`.
- Menyertakan ulang perbaikan `pages/Marketing.py` dan `pages/Insights.py`
  agar payload marketing/insight sesuai backend dan product context tersedia.

## Catatan penting

Error berikut biasanya bukan error backend/frontend business logic:

```text
TypeError: Failed to fetch dynamically imported module
```

Itu biasanya disebabkan cache browser atau port forwarding Codespaces.
Patch ini menambahkan konfigurasi dan panduan stabilisasi, tetapi hard
refresh browser atau buka ulang dari Ports panel mungkin tetap diperlukan.

## Apply

```bash
unzip -o go_umkm_readme_streamlit_marketing_fix_patch.zip
chmod +x scripts/dev/run_frontend.sh
```

## Validate

```bash
python -m ruff check pages/Marketing.py pages/Insights.py
python -m py_compile pages/Marketing.py pages/Insights.py
pytest
```
