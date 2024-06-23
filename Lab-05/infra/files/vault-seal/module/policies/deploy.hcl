path "deploy/data/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "deploy/metadata/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}