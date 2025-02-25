resource "vault_jwt_auth_backend" "oidc" {
    description         = "Demonstration of the Terraform JWT auth backend"
    path                = "oidc"
    type                = "oidc"
    oidc_discovery_url  = "https://zitadel.openlab.net/"
    oidc_client_id      = "${var.client_id}"
    oidc_client_secret  = "${var.client_secret}"
    default_role = "admin"
}

resource "vault_jwt_auth_backend_role" "admin" {
  backend         = vault_jwt_auth_backend.oidc.path
  role_name       = "admin"
  token_policies  = ["default", "admin"]

  bound_claims = {
    email = "vaultops@zitadel.oplenlab.net, root@zitadel.zitadel.openlab.net"
  }
  oidc_scopes           = "email"
  user_claim            = "email"
  role_type             = "oidc"
  allowed_redirect_uris = ["https://vault.openlab.net/ui/vault/auth/oidc/oidc/callback"]
}