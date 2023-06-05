variable "group" {
  type        = string
  description = "Resource group."
}

variable "environment" {
  type = string
  description = "The environment for all resources."
}

variable "vms" {
  type = string
  description = "The environment for all resources."
}

locals {
  location    = "eastus"
  group       = var.group
  assetname   = "nanaykuna"
  environment = var.environment
  vms         = format("vm-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.vms)
}
