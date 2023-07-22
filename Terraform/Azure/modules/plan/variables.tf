variable "group"       { type = string }
variable "environment" { type = string }
variable "app"         { type = list(string) }

locals {
  location    = "eastus"
  group       = var.group
  assetname   = "nanaykuna"
  created     = "terraform"
  environment = var.environment
  sku         = "B1"    # Service plan's sku.
  os          = "Linux" # Service plan's os_type.
  name        = format("sp-%s-%s-tf-%s", local.assetname, var.environment, local.location)
}
