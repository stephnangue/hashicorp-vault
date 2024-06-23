
output "autounseal_token" {
  value = vault_token.transit_token.client_token
}

output "deploy_role_id" {
  value = vault_approle_auth_backend_role.deploy.role_id
}

output "deploy_secret_id" {
  value = vault_approle_auth_backend_role_secret_id.deploy.secret_id
}