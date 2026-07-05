"""
Gemini Client
=============

Centralized wrapper for Google Gemini API.

Responsibilities
----------------
- Initialize Gemini client
- Validate configuration
- Test API connection
- Generate plain text
- Generate JSON responses
- Centralize all Gemini interactions

Author:
UMKM Copilot AI
"""

from __future__ import annotations

import json
from typing import Any

from google import genai
from google.genai import types

from app.config.settings import get_settings
from app.utils.logger import logger

settings = get_settings()


class GeminiClient:
    """
    Wrapper around Google Gemini API.
    """

    def __init__(self) -> None:
        # --------------------------------------------------
        # Validate configuration
        # --------------------------------------------------
        settings.validate_gemini()

        logger.info("Connecting to Gemini...")

        self.client = genai.Client(
            api_key=settings.gemini_key()
        )

        self.model = settings.GEMINI_MODEL

        logger.success(
            f"Gemini client initialized ({self.model})"
        )

    # ======================================================
    # Plain Text Generation
    # ======================================================

    def generate(
        self,
        prompt: str,
        temperature: float = 0.3,
    ) -> str:
        """
        Generate plain text response.
        """

        try:

            response = self.client.models.generate_content(
                model=self.model,
                contents=prompt,
                config=types.GenerateContentConfig(
                    temperature=temperature,
                ),
            )

            if not response.text:
                raise RuntimeError(
                    "Gemini returned an empty response."
                )

            return response.text.strip()

        except Exception as exc:

            logger.exception(exc)
            raise

    # ======================================================
    # JSON Generation
    # ======================================================

    def generate_json(
        self,
        prompt: str,
        temperature: float = 0.2,
    ) -> dict[str, Any]:
        """
        Generate structured JSON response.
        """

        full_prompt = f"""
Return ONLY valid JSON.

Do not include markdown.

Do not include explanation.

{prompt}
"""

        try:

            response = self.client.models.generate_content(
                model=self.model,
                contents=full_prompt,
                config=types.GenerateContentConfig(
                    temperature=temperature,
                    response_mime_type="application/json",
                ),
            )

            if not response.text:
                raise RuntimeError(
                    "Gemini returned empty JSON."
                )

            return json.loads(response.text)

        except json.JSONDecodeError:

            logger.error("Invalid JSON returned by Gemini.")
            raise

        except Exception as exc:

            logger.exception(exc)
            raise

    # ======================================================
    # Health Check
    # ======================================================

    def test_connection(self) -> bool:
        """
        Verify Gemini connectivity.
        """

        try:

            response = self.generate(
                "Reply with exactly: OK"
            )

            if response.strip().upper() == "OK":

                logger.success(
                    "Gemini connection successful."
                )

                return True

            logger.warning(
                f"Unexpected Gemini response: {response}"
            )

            return False

        except Exception as exc:

            logger.exception(exc)

            return False


# ==========================================================
# Singleton
# ==========================================================

_client: GeminiClient | None = None


def get_gemini() -> GeminiClient:
    """
    Return singleton Gemini client.
    """

    global _client

    if _client is None:
        _client = GeminiClient()

    return _client