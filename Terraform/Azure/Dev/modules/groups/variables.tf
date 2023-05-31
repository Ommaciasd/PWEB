locals {
  location    = "eastus"
  assetname   = "nanaykuna"
  environment = var.environment
  apps        = format("rg-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.apps)
  storage     = format("rg-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.storage)
  vm          = format("rg-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.vm)
  networking  = format("rg-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.networking)
}

variable "environment" {
  type = string
}

variable "vm" {
  type        = string
  description = "The name for every resource"
}

variable "apps" {
  type        = string
  description = "The name for every resource"
}

variable "storage" {
  type        = string
  description = "The name for every resource"
}

variable "networking" {
  type        = string
  description = "The name for every resource"
}
