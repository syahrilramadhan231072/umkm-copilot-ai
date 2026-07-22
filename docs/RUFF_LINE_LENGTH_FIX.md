# Ruff Line Length Fix

Fixes the reported Ruff issues:

- B904 in `app/api/routers/onboarding.py`
- E501 line-too-long issues in frontend pages, AI generation service, and tests

## Apply

```bash
unzip -o go_umkm_ruff_line_length_fix_patch.zip
```

## Validate

```bash
python -m ruff check app pages tests
python -m ruff format app pages tests --check
pytest
```

If format check reports formatting differences, run:

```bash
python -m ruff format app pages tests
python -m ruff check app pages tests
pytest
```
