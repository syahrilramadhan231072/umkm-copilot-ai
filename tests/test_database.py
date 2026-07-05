from app.database.connection import (
    get_supabase,
    health_check,
)

print("=" * 60)
print("Testing Supabase Connection")
print("=" * 60)

ok = health_check()

print(f"Health Check : {ok}")

if ok:
    client = get_supabase()
    print(type(client))

print("=" * 60)
