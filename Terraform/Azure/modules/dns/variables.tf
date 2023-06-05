locals {
  ttl         = "300"
  test        = "test"
  ttl3        = "3600"
  ttl2        = "172800"
  dns         = var.dns
  dns2        = var.dns2
  dns3        = var.dns3
  dns4        = var.dns4
  group       = var.group
  private2    = "private"
  private     = var.private
  created     = "terraform"
  environment = var.environment
  value       = "BE59ABCD5CA8C90D1A3AA0D6B37FCA7854E9A5AC000451FD8B8221B6B4C69B5D"
}

variable "environment" {
  type = string
}

variable "group" {
  type        = string
  description = "The resour group's name"
}

variable "dns" {
  type        = string
  description = "The base name for every resource"
}

variable "dns2" {
  type        = string
  description = "The base name for every resource"
}

variable "dns3" {
  type        = string
  description = "The base name for every resource"
}

variable "dns4" {
  type        = string
  description = "The base name for every resource"
}

variable "private" {
  type        = string
  description = "The base name for every resource"
}

variable "dns_ttl" {
  type        = number
  default     = 3600
  description = "Time To Live (TTL) of the DNS record (in seconds)."
}

variable "dns_records" {
  type        = list(string)
  default     = ["1.2.3.4", "1.2.3.5"]
  description = "List of IPv4 addresses."
}

variable "dns_zone_name" {
  type        = string
  default     = null
  description = "Name of the DNS zone."
}

#-------------------------------------------------------------

locals {
  # refix for naming convention across all resources
  resource_prefix = "az104-04-"

  # ip addresses for x2 deployed subnets, iterated over with for_each block in network.tf
  subnet_ips = ["10.40.0.0/24", "10.40.1.0/24"]

  common_tags = {
    env   = "training"
    lab   = "az-104-lab-4"
    owner = "zimcanit"
  }
}

#-------------------------------------------------------------
