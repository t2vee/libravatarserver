import math
import sqlite3
import hashlib
import time
import uuid
import os
from datetime import datetime


class bcolors:
    HEADER = "\033[95m"
    OKBLUE = "\033[94m"
    OKCYAN = "\033[96m"
    OKGREEN = "\033[92m"
    WARNING = "\033[93m"
    FAIL = "\033[91m"
    ENDC = "\033[0m"
    BOLD = "\033[1m"
    UNDERLINE = "\033[4m"


now = datetime.now()
dt = now.strftime("%d/%m/%Y %H:%M:%S")


class Logger:
    def __init__(self):
        pass

    @staticmethod
    def testing(message):
        print(
            f"{dt}: [MM_LOG] LOG_TYPE: "
            + f"[{bcolors.OKCYAN}TEST{bcolors.ENDC}] "
            + f"{bcolors.OKCYAN}{message}{bcolors.ENDC}"
        )

    @staticmethod
    def critical(message):
        print(
            f"{dt}: [MM_LOG] LOG_TYPE: "
            + f"[{bcolors.FAIL}CRITICAL{bcolors.ENDC}] "
            + f"{bcolors.FAIL}{message}{bcolors.ENDC}"
        )

    @staticmethod
    def warning(message):
        print(
            f"{dt}: [MM_LOG] LOG_TYPE: "
            + f"[{bcolors.WARNING}WARNING{bcolors.ENDC}] "
            + f"{bcolors.WARNING}{message}{bcolors.ENDC}"
        )

    @staticmethod
    def info(message):
        print(
            f"{dt}: [MM_LOG] LOG_TYPE: "
            + f"[{bcolors.OKGREEN}INFO{bcolors.ENDC}] "
            + f"{bcolors.OKGREEN}{message}{bcolors.ENDC}"
        )

    @staticmethod
    def success(message):
        print(
            f"{dt}: [MM_LOG] LOG_TYPE: "
            + f"[{bcolors.BOLD}{bcolors.UNDERLINE}{bcolors.OKGREEN}SUCCESS{bcolors.ENDC}] "
            + f"{bcolors.BOLD}{bcolors.UNDERLINE}{bcolors.OKGREEN}{message}{bcolors.ENDC}"
        )

    @staticmethod
    def fail(message):
        print(
            f"{dt}: [MM_LOG] LOG_TYPE: "
            + f"[{bcolors.BOLD}{bcolors.UNDERLINE}{bcolors.FAIL}FAIL{bcolors.ENDC}] "
            + f"{bcolors.BOLD}{bcolors.UNDERLINE}{bcolors.FAIL}{message}{bcolors.ENDC}"
        )

    @staticmethod
    def warn(message):
        print(
            f"{dt}: [MM_LOG] LOG_TYPE: "
            + f"[{bcolors.BOLD}{bcolors.UNDERLINE}{bcolors.WARNING}WARN{bcolors.ENDC}] "
            + f"{bcolors.BOLD}{bcolors.UNDERLINE}{bcolors.WARNING}{message}{bcolors.ENDC}"
        )

    @staticmethod
    def instruction(message):
        print(
            "LOG_LEVEL: [MM_LOG] LOG_TYPE: [INSTRUCTION] "
            + f"{bcolors.UNDERLINE}{message}{bcolors.ENDC}"
        )

    @staticmethod
    def dev(message):
        print(
            "LOG_LEVEL: [MM_LOG] LOG_TYPE: [DEVELOPMENT] "
            + f"{bcolors.BOLD}{message}{bcolors.ENDC}"
        )


def loaded():
    print("LOG:      (tools.py) - Program Utilities Loaded")
