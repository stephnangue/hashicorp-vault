import os

CLUSTERS = {
    'test_cluster': ['vault-n1', 'vault-n2', 'vault-n3']
}

CLUSTER_NAME_CMD = "VAULT_ADDR=http://localhost:8200 /opt/vault/bin/vault status | grep 'Cluster Name' | tr -s ' ' | cut -d ' ' -f 3"

HA_MODE_CMD = "VAULT_ADDR=http://localhost:8200 /opt/vault/bin/vault status | grep 'HA Mode' | tr -s ' ' | cut -d ' ' -f 3"

DEBUG = os.getenv('DEBUG', False)