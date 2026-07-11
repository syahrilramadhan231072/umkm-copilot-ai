"""
Gemini Client
=============

Gemini provider client for UMKM Copilot AI.

Author:
    UMKM Copilot AI
"""

from __future__ import annotations

import os
from typing import Any, Protocol

from app.utils.logger import logger


class GeminiModelProtocol(Protocol):
    """
    Protocol for Gemini-compatible model objects.

    The protocol allows tests to inject fake models without making network
    requests or requiring a real Gemini API key.
    """

    def generate_content(
        self,
        contents: str | list[Any],
        **kwargs: Any,
    ) -> Any:
        """
        Generate content from prompt.

        Args:
            contents: Prompt content.
            **kwargs: Provider-specific generation arguments.

        Returns:
            Provider response object.
        """


class GeminiClient:
    """
    Client wrapper for Gemini text generation.

    GeminiClient is the only component allowed to call the Gemini provider
    directly. It does not load prompts, build prompts, access databases, call
    repositories, call services, or orchestrate workflows.
    """

    DEFAULT_MODEL_NAME = "gemini-1.5-flash"

    def __init__(
        self,
        api_key: str | None = None,
        model_name: str = DEFAULT_MODEL_NAME,
        model: GeminiModelProtocol | None = None,
        generation_config: dict[str, Any] | None = None,
        safety_settings: list[dict[str, Any]] | None = None,
    ) -> None:
        """
        Initialize Gemini client.

        Args:
            api_key: Gemini API key. If omitted, GEMINI_API_KEY or
                GOOGLE_API_KEY is read from environment when a real model is
                required.
            model_name: Gemini model name.
            model: Optional injected model used for tests or custom transport.
            generation_config: Optional generation configuration.
            safety_settings: Optional safety settings.
        """

        self._logger = logger
        self._model_name = self._validate_model_name(model_name)
        self._generation_config = generation_config or {}
        self._safety_settings = safety_settings
        self._model = model

        if self._model is None:
            resolved_api_key = (
                api_key or os.getenv("GEMINI_API_KEY") or os.getenv("GOOGLE_API_KEY")
            )
            self._model = self._create_real_model(resolved_api_key)

    @property
    def model_name(self) -> str:
        """
        Return configured model name.

        Returns:
            Model name.
        """

        return self._model_name

    def generate_text(
        self,
        prompt: str,
        *,
        temperature: float | None = None,
        max_output_tokens: int | None = None,
    ) -> dict[str, Any]:
        """
        Generate text from prompt.

        Args:
            prompt: Final prompt text.
            temperature: Optional temperature override.
            max_output_tokens: Optional maximum output token override.

        Returns:
            Gemini response dictionary.
        """

        try:
            self._validate_prompt(prompt)
            generation_config = dict(self._generation_config)

            if temperature is not None:
                generation_config["temperature"] = temperature

            if max_output_tokens is not None:
                generation_config["max_output_tokens"] = max_output_tokens

            kwargs: dict[str, Any] = {}

            if generation_config:
                kwargs["generation_config"] = generation_config

            if self._safety_settings is not None:
                kwargs["safety_settings"] = self._safety_settings

            self._logger.info(
                "Generating Gemini response with model=%s.",
                self._model_name,
            )

            response = self._model.generate_content(prompt, **kwargs)
            text = self._extract_text(response)

            return {
                "success": True,
                "provider": "gemini",
                "model": self._model_name,
                "text": text,
                "raw": self._safe_raw_response(response),
                "error": None,
            }

        except Exception as exc:
            return self._error_response(exc)

    def generate(
        self,
        prompt: str,
        *,
        temperature: float | None = None,
        max_output_tokens: int | None = None,
    ) -> dict[str, Any]:
        """
        Generate text from prompt.

        Args:
            prompt: Final prompt text.
            temperature: Optional temperature override.
            max_output_tokens: Optional maximum output token override.

        Returns:
            Gemini response dictionary.
        """

        return self.generate_text(
            prompt,
            temperature=temperature,
            max_output_tokens=max_output_tokens,
        )

    def _create_real_model(self, api_key: str | None) -> GeminiModelProtocol:
        """
        Create real Gemini model from SDK.

        Args:
            api_key: Gemini API key.

        Returns:
            Gemini-compatible model.

        Raises:
            RuntimeError: If API key or SDK is unavailable.
        """

        if api_key is None or not api_key.strip():
            raise RuntimeError("Gemini API key is required when no model is injected.")

        try:
            import google.generativeai as genai
        except ImportError as exc:
            raise RuntimeError(
                "google-generativeai package is required for real Gemini calls."
            ) from exc

        genai.configure(api_key=api_key)

        return genai.GenerativeModel(self._model_name)

    def _extract_text(self, response: Any) -> str:
        """
        Extract text from provider response.

        Args:
            response: Provider response.

        Returns:
            Extracted text.

        Raises:
            RuntimeError: If text cannot be extracted.
        """

        text = getattr(response, "text", None)

        if isinstance(text, str):
            return text.strip()

        if isinstance(response, str):
            return response.strip()

        if isinstance(response, dict):
            candidate_text = response.get("text")
            if isinstance(candidate_text, str):
                return candidate_text.strip()

        raise RuntimeError("Gemini response text is unavailable.")

    def _safe_raw_response(self, response: Any) -> dict[str, Any]:
        """
        Build safe raw response metadata.

        Args:
            response: Provider response.

        Returns:
            Safe response metadata.
        """

        if isinstance(response, dict):
            return {
                key: value
                for key, value in response.items()
                if key not in {"api_key", "credential", "credentials"}
            }

        return {
            "response_type": response.__class__.__name__,
        }

    def _error_response(self, error: Exception) -> dict[str, Any]:
        """
        Build error response.

        Args:
            error: Error raised during generation.

        Returns:
            Gemini error response.
        """

        self._logger.exception(
            "Gemini generation failed with model=%s.",
            self._model_name,
        )

        return {
            "success": False,
            "provider": "gemini",
            "model": self._model_name,
            "text": "",
            "raw": None,
            "error": {
                "type": error.__class__.__name__,
                "message": str(error),
            },
        }

    def _validate_prompt(self, prompt: str) -> None:
        """
        Validate prompt.

        Args:
            prompt: Prompt text.

        Raises:
            ValueError: If prompt is empty.
        """

        if not isinstance(prompt, str) or not prompt.strip():
            raise ValueError("prompt is required.")

    def _validate_model_name(self, model_name: str) -> str:
        """
        Validate model name.

        Args:
            model_name: Model name.

        Returns:
            Stripped model name.
        """

        if not isinstance(model_name, str) or not model_name.strip():
            raise ValueError("model_name is required.")

        return model_name.strip()
