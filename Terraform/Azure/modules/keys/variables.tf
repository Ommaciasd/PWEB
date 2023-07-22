locals {
  days        = "7"
  permissions = "Get"
  encryption  = "true"
  protection  = "false"
  apps        = var.apps
  location    = "eastus"
  group       = var.group
  sku         = "standard"
  created     = "terraform"
  environment = var.environment
}

variable "apps"        { type = string }
variable "group"       { type = string }
variable "environment" { type = string }
