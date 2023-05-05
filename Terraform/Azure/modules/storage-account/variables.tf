locals {
  location    = "eastus"
  assetname   = "nanaykuna"
  environment = var.environment
  group       = var.group
  private     = var.private

  # STORAGE ACCOUNTS.
  apps        = format("sa%s", var.apps)
  data        = var.data
  
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

variable "private" {
  type = string
}

variable "data" {
  type = string
}
