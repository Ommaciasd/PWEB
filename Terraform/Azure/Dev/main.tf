module "sql" {
  db          = local.db
  sql         = local.sql
  source      = ".//modules//sql"
  environment = local.environment
  group       = module.groups.storage
}

module "keys" {
  environment = local.environment
  group       = module.groups.apps
  source      = ".//modules//keys"
  apps        = local.key # Add Resource's Prefix + Name.
}

module "plan" {
  environment = local.environment
  source      = ".//modules//plan"
  group       = module.groups.apps
  web         = local.wa # Add Resource's Prefix + Name.
  function    = local.fa # Add Resource's Prefix + Name.
}

module "storage" {
  environment = local.environment
  group       = module.groups.storage
  source      = ".//modules//storage"
  private     = module.networking.function
  apps        = local.apps # Add Resource's Prefix + Name.
}

module "monitoring" {
  environment = local.environment
  group       = module.groups.apps
  source      = ".//modules//monitoring"
  apps        = local.apps # Add Resource's Prefix + Name.
}

module "webs" {
  for_each    = var.webs
  plan        = module.plan.web
  web         = each.value["web"]
  environment = local.environment
  group       = module.groups.apps
  source      = ".//modules//webs"
  key         = module.monitoring.key
  connection  = module.monitoring.connection
  public      = module.networking.web # ID PUBLIC SUBNET.
}

module "functions" {
  for_each    = var.functions
  endpoint    = local.endpoint
  environment = local.environment
  group       = module.groups.apps
  storage     = module.storage.apps
  plan        = module.plan.function
  function    = each.value["function"]
  source      = ".//modules//functions"
  private     = module.networking.function
  public      = module.networking.web # ID PUBLIC SUBNET.
}

module "dns" {
  source      = ".//modules//dns"
  environment = local.environment
  group       = module.groups.networking
  private     = local.pdns # Add Resource's Prefix + Name.
  dns         = local.dns  # Add Resource's Prefix + Name.
  dns2        = local.dns2 # Add Resource's Prefix + Name.
  dns3        = local.dns3 # Add Resource's Prefix + Name.
  dns4        = local.dns4 # Add Resource's Prefix + Name.
}

module "groups" {
  vm          = local.vm
  environment = local.environment
  source      = ".//modules//groups"
  apps        = local.apps       # Add Resource's Prefix + Name.
  storage     = local.storage    # Add Resource's Prefix + Name.
  networking  = local.networking # Add Resource's Prefix + Name.
}

module "networking" {
  public      = local.public
  private     = local.private
  network     = local.network
  environment = local.environment
  group       = module.groups.networking
  source      = ".//modules//networking"
  apps        = local.apps     # Add Resource's Prefix + Name.
  web         = local.internet # Add Subnet Linux Web App Name.
  function    = local.lan      # Add Subnet Linux Function App Name.
}
