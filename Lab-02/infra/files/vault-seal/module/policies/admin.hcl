path "*" {
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

path "sys/auth" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/auth/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/leases" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/leases/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/leases/lookup" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/leases/lookup-accessor" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/auth/token/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/storage/raft/*" {
    capabilities = ["read", "list"]
}

path "sys/audit/*" {
    capabilities = ["read", "list", "sudo"]
}

path "sys/audit" {
    capabilities = ["read", "list", "sudo"]
}

path "auth/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/generate-root/attempt" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/licence" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "sys/licence/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/key-status" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/init" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/leader" {
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

path "sys/namespaces/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/namespaces" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/internal/counters/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "identity/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/replication/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/quotas/rate-limit/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/quotas/rate-limit" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/quotas/lease-count/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/quotas/lease-count" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/quotas/config" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/config/state/sanitized" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/step-down" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/monitor" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/host-info" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "identity/entity/id" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/audit-hash/file" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/capabilities" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "sys/raw/*" {
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}