variable "environment" {
  type = string
}

variable "group" {
  type        = string
  description = "The resource group's name"
}

variable "public" {
  type        = string
  description = "The CIDR of the network VNET"
}

variable "network" {
  type        = string
  description = "The CIDR of the network VNET"
}

variable "private" {
  type        = string
  description = "The CIDR of the network VNET"
}

variable "apps" {
  type        = string
  description = "The base name for every resource"
}

variable "web" {
  type        = string
  description = "The base name for every resource"
}

variable "function" {
  type        = string
  description = "The base name for every resource"
}

locals {
  all         = "*"
  name        = "RDP"
  protocol    = "Tcp"
  priority4   = "300"
  port        = "3389"
  access2     = "Deny"
  access      = "Allow"
  priority    = "65000"
  priority2   = "65500"
  priority3   = "65501"
  location    = "eastus"
  group       = var.group
  direction   = "Inbound"
  direction2  = "Outbound"
  public      = var.public
  network     = var.network
  private     = var.private
  assetname   = "nanaykuna"
  created     = "terraform"
  environment = var.environment
  source      = "VirtualNetwork"
  web         = format("s-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.web)
  apps        = format("v-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.apps)
  function    = format("spe-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)
}
