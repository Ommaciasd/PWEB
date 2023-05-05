locals {
  location     = "eastus"
  assetname = "nanaykuna"
  environment = var.environment
  apps = format("rg%s%s%s", local.assetname, var.environment, var.apps)
  data = format("rg%s%s%s", local.assetname, var.environment, var.data)
  vm = format("rg%s%s%s", local.assetname, var.environment, var.vm)
  networking = format("rg%s%s%s", local.assetname, var.environment, var.networking)
}

variable "environment" {
  type = string
}

variable "apps" {
  type        = string
  description = "The name for every resource"
}

variable "data" {
  type        = string
  description = "The name for every resource"
}

variable "vm" {
  type        = string
  description = "The name for every resource"
}

variable "networking" {
  type        = string
  description = "The name for every resource"
}
