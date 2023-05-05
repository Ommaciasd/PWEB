locals {
      location     = "eastus"
  assetname = "nanaykuna"
    environment = var.environment
    group = var.group
      sku     = "B1" # Service plan's sku.
        os     = "Linux" # Service plan's os_type.


 apps = format("sp%s%s%s", local.assetname, var.environment, var.apps)
}

variable "environment" {
  type = string
}

variable "apps" {
  type        = string
  description = "The name for every resource"
}

variable "group" {
  type        = string
  description = "The resource group's name"
}
