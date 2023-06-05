variable "environment" {
  type = string
}

variable "web" {
  type        = string
  description = "The name for every resource"
}

variable "group" {
  type        = string
  description = "The resource group's name"
}

variable "function" {
  type        = string
  description = "The name for every resource"
}

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

