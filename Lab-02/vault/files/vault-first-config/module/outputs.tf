
output "configurator_role_id" {
  value = vault_approle_auth_backend_role.configurator.role_id
}

output "configurator_secret_id" {
  value = vault_approle_auth_backend_role_secret_id.configurator.secret_id
}