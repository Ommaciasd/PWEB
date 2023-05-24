variable "group" {
  type        = string
  description = "Resource group."
}

variable "plan" {
  type        = string
  description = "The service plan ID."
}

# SUBNETS.
variable "public" {
  type        = string
  description = "The subnet's ID."
}

variable "private" {
  type        = string
  description = "The Private subnet's ID."
}

variable "storage" {
  type        = string
  description = "The storage account name."
}

variable "endpoint" {
  type        = string
  description = "The base name for every resource."
}

variable "environment" {
  type = string
  description = "The environment for all resources."
}

variable "function" {
  type        = string
  description = "The base name for every Function App."
}

locals {
  priority    = 1
  always      = true
  action      = "Deny"
  plan        = var.plan
  location    = "eastus"
  group       = var.group
  private     = var.private
  storage     = var.storage
  ip          = "0.0.0.0/0"
  assetname   = ""
  rule        = "Block Access Public"
  environment = var.environment
  subresource = "sites" # PSC subresource names.
  manual      = "false" # ENABLE PRIVATE LINK ENDPOINT.
  public      = var.public # ID PUBLIC SUBNET.
  function    = format("lfa-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)

  # Private Endpoints.
  endpoint    = format("pe-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)
  pscendpoint = format("psce-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)
}
