from pydantic import BaseSettings


class _Settings(BaseSettings):
    app_name: str

    class Config:
        env_file = ".env"


Settings = _Settings()
