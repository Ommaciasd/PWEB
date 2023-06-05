variable "environment" {
  type = string
}

variable "group" {
  type        = string
  description = "The resource group's name"
}

variable "network" {
  type        = string
  description = "The CIDR of the network VNET"
}

variable "private" {
  type        = string
  description = "The CIDR of the network VNET"
}

variable "public" {
  type        = string
  description = "The CIDR of the network VNET"
}

variable "web" {
  type        = string
  description = "The base name for every resource"
}

variable "apps" {
  type        = string
  description = "The base name for every resource"
}

variable "function" {
  type        = string
  description = "The base name for every resource"
}

locals {
  location    = "eastus"
  assetname   = "nanaykuna"
  group       = var.group
  public      = var.public
  network     = var.network
  private     = var.private
  created     = "terraform"
  environment = var.environment
  web         = format("sn-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.web)
  apps        = format("vn-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.apps)
  function    = format("sn-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)
}
