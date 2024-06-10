
resource "vault_policy" "configurator" {
  name   = "configurator"
  policy = file("${path.module}/policies/configurator.hcl")
}