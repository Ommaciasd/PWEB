variable "vm"          { type = string }
variable "apps"        { type = string }
variable "storage"     { type = string }
variable "networking"  { type = string }
variable "environment" { type = string }

locals {
  location    = "eastus"
  assetname   = "nanaykuna"
  created     = "terraform"
  environment = var.environment
  vm          = format("rg-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.vm)
  apps        = format("rg-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.apps)
  storage     = format("rg-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.storage)
  networking  = format("rg-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.networking)
}
