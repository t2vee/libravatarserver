from fastapi import FastAPI

from config import Settings
from identileaves.handlers.dbs.redis import RedisHandler


class Identileaves:
    def __init__(self):
        self.app = FastAPI()
        self.redis = RedisHandler
        self.config = Settings
