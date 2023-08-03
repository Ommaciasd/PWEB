variable "group"       { type = string }
variable "app"         { type = list(string) }
variable "function"    { type = any }
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
  name        = format("sa%s%s", local.assetname, var.environment)
}
