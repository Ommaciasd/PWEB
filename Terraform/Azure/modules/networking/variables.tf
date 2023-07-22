variable "apps"        { type = string }
variable "group"       { type = string }
variable "network"     { type = string }
variable "environment" { type = string }

variable "subnet" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
}

variable "gateway" {
  type = list(object({
    name            = string
    address_prefix  = string
  }))
}

locals {
  location    = "eastus"
  delegation  = "delegation"
  group       = var.group
  network     = var.network
  created     = "terraform"
  assetname   = "nanaykuna"
  environment = var.environment
  microsoft   = "Microsoft.Web/serverFarms"
  actions     = "Microsoft.Network/virtualNetworks/subnets/action"
  name        = format("sn-%s-%s-tf-%s", local.assetname, var.environment, local.location)
  apps        = format("vn-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.apps)
}
