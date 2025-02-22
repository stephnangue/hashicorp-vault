

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

path "sys/mounts" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/mounts/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "mounts" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "mounts/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/audit/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/audit" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
