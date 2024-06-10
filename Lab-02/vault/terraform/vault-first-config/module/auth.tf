
resource "vault_auth_backend" "configurator" {
  type = "approle"
}

resource "vault_approle_auth_backend_role" "configurator" {
  backend        = vault_auth_backend.configurator.path
  role_name      = "configurator"
  token_policies = ["default", vault_policy.configurator.name]
}

resource "vault_approle_auth_backend_role_secret_id" "configurator" {
  backend   = vault_auth_backend.configurator.path
  role_name = vault_approle_auth_backend_role.configurator.role_name
}