variable "apps"        { type = string }
variable "group"       { type = string }
variable "environment" { type = string }

locals {
  location    = "eastus"
  group       = var.group
  assetname   = "nanaykuna"
  created     = "terraform"
  environment = var.environment
  type        = "web" # Application_type.
  apps        = format("ai-%s-%s-tf-%s-%s", local.assetname, var.environment, local.location, var.apps)
}
