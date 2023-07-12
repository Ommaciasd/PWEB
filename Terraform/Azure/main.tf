# First deploy for infrastructure, Unit Logics and networking.
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
  apps        = local.key # Add Resources Prefix + Name.
}

module "plan" {
  environment = local.environment
  source      = ".//modules//plan"
  group       = module.groups.apps
  web         = local.wa # Add Resources Prefix + Name.
  function    = local.fa # Add Resources Prefix + Name.
}

module "monitoring" {
  environment = local.environment
  group       = module.groups.apps
  source      = ".//modules//monitoring"
  apps        = local.apps # Add Resources Prefix + Name.
}

module "dns" {
  source      = ".//modules//dns"
  environment = local.environment
  group       = module.groups.networking
  private     = local.pdns # Add Resources Prefix + Name.
  dns         = local.dns  # Add Resources Prefix + Name.
  dns2        = local.dns2 # Add Resources Prefix + Name.
  dns3        = local.dns3 # Add Resources Prefix + Name.
  dns4        = local.dns4 # Add Resources Prefix + Name.
}

module "groups" {
  vm          = local.vm
  environment = local.environment
  source      = ".//modules//groups"
  apps        = local.apps       # Add Resources Prefix + Name.
  storage     = local.storage    # Add Resources Prefix + Name.
  networking  = local.networking # Add Resources Prefix + Name.
}

module "networking" {
  public      = local.public
  private     = local.private
  network     = local.network
  environment = local.environment
  group       = module.groups.networking
  source      = ".//modules//networking"
  apps        = local.apps      # Add Resources Prefix + Name.
  web         = local.internet  # Add Subnet Linux Web App Name.
  ivm         = local.ivm       # Add Public Subnet Virtual Machines.
  pvm         = local.pvm       # Add Public Subnet Virtual Machines.
  function    = local.lan       # Add Subnet Linux Function App Name.
  ifunction   = local.ifunction # Add Public Linux Function App Name.
  pfunction   = local.pfunction # Add Subnet Public Linux Function App Name.
}

# Second deploy for Compute, Apps, Objects.
module "storage" {
  environment = local.environment
  group       = module.groups.storage
  source      = ".//modules//storage"
  function    = module.networking.functions
  public      = local.sa  # Add Resources Prefix + Name.
  private     = local.psa # Add Resources Prefix + Name.
}

module "apps" {
  for_each    = var.app
  net         = each.value.net
  node        = each.value.node
  plan        = module.plan.web
  aspnetcore  = local.aspnetcore
  environment = local.environment
  group       = module.groups.apps
  source      = ".//modules//apps"
  function    = each.value.function
  plan2       = module.plan.function
  storage     = module.storage.public
  key         = module.monitoring.key
  private     = module.networking.functions
  connection  = module.monitoring.connection
  public      = module.networking.webs      # ID PUBLIC SUBNET.
  pfunction   = module.networking.pfunction # ID PUBLIC SUBNET APP Functions.
  pvm         = module.networking.pvm       # ID PUBLIC SUBNET Virtual Machines.
}

module "vms" {
  vms         = local.vms
  group       = module.groups.vms
  source      = ".//modules//vms"
  environment = local.environment
  private     = module.networking.functions
}
