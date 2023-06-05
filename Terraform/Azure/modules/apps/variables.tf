variable "group" {
  type        = string
  description = "Resource group."
}

variable "plan" {
  type        = string
  description = "The service plan ID."
}

variable "plan2" {
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

variable "key" {
  type        = string
  description = "The Application Insights Key."
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
  description = "The base name for every .NET Web App."
}

variable "node" {
  type        = string
  description = "The base name for every React Web App."
}

variable "connection" {
  type        = string
  description = "The Application Insights Connection ID."
}

locals {
  priority    = 1
  extension   = "~2"
  always      = true
  action      = "Deny"
  feature     = "1.0.0"
  key         = var.key
  location    = "eastus"
  plan        = var.plan
  plan2       = var.plan2
  group       = var.group
  portal      = "ASP.NET"
  ip          = "0.0.0.0/0"
  private     = var.private
  storage     = var.storage
  created     = "terraform"
  assetname   = "nanaykuna"
  connection  = var.connection
  environment = var.environment
  rule        = "Block Access Public"
  public      = var.public # ID PUBLIC SUBNET.
  subresource = "sites" # PSC subresource names.
  manual      = "false" # ENABLE PRIVATE LINK ENDPOINT.
  net         = format("lwa-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.net)
  node        = format("lwa-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.node)
  function    = format("lfa-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)

  # Private Endpoints.
  endpoint    = format("pe-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)
  pscendpoint = format("psce-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.function)
}
