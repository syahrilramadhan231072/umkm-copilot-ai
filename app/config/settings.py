"""
Application Settings
====================

Centralized configuration management using Pydantic Settings.
"""

from __future__ import annotations

from functools import lru_cache
from typing import Literal

from pydantic import Field, SecretStr, computed_field
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """
    Global application configuration.

    Values are loaded from environment variables and `.env` during local
    development. Production platforms should provide the same variables through
    their secrets/environment settings.
    """

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore",
        case_sensitive=True,
    )

    # Application
    APP_NAME: str = "Go-UMKM AI"
    APP_VERSION: str = "0.1.0"
    APP_ENV: Literal["development", "staging", "production", "testing"] = "development"
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
    LOG_TO_FILE: bool = False

    # Backend deployment
    PORT: int = 8000
    CORS_ALLOWED_ORIGINS: str = "*"
    HEALTHCHECK_INTERVAL: int = 30

    # Supabase
    SUPABASE_URL: str = ""
    SUPABASE_KEY: SecretStr = Field(default=SecretStr(""))

    # Multi-LLM provider configuration
    PRIMARY_LLM_PROVIDER: str = "gemini"
    LLM_PROVIDER_PRIORITY: str = "gemini,openrouter,huggingface,ollama"
    ENABLE_PROVIDER_FAILOVER: bool = True
    MAX_PROVIDER_RETRIES: int = 2
    RETRY_BACKOFF_SECONDS: float = 0.5

    GEMINI_API_KEY: SecretStr = Field(default=SecretStr(""))
    GEMINI_MODEL: str = "gemini-2.0-flash-lite"
    GEMINI_MODEL_NAME: str = "gemini-2.0-flash-lite"

    OPENROUTER_API_KEY: SecretStr = Field(default=SecretStr(""))
    OPENROUTER_MODEL: str = "google/gemini-2.0-flash-exp:free"

    HUGGINGFACE_API_KEY: SecretStr = Field(default=SecretStr(""))
    HUGGINGFACE_MODEL: str = "HuggingFaceH4/zephyr-7b-beta"

    OPENAI_API_KEY: SecretStr = Field(default=SecretStr(""))

    OLLAMA_BASE_URL: str = "http://localhost:11434"
    OLLAMA_MODEL: str = "llama3.2"

    # Streamlit frontend
    STREAMLIT_SERVER_PORT: int = 8501
    GO_UMKM_API_BASE_URL: str = "http://localhost:8000"

    # Localization
    DEFAULT_LANGUAGE: str = "id"
    TIMEZONE: str = "Asia/Jakarta"
    CURRENCY: str = "IDR"

    # Feature flags
    ENABLE_MARKETING: bool = True
    ENABLE_INSIGHT: bool = True
    ENABLE_EXPORT: bool = False
    ENABLE_ANALYTICS: bool = True
    ENABLE_AI_ASSISTANT: bool = True

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

    @computed_field
    @property
    def supabase_key_is_configured(self) -> bool:
        """Return whether Supabase key is configured."""

        return bool(self.SUPABASE_KEY.get_secret_value().strip())

    def gemini_key(self) -> str:
        """Return Gemini API key."""

        key = self.GEMINI_API_KEY.get_secret_value()
        if not key.strip():
            raise RuntimeError("GEMINI_API_KEY is not configured.")
        return key

    def supabase_key(self) -> str:
        """Return Supabase API key."""

        key = self.SUPABASE_KEY.get_secret_value()
        if not key.strip():
            raise RuntimeError("SUPABASE_KEY is not configured.")
        return key

    def validate_supabase(self) -> None:
        """Validate Supabase configuration."""

        if not self.SUPABASE_URL.strip():
            raise RuntimeError("SUPABASE_URL is missing.")
        self.supabase_key()

    def validate_gemini(self) -> None:
        """Validate Gemini configuration."""

        self.gemini_key()


@lru_cache(maxsize=1)
def get_settings() -> Settings:
    """Return singleton Settings instance."""

    return Settings()


settings = get_settings()
