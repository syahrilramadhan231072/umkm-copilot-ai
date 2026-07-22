# Troubleshooting Streamlit di GitHub Codespaces

## Error

```text
TypeError: Failed to fetch dynamically imported module
```

Contoh:

```text
/static/js/TextInput...
/static/js/TextArea...
/static/js/FormSubmitContent...
```

## Penyebab umum

Ini biasanya bukan error business logic aplikasi. Penyebab paling umum adalah:

1. browser masih menyimpan cache JavaScript lama,
2. Streamlit direstart tetapi tab browser masih memakai bundle lama,
3. port forwarding Codespaces belum sinkron,
4. URL port lama masih dipakai setelah Codespace restart.

## Perbaikan cepat

### 1. Restart frontend

```bash
pkill -f streamlit || true

python -m streamlit cache clear

python -m streamlit run app.py \
  --server.address 0.0.0.0 \
  --server.port 8501 \
  --server.enableCORS false \
  --server.enableXsrfProtection false
```

### 2. Hard refresh browser

Di tab frontend:

```text
Ctrl + Shift + R
```

Atau buka lewat incognito/private window.

### 3. Buka dari Ports panel

```text
Codespaces → Ports → 8501 → Open in Browser
```

Jangan memakai tab URL lama.

### 4. Cek local server

```bash
curl -s http://localhost:8501 | head -n 20
```

Jika muncul HTML Streamlit, local frontend sehat.

### 5. Set port visibility

```bash
gh codespace ports visibility 8501:public -c "$CODESPACE_NAME"
```

Lalu buka ulang dari panel Ports.
