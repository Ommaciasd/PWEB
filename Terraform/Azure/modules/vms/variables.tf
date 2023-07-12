variable "vms"         { type = string }
variable "private"     { type = string }
variable "group"       { type = string }
variable "environment" { type = string }

locals {
  location    = "eastus"
  group       = var.group
  assetname   = "nanaykuna"
  private     = var.private
  environment = var.environment
  vms         = format("vm-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.vms)
}
