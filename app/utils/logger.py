"""
Global Logger Configuration

This module configures Loguru for the entire application.

Features
--------
- Console logging
- File logging
- Automatic log rotation
- Automatic log retention
- Debug/Production mode
- UTF-8 support
"""

from pathlib import Path
import sys

from loguru import logger

from app.config.settings import get_settings

settings = get_settings()

# ==========================================================
# Ensure Log Directory Exists
# ==========================================================

LOG_DIR = Path("logs")
LOG_DIR.mkdir(parents=True, exist_ok=True)

LOG_FILE = LOG_DIR / "app.log"

# ==========================================================
# Remove Default Logger
# ==========================================================

logger.remove()

# ==========================================================
# Console Logger
# ==========================================================

logger.add(
    sys.stdout,
    level=settings.LOG_LEVEL,
    colorize=True,
    enqueue=True,
    backtrace=settings.APP_DEBUG,
    diagnose=settings.APP_DEBUG,
    format=(
        "<green>{time:YYYY-MM-DD HH:mm:ss}</green> | "
        "<level>{level:<8}</level> | "
        "<cyan>{name}</cyan>:<cyan>{function}</cyan>:<cyan>{line}</cyan> | "
        "<level>{message}</level>"
    ),
)

# ==========================================================
# File Logger
# ==========================================================

logger.add(
    LOG_FILE,
    level=settings.LOG_LEVEL,
    rotation="10 MB",
    retention="14 days",
    compression="zip",
    encoding="utf-8",
    enqueue=True,
    backtrace=settings.APP_DEBUG,
    diagnose=settings.APP_DEBUG,
    format=(
        "{time:YYYY-MM-DD HH:mm:ss} | "
        "{level:<8} | "
        "{name}:{function}:{line} | "
        "{message}"
    ),
)

# ==========================================================
# Startup Information
# ==========================================================

logger.info("=" * 60)
logger.info(f"{settings.APP_NAME} starting...")
logger.info(f"Environment : {settings.APP_ENV}")
logger.info(f"Debug Mode  : {settings.APP_DEBUG}")
logger.info(f"Log Level   : {settings.LOG_LEVEL}")
logger.info("=" * 60)


# ==========================================================
# Helper Functions
# ==========================================================


def log_success(message: str) -> None:
    """
    Log successful operation.
    """
    logger.success(message)


def log_info(message: str) -> None:
    """
    Log informational message.
    """
    logger.info(message)


def log_warning(message: str) -> None:
    """
    Log warning message.
    """
    logger.warning(message)


def log_error(message: str) -> None:
    """
    Log error message.
    """
    logger.error(message)


def log_exception(exception: Exception) -> None:
    """
    Log exception with traceback.
    """
    logger.exception(exception)


# ==========================================================
# Export
# ==========================================================

__all__ = [
    "logger",
    "log_success",
    "log_info",
    "log_warning",
    "log_error",
    "log_exception",
]
