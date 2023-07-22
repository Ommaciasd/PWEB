variable "environment" { type = string }
variable "app"         { type = list(string) }

locals {
  location    = "eastus"
  assetname   = "nanaykuna"
  created     = "terraform"
  environment = var.environment
  name        = format("rg-%s-%s-tf-%s", local.assetname, var.environment, local.location)
}
