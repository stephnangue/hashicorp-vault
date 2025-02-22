terraform {
  backend "s3" {
    key = "Lab06/tfstate/vault/cluster.tfstate"
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