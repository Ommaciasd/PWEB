locals {
  location  = "eastus"
  assetname = "nanaykuna"
  environment = var.environment
  group       = var.group
  apps        = var.apps
}

variable "apps" {
  type        = string
  description = "The base name for every resource"
}

variable "environment" {
  type = string
}

variable "group" {
  type        = string
  description = "The resource group's name"
}
