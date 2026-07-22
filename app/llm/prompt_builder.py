"""
Prompt Builder
==============

Prompt builder for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

import json
import re
from collections.abc import Mapping
from string import Formatter
from typing import Any

from app.utils.logger import logger


class PromptBuilder:
    """
    Prompt builder.

    PromptBuilder renders prompt templates using explicit variables and can
    assemble structured prompt sections. It does not read files, call LLM
    providers, access databases, or orchestrate workflows.
    """

    def __init__(self) -> None:
        """Initialize prompt builder."""

        self._logger = logger

    def build_prompt(
        self,
        template: str,
        variables: Mapping[str, Any],
        *,
        normalize_whitespace: bool = True,
    ) -> str:
        """
        Build prompt from template and variables.

        Args:
            template: Prompt template text.
            variables: Template variables.
            normalize_whitespace: Whether excessive blank lines are normalized.

        Returns:
            Rendered prompt.

        Raises:
            ValueError: If template or variables are invalid.
        """

        self._validate_template(template)
        self._validate_variables(variables)

        required_variables = self.get_required_variables(template)
        missing_variables = [
            variable for variable in required_variables if variable not in variables
        ]

        if missing_variables:
            raise ValueError(
                "Missing prompt variables: " + ", ".join(sorted(missing_variables)) + "."
            )

        rendered = template.format_map(
            {key: self._stringify_value(value) for key, value in variables.items()}
        )

        if normalize_whitespace:
            rendered = self.normalize_prompt(rendered)

        return rendered

    def build_chat_prompt(
        self,
        *,
        system_instruction: str,
        business_context: Mapping[str, Any] | None = None,
        conversation_history: list[Mapping[str, Any]] | None = None,
        user_input: str,
    ) -> str:
        """
        Build standard chat prompt.

        Args:
            system_instruction: System instruction.
            business_context: Optional business context.
            conversation_history: Optional conversation history.
            user_input: User input.

        Returns:
            Final chat prompt.
        """

        self._validate_template(system_instruction)
        self._validate_template(user_input)

        sections = [
            "# System Instruction",
            system_instruction.strip(),
        ]

        if business_context is not None:
            sections.extend(
                [
                    "# Business Context",
                    self._stringify_value(business_context),
                ]
            )

        if conversation_history:
            sections.extend(
                [
                    "# Conversation History",
                    self._format_history(conversation_history),
                ]
            )

        sections.extend(
            [
                "# User Input",
                user_input.strip(),
            ]
        )

        return self.normalize_prompt("\n\n".join(sections))

    def get_required_variables(self, template: str) -> list[str]:
        """
        Get required variable names from format template.

        Args:
            template: Prompt template.

        Returns:
            Sorted variable names.
        """

        self._validate_template(template)
        variables: set[str] = set()

        for _, field_name, _, _ in Formatter().parse(template):
            if field_name:
                root_name = field_name.split(".", maxsplit=1)[0]
                root_name = root_name.split("[", maxsplit=1)[0]
                variables.add(root_name)

        return sorted(variables)

    def normalize_prompt(self, prompt: str) -> str:
        """
        Normalize prompt whitespace.

        Args:
            prompt: Prompt text.

        Returns:
            Normalized prompt text.
        """

        self._validate_template(prompt)

        normalized = prompt.strip()
        normalized = re.sub(r"\n{3,}", "\n\n", normalized)

        return normalized

    def build_prompt_payload(
        self,
        prompt: str,
        *,
        metadata: Mapping[str, Any] | None = None,
    ) -> dict[str, Any]:
        """
        Build prompt payload for GeminiClient.

        Args:
            prompt: Final prompt text.
            metadata: Optional metadata.

        Returns:
            Prompt payload.
        """

        self._validate_template(prompt)

        return {
            "prompt": prompt.strip(),
            "metadata": dict(metadata or {}),
        }

    def _format_history(
        self,
        conversation_history: list[Mapping[str, Any]],
    ) -> str:
        """
        Format conversation history.

        Args:
            conversation_history: Conversation history records.

        Returns:
            Formatted conversation history.
        """

        lines: list[str] = []

        for record in conversation_history:
            if not isinstance(record, Mapping):
                raise ValueError("conversation_history must contain mappings.")

            role = str(record.get("role", "unknown")).strip() or "unknown"
            message = str(record.get("message", "")).strip()

            if message:
                lines.append(f"{role}: {message}")

        return "\n".join(lines)

    def _stringify_value(self, value: Any) -> str:
        """
        Convert prompt variable value to string.

        Args:
            value: Value to convert.

        Returns:
            String representation.
        """

        if isinstance(value, (dict, list, tuple)):
            return json.dumps(value, ensure_ascii=False, indent=2, default=str)

        if value is None:
            return ""

        return str(value)

    def _validate_template(self, template: str) -> None:
        """
        Validate prompt template.

        Args:
            template: Template text.
        """

        if not isinstance(template, str) or not template.strip():
            raise ValueError("template is required.")

    def _validate_variables(self, variables: Mapping[str, Any]) -> None:
        """
        Validate prompt variables.

        Args:
            variables: Template variables.
        """

        if not isinstance(variables, Mapping):
            raise ValueError("variables must be a mapping.")
