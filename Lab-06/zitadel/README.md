/var/lib/pgsql/16/data/postgresql.conf

/etc/zitadel.env

/opt/zitadel/bin/zitadel

/etc/systemd/system/zitadel.service

the default user is root@zitadel.zitadel.openlab.net


{
    "allowed_redirect_uris": [
      "https://vault.openlab.net/ui/vault/auth/oidc/oidc/callback"
    ],
    "bound_claims": {
      "email": [
        "root@zitadel.zitadel.openlab.net"
      ]
    },
    "bound_claims_type": "string",
    "oidc_scopes": [
      "email"
    ],
    "token_policies": [
      "admin"
    ],
    "user_claim": "email"
}

resource "vault_jwt_auth_backend" "oidc" {
    description         = "Demonstration of the Terraform JWT auth backend"
    path                = "oidc"
    type                = "oidc"
    oidc_discovery_url  = "https://zitadel.openlab.net"
    oidc_client_id      = "TO_MODIFY"
    oidc_client_secret  = "TO_MODIFY"
    default_role = "admin"
}

resource "vault_jwt_auth_backend_role" "admin" {
  backend         = vault_jwt_auth_backend.oidc.path
  role_name       = "admin"
  token_policies  = ["default", "admin"]

  bound_claims = {
    email = "vaultops@zitadel.oplenlab.net, root@zitadel.zitadel.openlab.net"
  }
  oidc_scopes           = ["email"]
  user_claim            = "email"
  role_type             = "oidc"
  allowed_redirect_uris = ["https://vault.openlab.net/ui/vault/auth/oidc/oidc/callback"]
}
