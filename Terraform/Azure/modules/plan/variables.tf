variable "web"         { type = string }
variable "group"       { type = string }
variable "function"    { type = string }
variable "environment" { type = string }

locals {
  location    = "eastus"
  group       = var.group
  assetname   = "nanaykuna"
  created     = "terraform"
  environment = var.environment
  sku         = "B1"    # Service plan's sku.
  os          = "Linux" # Service plan's os_type.
  web         = format("sp-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.web)
  function    = format("sp-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)
}

