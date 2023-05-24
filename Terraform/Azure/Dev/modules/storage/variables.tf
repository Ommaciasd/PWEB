variable "apps" { type = string }
variable "group" { type = string }
variable "private" { type = string }
variable "environment" { type = string }

locals {
  type        = "LRS"
  tls         = "TLS1_2"
  location    = "eastus"
  group       = var.group
  tier        = "Standard"
  assetname   = ""
  private     = var.private
  environment = var.environment
  apps        = format("sa%s%s%s", local.assetname, local.environment, var.apps)
}
