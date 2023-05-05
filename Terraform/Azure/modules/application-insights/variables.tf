locals {
  location    = "eastus"
  assetname   = "nanaykuna"
  environment = var.environment
  group       = var.group
  type        = "web" # Application_type.
  insights    = format("ai-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.insights)
}

variable "insights" {
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
