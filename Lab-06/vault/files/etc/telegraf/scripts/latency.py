import subprocess
import json

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

def is_number(n):
    try:
        float(n)
    except ValueError:
        return False
    return True

def ping_latency(host_name):
    command = f"ping -c 1 {host_name} | tail -n 1 | cut -d ' ' -f 4 | cut -d '/' -f 1"
    latency = subprocess.check_output(command, shell=True).decode('utf-8').strip()
    if is_number(latency):
        return latency
    else:
        return -10
    
@result_print
def run_ping_latency_tests():
    ping_latency_results = {}

    cluster_name = subprocess.check_output(conf.CLUSTER_NAME_CMD, shell=True).decode('utf-8').strip()
    nodes_list = conf.CLUSTERS[cluster_name]

    for node in nodes_list:
        latency = ping_latency(node)
        ping_latency_results[node] = float(latency)

    ping_latency_results["env"] = "DEV"

    return ping_latency_results

if __name__ == "__main__":
    ha_mode = subprocess.check_output(conf.HA_MODE_CMD, shell=True).decode('utf-8').strip()
    if ha_mode == "active":
        result = run_ping_latency_tests()
        print(json.dumps(result))
    