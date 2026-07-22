"""
Global Logger Configuration
===========================

Production-safe Loguru configuration.
"""

from __future__ import annotations

import sys
from pathlib import Path

from loguru import logger

from app.config.settings import get_settings

settings = get_settings()

logger.remove()

LOG_FORMAT = "{time:YYYY-MM-DD HH:mm:ss} | {level:<8} | {name}:{function}:{line} | {message}"

logger.add(
    sys.stdout,
    level=settings.LOG_LEVEL,
    colorize=settings.is_development,
    enqueue=True,
    backtrace=settings.APP_DEBUG,
    diagnose=settings.APP_DEBUG,
    format=LOG_FORMAT,
)

if settings.LOG_TO_FILE:
    log_dir = Path("logs")
    log_dir.mkdir(parents=True, exist_ok=True)
    logger.add(
        log_dir / "app.log",
        level=settings.LOG_LEVEL,
        rotation="10 MB",
        retention="14 days",
        compression="zip",
        encoding="utf-8",
        enqueue=True,
        backtrace=settings.APP_DEBUG,
        diagnose=settings.APP_DEBUG,
        format=LOG_FORMAT,
    )

logger.info("=" * 60)
logger.info("{} starting...", settings.APP_NAME)
logger.info("Environment : {}", settings.APP_ENV)
logger.info("Debug Mode  : {}", settings.APP_DEBUG)
logger.info("Log Level   : {}", settings.LOG_LEVEL)
logger.info("=" * 60)


def redact_secret(value: str, *, visible_prefix: int = 4) -> str:
    """Redact secret values for logging."""

    if not value:
        return ""

    if len(value) <= visible_prefix:
        return "***"

    return f"{value[:visible_prefix]}***"


def log_success(message: str) -> None:
    """Log successful operation."""

    logger.success(message)


def log_info(message: str) -> None:
    """Log informational message."""

    logger.info(message)


def log_warning(message: str) -> None:
    """Log warning message."""

    logger.warning(message)


def log_error(message: str) -> None:
    """Log error message."""

    logger.error(message)


def log_exception(exception: Exception) -> None:
    """Log exception with traceback."""

    logger.exception(exception)


__all__ = [
    "logger",
    "log_success",
    "log_info",
    "log_warning",
    "log_error",
    "log_exception",
    "redact_secret",
]
