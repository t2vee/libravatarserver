import uuid
import random
import string


class _RandomIdentifier:
    def __init__(self):
        self.uuid = None
        self.join_code = None
        self.guest_usr_no = 0
        self.redis = _RedisHandler

    def gen_uuid(self):
        self.uuid = str(uuid.uuid4()).replace("'", "")
        return self.uuid

    def gen_join_code(self):
        key = "".join(random.choices(string.ascii_uppercase, k=4))
        if not self.redis.get_key(key):
            self.redis.set_key(f"join_key-{key}", self.uuid)
            return key

    def gen_rand_no4(self):
        self.guest_usr_no = random.randint(1000, 9999)
        return self.guest_usr_no

    def gen_rand_no16(self):
        self.guest_usr_no = random.randint(1000, 9999)
        return self.guest_usr_no
