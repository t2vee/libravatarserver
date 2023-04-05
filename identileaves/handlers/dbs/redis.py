import os
from redis import asyncio as aioredis
from identileaves.utils import Logger
from os import environ as env
from dotenv import load_dotenv

load_dotenv(os.path.join(os.path.dirname(__file__), ".env"))
log = Logger()


class RedisHandler:
    def __init__(self):
        self.redis_connection_string = env.get("REDIS_CONNECT")

    def __call__(self, *args, **kwargs):
        try:
            self.redis = await aioredis.from_url(self.redis_connection_string)
        except:
            log.fail("Cant connect to redis database")

    def set_key(self, KeyName, KeyValue):
        try:
            await self.redis.set(KeyName, KeyValue)
        except:
            log.warn("Failed to set redis key")
            pass

    def get_key(self, KeyName):
        try:
            await self.redis.get(KeyName)
        except:
            log.warn("Failed to get redis key")
            pass
