# Service Plan Module
 
### locals {
###  assetname      = "nanaykuna"
###  enviroment     = "dev"
###  resource_name  = format("%s%s", local.assetname, local.enviroment)
### }

### module "resource-group" {
###  source     = ".//modules//resource-group"
###  base_name  = local.resource_name # Add Resource's Prefix + Name.
###  assetname  = local.assetname
###  enviroment = local.enviroment
### }

### module "service-plan" {
###  source              = ".//modules//service-plan"
###  base_name           = local.resource_name # Add Resource's Prefix + Name.
###  resource_group_name = module.resource-group.rg_name_out
###  assetname           = local.assetname
###  enviroment          = local.enviroment
### }

## Outputs
### output "rgName" {
###  value = module.resource-group.rg_name_out
### }

### output "spName" {
###  value = module.service-plan.sp_name_out
### }
