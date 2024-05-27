variable "domain_name" {
    type = string
}

variable "ldap_all_dc" {
    type = string
}

variable "ldap_bind_pass" {
    type        = string
    sensitive   = true
}