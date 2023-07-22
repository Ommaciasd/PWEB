# First deploy for infrastructure, Unit Logics and networking.
module "plan" {
  app         = var.plan
  environment = local.environment
  group       = module.groups.apps
  source      = ".//modules//plan"
}

module "groups" {
  app         = var.group
  environment = local.environment
  source      = ".//modules//groups"
}

module "sql" {
  db          = local.db
  sql         = local.sql
  source      = ".//modules//sql"
  environment = local.environment
  group       = module.groups.storage
}

module "networking" {
  apps        = local.apps
  subnet      = var.subnet
  gateway     = var.gateway
  network     = local.network
  environment = local.environment
  group       = module.groups.networking
  source      = ".//modules//networking"
}

module "keys" {
  environment = local.environment
  group       = module.groups.apps
  source      = ".//modules//keys"
  apps        = local.key # Add Resources Prefix + Name.
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
  dns         = var.dns    # Add Resources Prefix + Name.
}

# Second deploy for Compute, Apps, Objects.
# module "vms" {
#   vm          = local.vm
#   group       = module.groups.vms
#   source      = ".//modules//vms"
#   environment = local.environment
#   private     = module.networking.subnet[1].id
# }

# module "storage" {
#   app         = var.data
#   environment = local.environment
#   group       = module.groups.storage
#   source      = ".//modules//storage"
#   function    = module.networking.subnet[0].id
# }

# module "dotnet" {
#   app         = each.value
#   for_each    = toset(var.net)
#   plan        = module.plan.web
#   aspnetcore  = local.aspnetcore
#   environment = local.environment
#   group       = module.groups.apps
#   source      = ".//modules//dotnet"
#   key         = module.monitoring.key
#   connection  = module.monitoring.connection
#   public      = module.networking.gateway[0].id # ID PUBLIC SUBNET APP Webs.
# }

# module "node" {
#   app         = each.value
#   for_each    = toset(var.node)
#   plan        = module.plan.web
#   aspnetcore  = local.aspnetcore
#   environment = local.environment
#   group       = module.groups.apps
#   source      = ".//modules//node"
#   key         = module.monitoring.key
#   connection  = module.monitoring.connection
#   public      = module.networking.gateway[0].id # ID PUBLIC SUBNET APP Webs.
# }

# module "functions" {
#   app         = each.value
#   aspnetcore  = local.aspnetcore
#   environment = local.environment
#   group       = module.groups.apps
#   for_each    = toset(var.function)
#   plan        = module.plan.function
#   key         = module.monitoring.key
#   storage     = module.storage.public
#   source      = ".//modules//functions"
#   private     = module.networking.subnet[0].id
#   connection  = module.monitoring.connection
#   pfunction   = module.networking.gateway[1].id # ID PUBLIC SUBNET APP Functions.
# }
