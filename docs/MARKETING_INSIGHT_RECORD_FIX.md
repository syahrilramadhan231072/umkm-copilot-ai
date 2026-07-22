# Marketing and Insight Record Fix

## Problems fixed

- Marketing recommendations failed with `product_id is required`.
- Saving marketing records could fail because the frontend sent
  `campaign_name`, which is not part of the current `marketing_history`
  table schema.
- Insight creation failed because the frontend sent `recommendation`
  instead of the required `content` field.
- Insight category options included values not accepted by the service.
- Saved marketing/insight lists did not refresh immediately after saving.

## Changes

- Adds product context selector to Marketing and Insights pages.
- Sends marketing payload with `platform`, `caption`, `prompt`,
  and `product_id`.
- Sends insight payload with `insight_category`, `title`, and `content`.
- Uses allowed insight categories only:
  `sales`, `inventory`, `marketing`, `customer`, `general`.
- Refreshes pages after successful save via `st.rerun()`.
- Displays saved insight `content` in recommendation cards.
- Displays saved marketing `prompt` in campaign history.

## Validate

```bash
python -m ruff check pages/Marketing.py pages/Insights.py
python -m py_compile pages/Marketing.py pages/Insights.py
pytest
```
