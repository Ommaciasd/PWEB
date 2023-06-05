variable "environment" {
  type = string
}

variable "group" {
  type        = string
  description = "The resource group's name"
}

variable "apps" {
  type        = string
  description = "The name for every resource"
}

locals {
  location    = "eastus"
  group       = var.group
  assetname   = "nanaykuna"
  created     = "terraform"
  environment = var.environment
  type        = "web" # Application_type.
  apps        = format("ai-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.apps)
}
