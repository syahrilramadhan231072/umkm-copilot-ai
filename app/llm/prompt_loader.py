"""
Prompt Loader
=============

Centralized prompt management for Gemini.

Responsibilities
----------------
- Load prompt templates
- Cache prompt contents
- Render dynamic prompts
- Validate prompt existence
- Reload cache
- Preload all prompts
- Support dependency injection for testing

Author:
UMKM Copilot AI
"""

from __future__ import annotations

from functools import lru_cache
from pathlib import Path
from string import Formatter

from app.utils.logger import logger


class PromptLoader:
    """
    Prompt template loader.

    Example
    -------
    loader = PromptLoader()

    prompt = loader.load("marketing")

    prompt = loader.render(
        "marketing",
        product_name="Keripik Pisang",
        price="15000"
    )
    """

    def __init__(self, prompt_dir: str | Path | None = None):

        if prompt_dir is None:
            self.prompt_dir = (
                Path(__file__).resolve().parents[2]
                / "prompts"
            )
        else:
            self.prompt_dir = Path(prompt_dir)

        if not self.prompt_dir.exists():
            raise FileNotFoundError(
                f"Prompt directory not found:\n{self.prompt_dir}"
            )

        logger.success(
            f"Prompt directory loaded: {self.prompt_dir}"
        )

    # =====================================================
    # Exists
    # =====================================================

    def exists(self, name: str) -> bool:
        """
        Check whether prompt exists.
        """

        return (
            self.prompt_dir / f"{name}.md"
        ).exists()

    # =====================================================
    # Load Prompt
    # =====================================================

    @lru_cache(maxsize=64)
    def load(self, name: str) -> str:
        """
        Load prompt from markdown file.

        Example
        -------
        loader.load("marketing")
        """

        file_path = self.prompt_dir / f"{name}.md"

        if not file_path.exists():
            raise FileNotFoundError(
                f"Prompt '{name}' not found."
            )

        prompt = file_path.read_text(
            encoding="utf-8"
        ).strip()

        if not prompt:
            raise ValueError(
                f"Prompt '{name}' is empty."
            )

        logger.debug(
            f"Prompt loaded: {file_path.name}"
        )

        return prompt

    # =====================================================
    # Render Prompt
    # =====================================================

    def render(
        self,
        name: str,
        **kwargs,
    ) -> str:
        """
        Render prompt using placeholders.

        Example
        -------
        loader.render(
            "marketing",
            product_name="Keripik Pisang",
            price="15000"
        )
        """

        prompt = self.load(name)

        formatter = Formatter()

        required = {
            field_name
            for _, field_name, _, _
            in formatter.parse(prompt)
            if field_name
        }

        missing = required - kwargs.keys()

        if missing:

            raise ValueError(
                "Missing prompt variables: "
                + ", ".join(sorted(missing))
            )

        return prompt.format(**kwargs)

    # =====================================================
    # List Prompts
    # =====================================================

    def available(self) -> list[str]:
        """
        Return available prompt names.
        """

        return sorted(
            file.stem
            for file in self.prompt_dir.glob("*.md")
        )

    # =====================================================
    # Load All
    # =====================================================

    def load_all(self) -> dict[str, str]:
        """
        Load all prompts.

        Useful for debugging.
        """

        return {
            name: self.load(name)
            for name in self.available()
        }

    # =====================================================
    # Preload
    # =====================================================

    def preload(self) -> None:
        """
        Preload all prompts into cache.
        """

        count = 0

        for name in self.available():
            self.load(name)
            count += 1

        logger.success(
            f"{count} prompt(s) preloaded."
        )

    # =====================================================
    # Reload
    # =====================================================

    def reload(self) -> None:
        """
        Clear prompt cache.
        """

        self.load.cache_clear()

        logger.success(
            "Prompt cache cleared."
        )


# ==========================================================
# Singleton
# ==========================================================

_loader: PromptLoader | None = None


def get_prompt_loader() -> PromptLoader:
    """
    Singleton PromptLoader.
    """

    global _loader

    if _loader is None:
        _loader = PromptLoader()

    return _loader