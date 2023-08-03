variable "vm"          { type = string }
variable "lvmss"          { type = string }
variable "private"     { type = string }
variable "set"     { type = string }
variable "group"       { type = string }
variable "environment" { type = string }

locals {
  set         = var.set
  location    = "eastus"
  group       = var.group
  assetname   = "nanaykuna"
  private     = var.private
  created     = "terraform"
  environment = var.environment
  vm          = format("vm-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.vm)
  lvmss       = format("lvmss-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.lvmss)
}
