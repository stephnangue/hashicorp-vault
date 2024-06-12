terraform {
   required_providers {
      grafana = {
         source  = "grafana/grafana"
         version = ">= 2.9.0"
      }
   }
  backend "s3" {
    key = "Lab03/tfstate/grafana/state.tfstate"
  }
}

provider "grafana" {
   alias = "openlab"
}

resource "grafana_folder" "vault" {
  provider = grafana.openlab

  title = "Vault"
}

resource "grafana_dashboard" "vault" {
  provider = grafana.openlab

  for_each    = fileset("${path.module}/dashboards", "*.json")
  config_json = file("${path.module}/dashboards/${each.key}")
  folder      = grafana_folder.vault.id
}
