terraform {
  required_providers {
    zitadel = {
      source  = "zitadel/zitadel"
      version = "2.0.2"
    }
  }
}

resource "zitadel_project" "vault" {
  name                     = "vault-project"
  org_id                   = zitadel_org.openlab.id
  project_role_assertion   = true
  project_role_check       = true
  has_project_check        = true
  private_labeling_setting = "PRIVATE_LABELING_SETTING_ENFORCE_PROJECT_RESOURCE_OWNER_POLICY"
}

resource "zitadel_human_user" "vaultops" {
  org_id             = zitadel_org.openlab.id
  user_name          = "vaultops@zitadel.openlab.net"
  first_name         = "firstname"
  last_name          = "Vault"
  nick_name          = "Operator"
  display_name       = "Vault Operator"
  preferred_language = "en"
  gender             = "GENDER_MALE"
  phone              = "+41799999999"
  is_phone_verified  = true
  email              = "vaultops@zitadel.openlab.net"
  is_email_verified  = true
  initial_password   = "VaultOps1!"
}

resource "zitadel_application_oidc" "vault" {
  project_id                   = zitadel_project.vault.id
  org_id                       = zitadel_org.openlab.id

  name                         = "vault_oidc"
  redirect_uris                = ["https://vault.openlab.net/ui/vault/auth/oidc/oidc/callback"]
  response_types               = ["OIDC_RESPONSE_TYPE_CODE"]
  grant_types                  = ["OIDC_GRANT_TYPE_AUTHORIZATION_CODE"]
  post_logout_redirect_uris    = []
  app_type                     = "OIDC_APP_TYPE_WEB"
  auth_method_type             = "OIDC_AUTH_METHOD_TYPE_BASIC"
  version                      = "OIDC_VERSION_1_0"
  clock_skew                   = "0s"
  dev_mode                     = false
  access_token_type            = "OIDC_TOKEN_TYPE_BEARER"
  access_token_role_assertion  = true
  id_token_role_assertion      = true
  id_token_userinfo_assertion  = true
  additional_origins           = []
  skip_native_app_success_page = false
}


resource zitadel_org openlab {
  name = "openlab"
  is_default = false
}

