variable "dns" {
  type = list(object({
    name      = string
    host_name = string
  }))
}

variable "group"       { type = string }
variable "private"     { type = string }
variable "environment" { type = string }

variable "dns_zone_name" {
  type        = string
  default     = null
  description = "Name of the DNS zone."
}

variable "dns_ttl" {
  type        = number
  default     = 3600
  description = "Time To Live (TTL) of the DNS record (in seconds)."
}

variable "create_dns_resource" {
  description = "Flag to determine if DNS resource should be created."
  type        = bool
  default     = false
}

locals {
  ttl         = "300"
  test        = "test"
  ttl3        = "3600"
  ttl2        = "172800"
  group       = var.group
  private2    = "private"
  private     = var.private
  created     = "terraform"
  environment = var.environment
  email       = "azuredns-hostmaster.microsoft.com"
  value       = "BE59ABCD5CA8C90D1A3AA0D6B37FCA7854E9A5AC000451FD8B8221B6B4C69B5D"
}
