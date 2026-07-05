"""
Simple test for Gemini Client.
"""

from app.llm.gemini_client import get_gemini

print("=" * 60)
print("Testing Gemini Client")
print("=" * 60)

client = get_gemini()

print("Running health check...")

ok = client.test_connection()

print()

if ok:
    print("✅ Gemini connection successful.")
else:
    print("❌ Gemini connection failed.")

print("=" * 60)
