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
  client_id = var.client_id
  client_secret = var.client_secret
}