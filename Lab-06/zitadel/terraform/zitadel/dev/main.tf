terraform {
  backend "s3" {
    key = "Lab06/tfstate/zitadel/zitadel.tfstate"
  }

  required_providers {
    zitadel = {
      source  = "zitadel/zitadel"
      version = "1.3.0"
    }
  }
}

provider "zitadel" {
  domain           = "zitadel.openlab.net"
  insecure         = "false"
  port             = "443"
  jwt_profile_json = var.jwt_profile_json
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
