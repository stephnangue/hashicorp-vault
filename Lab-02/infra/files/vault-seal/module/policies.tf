
resource "vault_policy" "admin" {
  name   = "admin"
  policy = file("${path.module}/policies/admin.hcl")
}

resource "vault_policy" "autounseal" {
  name   = "autounseal"
  policy = file("${path.module}/policies/autounseal.hcl")
}