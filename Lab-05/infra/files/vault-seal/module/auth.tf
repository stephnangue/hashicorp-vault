
resource "vault_ldap_auth_backend" "ldap" {
    path            = "ldap"
    userdn          = "cn=users,cn=accounts,${var.ldap_all_dc}"
    groupdn         = "cn=users,cn=accounts,${var.ldap_all_dc}"
    binddn          = "uid=vault,cn=sysaccounts,cn=etc,${var.ldap_all_dc}"
    groupfilter     = "(&(objectClass=person)(uid={{.Username}}))"
    bindpass        = "${var.ldap_bind_pass}"
    url             = "ldaps://identity.${var.domain_name}"
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
    policies  = ["default", vault_policy.admin.name]
    backend   = vault_ldap_auth_backend.ldap.path
}

resource "vault_auth_backend" "approle" {
  type = "approle"
}

resource "vault_approle_auth_backend_role" "deploy" {
  backend        = vault_auth_backend.approle.path
  role_name      = "deploy"
  token_policies = ["default", vault_policy.deploy.name]
}

resource "vault_approle_auth_backend_role_secret_id" "deploy" {
  backend   = vault_auth_backend.approle.path
  role_name = vault_approle_auth_backend_role.deploy.role_name
}