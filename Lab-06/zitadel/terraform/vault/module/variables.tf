
variable "domain_name" {
    type = string
}

variable "client_id" {
    type        = string
    sensitive   = true
}

variable "client_secret" {
    type        = string
    sensitive   = true
}
