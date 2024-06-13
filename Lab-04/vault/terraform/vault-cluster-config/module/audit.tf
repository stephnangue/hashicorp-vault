resource "vault_audit" "s3_device" {
  type          = "socket"
  description   = "audit logs on s3"
  local         = false
  options = {
    address     = "127.0.0.1:9800"
    socket_type = "tcp"
  }
  path          = "s3_device/"
}