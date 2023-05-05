module "resource-group" {
  environment = local.environment
  source      = ".//modules//resource-group"
  apps        = local.apps       # Add Resource's Prefix + Name.
  data        = local.storage    # Add Resource's Prefix + Name.
  vm          = local.vm         # Add Resource's Prefix + Name.
  networking  = local.networking # Add Resource's Prefix + Name.
}

module "application-insights" {
  environment = local.environment
  group       = module.resource-group.apps
  source      = ".//modules//application-insights"
  insights    = local.insights # Add Resource's Prefix + Name.
}

module "networking" {
  source      = ".//modules//networking"
  group       = module.resource-group.networking
  apps        = local.apps     # Add Resource's Prefix + Name.
  web         = local.internet # Add Subnet Linux Web App Name.
  function    = local.lan      # Add Subnet Linux Function App Name.
  environment = local.environment
  network     = local.network
  public      = local.public
  private     = local.private
}

module "dns" {
  source = ".//modules//dns"
  group  = module.resource-group.networking
  dns    = local.dns  # Add Resource's Prefix + Name.
  dns2   = local.dns2 # Add Resource's Prefix + Name.
  dns3   = local.dns3 # Add Resource's Prefix + Name.
  dns4   = local.dns4 # Add Resource's Prefix + Name.
  dns5   = local.dns5 # Add Resource's Prefix + Name.
  dns6   = local.dns6 # Add Resource's Prefix + Name.
}

module "storage-account" {
  environment = local.environment
  source      = ".//modules//storage-account"
  group       = module.resource-group.storage
  apps        = local.saccount # Add Resource's Prefix + Name.
  data        = local.sdata    # Add Resource's Prefix + Name.
  private     = module.networking.function
}

module "service-plan" {
  environment = local.environment
  source      = ".//modules//service-plan"
  group       = module.resource-group.apps
  apps        = local.plan # Add Resource's Prefix + Name.
}

module "functions" {
  for_each    = var.functions
  environment = local.environment
  function    = each.value["function"]
  source      = ".//modules//functions"
  group       = module.resource-group.apps
  storage     = module.storage-account.apps
  plan        = module.service-plan.apps
  public      = module.networking.web
  private     = module.networking.function
}

module "webs" {
  for_each    = var.webs
  web         = each.value["web"]
  source      = ".//modules//webs"
  environment = local.environment
  group       = module.resource-group.apps
  plan        = module.service-plan.apps
  public      = module.networking.web
}

module "keys" {
  environment = local.environment
  source      = ".//modules//keys"
  group       = module.resource-group.apps
  apps        = local.key # Add Resource's Prefix + Name.
}
