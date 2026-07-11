"""
Prompt Loader Tests
===================

Pytest test suite for PromptLoader.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

import pytest

from app.llm.prompt_loader import PromptLoader


def test_prompt_loader_loads_template(tmp_path) -> None:
    """Assert PromptLoader loads template file."""

    prompt_file = tmp_path / "marketing.md"
    prompt_file.write_text("Hello {business_name}", encoding="utf-8")

    loader = PromptLoader(prompt_dir=tmp_path)
    template = loader.load_template("marketing.md")

    assert template == "Hello {business_name}"


def test_prompt_loader_lists_templates(tmp_path) -> None:
    """Assert PromptLoader lists allowed template files."""

    (tmp_path / "a.md").write_text("A", encoding="utf-8")
    (tmp_path / "b.txt").write_text("B", encoding="utf-8")
    (tmp_path / "c.j2").write_text("C", encoding="utf-8")
    (tmp_path / "ignored.json").write_text("{}", encoding="utf-8")

    loader = PromptLoader(prompt_dir=tmp_path)

    assert loader.list_templates() == ["a.md", "b.txt", "c.j2"]


def test_prompt_loader_rejects_unsafe_path(tmp_path) -> None:
    """Assert PromptLoader rejects unsafe template path."""

    loader = PromptLoader(prompt_dir=tmp_path)

    with pytest.raises(ValueError):
        loader.load_template("../outside.md")


def test_prompt_loader_rejects_unsupported_suffix(tmp_path) -> None:
    """Assert PromptLoader rejects unsupported file suffix."""

    loader = PromptLoader(prompt_dir=tmp_path)

    with pytest.raises(ValueError):
        loader.load_template("template.json")


def test_prompt_loader_raises_file_not_found(tmp_path) -> None:
    """Assert PromptLoader raises FileNotFoundError for missing template."""

    loader = PromptLoader(prompt_dir=tmp_path)

    with pytest.raises(FileNotFoundError):
        loader.load_template("missing.md")


def test_prompt_loader_checks_template_exists(tmp_path) -> None:
    """Assert PromptLoader checks template existence."""

    (tmp_path / "exists.md").write_text("A", encoding="utf-8")
    loader = PromptLoader(prompt_dir=tmp_path)

    assert loader.template_exists("exists.md") is True
    assert loader.template_exists("missing.md") is False
