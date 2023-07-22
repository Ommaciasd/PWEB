variable "vm"          { type = string }
variable "private"     { type = any }
variable "group"       { type = string }
variable "environment" { type = string }

locals {
  location    = "eastus"
  group       = var.group
  assetname   = "nanaykuna"
  private     = var.private
  environment = var.environment
  vm          = format("vm-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.vm)
}
