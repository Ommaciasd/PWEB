# Storage Account Module

## locals { ##
##  assetname     = "nanaykuna" ##
##  enviroment    = "dev" ##
##  resource_name = format("%s%s", local.assetname, local.enviroment) ##
## } ##

## module "resource-group" { ##
##  source     = ".//modules//resource-group" ##
##  base_name  = local.resource_name # Add Resource's Prefix + Name. ##
##  assetname  = local.assetname ##
##  enviroment = local.enviroment ##
## } ##

## module "storage-account" { ##
##  source              = ".//modules//storage-account" ##
##  base_name           = local.resource_name # Add Resource's Prefix + Name. ##
##  resource_group_name = module.resource-group.rg_name_out ##
##  assetname           = local.assetname ##
##  enviroment          = local.enviroment ##
##  instance_count      = 2 ##
## } ##
