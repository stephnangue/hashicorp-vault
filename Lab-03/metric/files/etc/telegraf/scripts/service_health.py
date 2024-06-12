import json
import sys

from spintest import spintest
from tenacity import retry, wait_random, stop_after_attempt

import conf

class TestError(Exception):
    """Exception to handle ping tests errors."""

def my_print(text):
    if conf.DEBUG:
        print(text)

def result_print(function):
    def wrapper(*args, **kwargs):
        test_pass = function(*args, **kwargs)
        if not test_pass:
            my_print(f"\n ++++ TEST KO with: {function.__name__} function ++++ \n")
            raise TestError(f"TEST KO with: {function.__name__}")
        else:
            my_print(f"\n ++++ TEST OK with: {function.__name__} function ++++ \n")
            return test_pass
    return wrapper
    
@result_print
def check_health():
    urls = [conf.VAULT_URL]
    tasks = [
        {
            "method": "GET",
            "route": "/v1/sys/health",
            "expected": {
                "code": 200,
                "expected_match": "partial",
            }
        }
    ]
    return spintest(urls, tasks)

@retry(stop=(stop_after_attempt(2)), wait=wait_random(min=1, max=3), reraise=True)
def run_all_tests():
    check_health()

if __name__ == "__main__":
    exit_with_error = False

    try:
        run_all_tests()
    except TestError as error:
        my_print(f"Tests KO : {error}")
        exit_with_error = True

    if exit_with_error:
        print(json.dumps({"result": 0, "env": "DEV", "service": "vault"}))
        sys.exit(0)
    else:
        print(json.dumps({"result": 1, "env": "DEV", "service": "vault"}))
    