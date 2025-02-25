terraform {
  required_providers {
    zitadel = {
      source  = "zitadel/zitadel"
      version = "2.0.2"
    }
  }
}

resource "zitadel_project" "vault" {
  name                     = "vaultproject"
  org_id                   = zitadel_org.default.id
  project_role_assertion   = true
  project_role_check       = true
  has_project_check        = true
  private_labeling_setting = "PRIVATE_LABELING_SETTING_ENFORCE_PROJECT_RESOURCE_OWNER_POLICY"
}

resource "zitadel_human_user" "vaultops" {
  org_id             = zitadel_org.default.id
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


resource "zitadel_org" "default" {
  name = "openlab"
}

