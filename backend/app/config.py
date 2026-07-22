"""
Centralized configuration. Everything is read from environment variables
(via a local .env file in development, or Render's environment settings
in production) so no secrets ever live in source control.
"""
from functools import lru_cache
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_file=".env", env_file_encoding="utf-8", extra="ignore")

    # Groq / AI Health Assistant
    groq_api_key: str = ""
    groq_model: str = "llama-3.3-70b-versatile"

    # Firebase
    firebase_credentials_json: str = ""
    firebase_credentials_path: str = ""

    # Google Play Billing
    google_play_credentials_json: str = ""
    google_play_credentials_path: str = ""
    google_play_package_name: str = ""
    google_play_subscription_ids: str = ""

    # App
    environment: str = "development"
    allowed_origins: str = "*"
    ai_chat_rate_limit_per_minute: int = 10

    @property
    def subscription_id_list(self) -> list[str]:
        return [s.strip() for s in self.google_play_subscription_ids.split(",") if s.strip()]

    @property
    def allowed_origin_list(self) -> list[str]:
        if self.allowed_origins == "*":
            return ["*"]
        return [o.strip() for o in self.allowed_origins.split(",") if o.strip()]


@lru_cache
def get_settings() -> Settings:
    return Settings()
