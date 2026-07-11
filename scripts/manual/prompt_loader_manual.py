"""
Simple test for Prompt Loader.
"""

from app.llm.prompt_loader import get_prompt_loader

print("=" * 60)
print("Testing Prompt Loader")
print("=" * 60)

loader = get_prompt_loader()

print("\nAvailable prompts:")
print(loader.available())

print("\nLoading 'marketing' prompt...")

prompt = loader.load("marketing")

print("\nFirst 200 characters:")
print("-" * 60)
print(prompt[:200])
print("-" * 60)

print("\nReloading cache...")
loader.reload()

print("\n✅ Prompt Loader OK")

print("=" * 60)
