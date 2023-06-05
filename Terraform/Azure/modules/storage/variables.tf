variable "group" { type = string }
variable "public" { type = string }
variable "private" { type = string }
variable "function" { type = string }
variable "environment" { type = string }

locals {
  type        = "LRS"
  tls         = "TLS1_2"
  location    = "eastus"
  group       = var.group
  tier        = "Standard"
  created     = "terraform"
  assetname   = "nanaykuna"
  function    = var.function
  environment = var.environment
  public      = format("sa%s%stf%s", local.assetname, local.environment, var.public)
  private     = format("sa%s%stf%s", local.assetname, local.environment, var.private)
}
