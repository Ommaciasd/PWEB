# First deploy for infrastructure, Unit Logics and networking.
module "plan" {
  app         = var.plan
  environment = var.environment
  group       = module.groups.apps
  source      = ".//modules//plan"
}

module "groups" {
  app         = var.group
  environment = var.environment
  source      = ".//modules//groups"
}

module "sql" {
  db          = var.db
  sql         = var.sql
  source      = ".//modules//sql"
  environment = var.environment
  group       = module.groups.storage
}

module "networking" {
  apps        = var.apps
  subnet      = var.subnet
  gateway     = var.gateway
  network     = var.network
  environment = var.environment
  group       = module.groups.networking
  source      = ".//modules//networking"
}

ToValidate: 20231123 - Deploy All secrets:
module "keys" {
  apps        = var.key
  environment = var.environment
  group       = module.groups.apps
  source      = ".//modules//keys"
}

module "monitoring" {
  apps        = var.apps
  environment = var.environment
  group       = module.groups.apps
  source      = ".//modules//monitoring"
}

module "storage" {
  app         = var.data
  environment = var.environment
  group       = module.groups.storage
  source      = ".//modules//storage"
  function    = module.networking.subnet[0].id
}

module "dotnet" {
  app         = each.value
  for_each    = toset(var.net)
  plan        = module.plan.web
  aspnetcore  = var.aspnetcore
  environment = var.environment
  group       = module.groups.apps
  source      = ".//modules//dotnet"
  key         = module.monitoring.key
  connection  = module.monitoring.connection
  public      = module.networking.gateway[0].id
}

module "node" {
  app         = each.value
  for_each    = toset(var.node)
  plan        = module.plan.web
  aspnetcore  = var.aspnetcore
  environment = var.environment
  group       = module.groups.apps
  source      = ".//modules//node"
  key         = module.monitoring.key
  connection  = module.monitoring.connection
  public      = module.networking.gateway[0].id
}

module "functions" {
  app         = each.value
  aspnetcore  = var.aspnetcore
  environment = var.environment
  group       = module.groups.apps
  for_each    = toset(var.function)
  plan        = module.plan.function
  key         = module.monitoring.key
  storage     = module.storage.public
  source      = ".//modules//functions"
  connection  = module.monitoring.connection
  private     = module.networking.subnet[0].id
  pfunction   = module.networking.gateway[1].id
}

ToValidate: 20231116 - Deploy Only Prod:
module "dns" {
  dns                 = var.dns
  private             = var.pdns
  source              = ".//modules//dns"
  environment         = var.environment
  group               = module.groups.networking
  create_dns_resource = var.environment == "prod" ? true : false
}

# Second deploy for compute.

# Todo: 20231114 - Review Suscription Quotes and Deployments!!!
#module "vms" {
#  vm          = var.vm
#  lvmss       = var.lvmss
#  source      = ".//modules//vms"
#  group       = module.groups.vms
#  environment = var.environment
#  set         = module.storage.set
#  private     = module.networking.subnet[1].id
#}
