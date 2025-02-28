
resource "vault_ldap_auth_backend" "ldap" {
    path            = "ldap"
    userdn          = "cn=users,cn=accounts,${var.ldap_all_dc}"
    groupdn         = "cn=users,cn=accounts,${var.ldap_all_dc}"
    binddn          = "uid=vault,cn=sysaccounts,cn=etc,${var.ldap_all_dc}"
    groupfilter     = "(&(objectClass=person)(uid={{.Username}}))"
    bindpass        = "${var.ldap_bind_pass}"
    url             = "ldaps://identity.openlab.net"
    userattr        = "uid"
    groupattr       = "memberOf"
    discoverdn      = true
    insecure_tls    = false
    starttls        = false
    tls_min_version = "tls12"
    tls_max_version = "tls13"
}

resource "vault_ldap_auth_backend_group" "group" {
    groupname = "secops"
    policies  = [vault_policy.admin.name]
    backend   = vault_ldap_auth_backend.ldap.path
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