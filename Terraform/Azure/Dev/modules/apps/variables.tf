variable "key" {
  type        = string
  description = "The Application Insights Key."
}

variable "connection" {
  type        = string
  description = "The Application Insights Connection ID."
}

locals {
  extension   = "~2"
  feature     = "1.0.0"
  portal      = "ASP.NET"
  key         = var.key
  connection  = var.connection
}

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

variable "net" {
  type        = string
  description = "The base name for every Function App."
}

variable "node" {
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
  assetname   = "nanaykuna"
  rule        = "Block Access Public"
  environment = var.environment
  subresource = "sites" # PSC subresource names.
  manual      = "false" # ENABLE PRIVATE LINK ENDPOINT.
  public      = var.public # ID PUBLIC SUBNET.
  function    = format("lfa-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)
  node        = format("lwa-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.node)
  net         = format("lwa-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.net)

  # Private Endpoints.
  endpoint    = format("pe-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)
  pscendpoint = format("psce-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)
}
