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

locals {
  location    = "eastus"
  assetname   = "nanaykuna"
  created     = "terraform"
  environment = var.environment
  vm          = format("rg-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.vm)
  apps        = format("rg-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.apps)
  storage     = format("rg-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.storage)
  networking  = format("rg-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.networking)
}
