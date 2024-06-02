terraform {
  backend "s3" {
    key = "Lab02/tfstate/infra/seal.tfstate"
  }
}

provider "vault" {
}

module "vault" {
  source = "../module"
  domain_name = var.domain_name
  ldap_bind_pass = var.ldap_bind_pass
  ldap_all_dc = var.ldap_all_dc
}

output "autounseal_token" {
  value = module.vault.autounseal_token
  sensitive = true
}

output "deploy_role_id" {
  value = module.vault.deploy_role_id
  sensitive = true
}

output "deploy_secret_id" {
  value = module.vault.deploy_secret_id
  sensitive = true
}