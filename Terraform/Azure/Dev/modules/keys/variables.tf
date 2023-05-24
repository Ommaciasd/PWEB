locals {
  apps        = var.apps
  location    = "eastus"
  group       = var.group
  assetname   = ""
  environment = var.environment
}

variable "apps" {
  type        = string
  description = "The base name for every resource"
}

variable "group" {
  type        = string
  description = "The resource group's name"
}

variable "environment" {
  type = string
}
