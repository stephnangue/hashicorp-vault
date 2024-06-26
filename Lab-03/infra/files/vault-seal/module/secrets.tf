
resource "vault_mount" "transit" {
  path                      = "transit"
  type                      = "transit"
  description               = "Use to auto unseal vault clusters"
  default_lease_ttl_seconds = 3600
  max_lease_ttl_seconds     = 86400
}

resource "vault_transit_secret_backend_key" "autounseal" {
  backend = vault_mount.transit.path
  name    = "autounseal"
}

resource "vault_token" "transit_token" {
  policies  = [vault_policy.autounseal.name]
  no_parent = true
  period    = "24h"
}

resource "vault_mount" "deploy" {
  path        = "deploy"
  type        = "kv-v2"
  description = "Store secrets used to configure Vault clusters"
}