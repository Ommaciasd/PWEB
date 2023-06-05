# Resource Group Module

locals {
  assetname     = "nanaykuna"
  environment    = "dev"
  resource_name = format("%s%s", local.assetname, local.environment)
}

module "resource-group" {
  source     = ".//modules//resource-group"
  base_name  = local.resource_name # Add Resource's Prefix + Name.
  assetname  = local.assetname
  environment = local.environment
}
