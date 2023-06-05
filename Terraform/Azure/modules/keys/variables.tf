variable "group" {
  type        = string
  description = "The resource group's name"
}

variable "environment" {
  type = string
}

locals {
  days        = "7"
  permissions = "Get"
  encryption  = "true"
  protection  = "false"
  apps        = var.apps
  location    = "eastus"
  group       = var.group
  created     = "terraform"
  assetname   = "nanaykuna"
  environment = var.environment
}

variable "apps" {
  type        = string
  description = "The base name for every resource"
}
