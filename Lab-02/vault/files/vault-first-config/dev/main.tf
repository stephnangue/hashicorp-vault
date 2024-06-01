terraform {
}

provider "vault" {
}

module "vault" {
  source = "../module"
}

output "configurator_role_id" {
  value = module.vault.configurator_secret_id
  sensitive = true
}

output "configurator_secret_id" {
  value = module.vault.configurator_secret_id
  sensitive = true
}