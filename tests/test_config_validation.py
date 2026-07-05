from app.config.settings import settings

print("=" * 40)
print("Configuration Validation")
print("=" * 40)

try:
    settings.validate_gemini()
    print("✅ Gemini configuration: OK")
except Exception as e:
    print(f"❌ Gemini configuration: {e}")

try:
    settings.validate_supabase()
    print("✅ Supabase configuration: OK")
except Exception as e:
    print(f"❌ Supabase configuration: {e}")
