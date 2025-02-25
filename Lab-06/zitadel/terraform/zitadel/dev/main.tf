terraform {
  backend "s3" {
    key = "Lab06/tfstate/zitadel/zitadel.tfstate"
  }
  required_providers {
    zitadel = {
      source  = "zitadel/zitadel"
      version = "2.0.2"
    }
  }
}

provider "zitadel" {
  domain           = "zitadel.openlab.net"
  insecure         = "false"
  port             = "443"
  jwt_profile_file = var.jwt_profile_file
}

module "zitadel" {
  source = "../module"
}

output "vault_client_id" {
  value = module.zitadel.vault_client_id
  sensitive = true
}

output "vault_client_secret" {
  value = module.zitadel.vault_client_secret
  sensitive = true
}
