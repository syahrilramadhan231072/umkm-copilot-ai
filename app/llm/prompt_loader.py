"""
Prompt Loader
=============

Prompt template loader for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

from pathlib import Path

from app.utils.logger import logger


class PromptLoader:
    """
    Prompt template loader.

    PromptLoader reads prompt templates from a configured prompt directory. It
    never calls LLM providers, accesses databases, calls repositories, calls
    services, or modifies prompt files.
    """

    ALLOWED_SUFFIXES = {".md", ".txt", ".j2"}

    def __init__(self, prompt_dir: str | Path = "prompts") -> None:
        """
        Initialize prompt loader.

        Args:
            prompt_dir: Directory containing prompt template files.
        """

        self._logger = logger
        self._prompt_dir = Path(prompt_dir).resolve()

    @property
    def prompt_dir(self) -> Path:
        """
        Return configured prompt directory.

        Returns:
            Prompt directory path.
        """

        return self._prompt_dir

    def load_template(self, template_name: str) -> str:
        """
        Load prompt template text.

        Args:
            template_name: Template file name.

        Returns:
            Template content.

        Raises:
            FileNotFoundError: If template does not exist.
            ValueError: If template name is invalid.
        """

        template_path = self._resolve_template_path(template_name)

        if not template_path.exists():
            raise FileNotFoundError(f"Prompt template not found: {template_name}.")

        if not template_path.is_file():
            raise ValueError(f"Prompt template is not a file: {template_name}.")

        self._logger.info("Loading prompt template: %s.", template_name)

        return template_path.read_text(encoding="utf-8")

    def list_templates(self) -> list[str]:
        """
        List available prompt templates.

        Returns:
            Sorted template file names.
        """

        if not self._prompt_dir.exists():
            return []

        return sorted(
            str(path.relative_to(self._prompt_dir)).replace("\\", "/")
            for path in self._prompt_dir.rglob("*")
            if path.is_file() and path.suffix in self.ALLOWED_SUFFIXES
        )

    def template_exists(self, template_name: str) -> bool:
        """
        Check whether a template exists.

        Args:
            template_name: Template file name.

        Returns:
            True if template exists, otherwise False.
        """

        try:
            return self._resolve_template_path(template_name).is_file()
        except ValueError:
            return False

    def _resolve_template_path(self, template_name: str) -> Path:
        """
        Resolve template path safely.

        Args:
            template_name: Template file name.

        Returns:
            Resolved template path.

        Raises:
            ValueError: If template name is invalid or unsafe.
        """

        if not isinstance(template_name, str) or not template_name.strip():
            raise ValueError("template_name is required.")

        if "\x00" in template_name:
            raise ValueError("template_name contains invalid characters.")

        candidate = (self._prompt_dir / template_name.strip()).resolve()

        if candidate.suffix not in self.ALLOWED_SUFFIXES:
            raise ValueError(f"template suffix must be one of {sorted(self.ALLOWED_SUFFIXES)}.")

        try:
            candidate.relative_to(self._prompt_dir)
        except ValueError as exc:
            raise ValueError("template_name must stay inside prompt_dir.") from exc

        return candidate
