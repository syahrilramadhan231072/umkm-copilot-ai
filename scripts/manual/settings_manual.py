from app.config.settings import settings
from app.utils.logger import logger

print(settings.app_title)
print(settings.is_development)

logger.info("Logger OK")
