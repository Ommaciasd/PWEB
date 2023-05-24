locals {
  location    = "eastus"
  group       = var.group
  assetname   = ""
  environment = var.environment
  type        = "web" # Application_type.
  apps        = format("ai-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.apps)
}

variable "apps" {
  type        = string
  description = "The name for every resource"
}

variable "group" {
  type        = string
  description = "The resource group's name"
}

variable "environment" {
  type = string
}
