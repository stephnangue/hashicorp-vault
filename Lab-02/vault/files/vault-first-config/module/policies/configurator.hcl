

path "sys/auth" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/auth/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "auth/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/policies/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/policies" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/policy" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/policy/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
