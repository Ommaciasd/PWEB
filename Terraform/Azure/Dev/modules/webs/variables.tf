variable "group" {
  type        = string
  description = "Resource group."
}

# ID PUBLIC SUBNET.
variable "public" {
  type        = string
  description = "The subnet's ID."
}

variable "plan" {
  type        = string
  description = "The service plan ID."
}

variable "key" {
  type        = string
  description = "The Application Insights Key."
}

variable "web" {
  type        = string
  description = "The base name for every WEB App."
}

variable "environment" {
  type = string
  description = "The environment for all resources."
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
  plan        = var.plan
  location    = "eastus"
  group       = var.group
  assetname   = ""
  connection  = var.connection
  environment = var.environment
  public      = var.public # ID PUBLIC SUBNET.
  web         = format("lwa-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.web)
}
