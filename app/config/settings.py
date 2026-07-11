"""
Application Settings
====================

Centralized configuration management using Pydantic Settings.

Features:
- Load environment variables from .env
- Type validation
- Singleton configuration
- Feature flags
- Application metadata
- Localization settings

Author:
    UMKM Copilot AI

Python:
    >=3.11
"""

from functools import lru_cache
from typing import Literal

from pydantic import Field, SecretStr, computed_field
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """
    Global application configuration.

    Values are loaded from `.env`.
    """

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore",
        case_sensitive=True,
    )

    # ==========================================================
    # Application
    # ==========================================================

    APP_NAME: str = "UMKM Copilot AI"

    APP_VERSION: str = "0.1.0"

    APP_ENV: Literal[
        "development",
        "staging",
        "production",
    ] = "development"

    APP_DEBUG: bool = False

    LOG_LEVEL: Literal[
        "TRACE",
        "DEBUG",
        "INFO",
        "SUCCESS",
        "WARNING",
        "ERROR",
        "CRITICAL",
    ] = "INFO"

    # ==========================================================
    # Gemini
    # ==========================================================

    GEMINI_API_KEY: SecretStr = Field(default=SecretStr(""))

    GEMINI_MODEL: str = "gemini-2.5-flash"

    # ==========================================================
    # Supabase
    # ==========================================================

    SUPABASE_URL: str = ""

    SUPABASE_KEY: SecretStr = Field(default=SecretStr(""))

    # ==========================================================
    # Streamlit
    # ==========================================================

    STREAMLIT_SERVER_PORT: int = 8501

    # ==========================================================
    # Localization
    # ==========================================================

    DEFAULT_LANGUAGE: str = "id"

    TIMEZONE: str = "Asia/Jakarta"

    CURRENCY: str = "IDR"

    # ==========================================================
    # Feature Flags
    # ==========================================================

    ENABLE_MARKETING: bool = True

    ENABLE_INSIGHT: bool = True

    ENABLE_EXPORT: bool = False

    ENABLE_ANALYTICS: bool = True

    ENABLE_AI_ASSISTANT: bool = True

    # ==========================================================
    # Computed Fields
    # ==========================================================

    @computed_field
    @property
    def is_production(self) -> bool:
        """Return True if running in production."""
        return self.APP_ENV == "production"

    @computed_field
    @property
    def is_development(self) -> bool:
        """Return True if running in development."""
        return self.APP_ENV == "development"

    @computed_field
    @property
    def app_title(self) -> str:
        """Application title with version."""
        return f"{self.APP_NAME} v{self.APP_VERSION}"

    # ==========================================================
    # Helper Methods
    # ==========================================================

    def gemini_key(self) -> str:
        """
        Return Gemini API Key.

        Raises
        ------
        RuntimeError
            If API key is empty.
        """

        key = self.GEMINI_API_KEY.get_secret_value()

        if not key.strip():
            raise RuntimeError("GEMINI_API_KEY is not configured.")

        return key

    def supabase_key(self) -> str:
        """
        Return Supabase API Key.
        """

        key = self.SUPABASE_KEY.get_secret_value()

        if not key.strip():
            raise RuntimeError("SUPABASE_KEY is not configured.")

        return key

    def validate_supabase(self) -> None:
        """
        Validate Supabase configuration.
        """

        if not self.SUPABASE_URL.strip():
            raise RuntimeError("SUPABASE_URL is missing.")

        self.supabase_key()

    def validate_gemini(self) -> None:
        """
        Validate Gemini configuration.
        """

        self.gemini_key()


@lru_cache(maxsize=1)
def get_settings() -> Settings:
    """
    Return singleton Settings instance.
    """

    return Settings()


settings = get_settings()
