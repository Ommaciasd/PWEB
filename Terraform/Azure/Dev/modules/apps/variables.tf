locals {
  priority    = 1
  always      = true
  action      = "Deny"
  plan        = var.plan
  location    = "eastus"
  group       = var.group
  public      = var.public
  private     = var.private
  storage     = var.storage
  ip          = "0.0.0.0/0"
  assetname   = ""
  rule        = "Block Access Public"
  environment = var.environment
  subresource = "sites" # PSC subresource names.
  manual      = "false" # ENABLE PRIVATE LINK ENDPOINT.
  function    = format("lfa%s%stf%s%s", local.assetname, var.environment, local.location, var.function)
}

variable "plan" {
  type        = string
  description = "The service plan's ID"
}

variable "group" {
  type        = string
  description = "The resource group's name"
}


variable "public" {
  type        = string
  description = "The subnet's ID"
}

variable "private" {
  type        = string
  description = "The subnet's ID"
}
variable "storage" {
  type        = string
  description = "The storage account's name"
}

variable "function" {
  type        = string
  description = "The base name for every resource"
}

variable "environment" {
  type = string
  description = "The environment for all resources"
}
