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
  location    = local.location
  created     = local.created
  assetname   = local.assetname
}

module "sql" {
  db          = local.db
  sql         = local.sql
  source      = ".//modules//sql"
  environment = local.environment
  group       = module.groups.storage
}

# ToDo: 20231114 - Deploy All secrets?:
module "keys" {
  active                          = local.active
  created                         = local.created
  location                        = local.location
  assetname                       = local.assetname
  environment                     = local.environment
  encryption                      = local.encryption
  protection                      = local.protection
  days                            = local.days
  apps                            = local.apps
  sku                             = local.sku
  permissions                     = local.permissions
  group                           = module.groups.apps
  source                          = ".//modules//keys"
  key_vault_reference_identity_id = local.key_vault_reference_identity_id
  access_policies = [
    {
      tenant_id = "..."
      object_id = "..."
    },
    # Agrega más políticas según sea necesario
  ]
}

module "networking" {
  apps        = local.apps
  subnet      = var.subnet
  gateway     = var.gateway
  network     = var.network
  created     = local.created
  location    = local.location
  assetname   = local.assetname
  environment = local.environment
  group       = module.groups.networking
  source      = ".//modules//networking"
  delegation  = local.delegation
  actions     = local.actions
  microsoft   = local.microsoft
  depends_on  = [module.groups]
}

module "monitoring" {
  apps        = local.apps
  environment = local.environment
  group       = module.groups.apps
  source      = ".//modules//monitoring"
}

module "storage" {
  app         = var.data
  environment = local.environment
  group       = module.groups.storage
  source      = ".//modules//storage"
  function    = module.networking.subnet[0].id
}

module "dotnet" {
  app         = each.value
  for_each    = toset(var.net)
  plan        = module.plan.web
  aspnetcore  = local.aspnetcore
  environment = local.environment
  group       = module.groups.apps
  source      = ".//modules//dotnet"
  key         = module.monitoring.key
  connection  = module.monitoring.connection
  public      = module.networking.gateway[0].id
}

module "node" {
  connection        = module.monitoring.connection
  override_special  = local.override_special
  key               = local.key
  public            = module.networking.gateway[0].id
  group             = module.groups.apps
  tz                = local.tz
  app               = each.value
  active            = local.active
  length            = local.length
  created           = local.created
  feature           = local.feature
  location          = local.location
  identity          = local.identity
  assetname         = local.assetname
  for_each          = toset(var.node)
  plan              = module.plan.web
  aspnetcore        = local.aspnetcore
  appinsights       = local.appinsights
  environment       = local.environment
  node_version      = local.node_version
  extension_version = local.extension_version
  source            = ".//modules//node"
}

module "functions" {
  tz                  = local.tz
  app                 = each.value
  active              = local.active
  length              = local.length
  created             = local.created
  feature             = local.feature
  identity            = local.identity
  location            = local.location
  assetname           = local.assetname
  aspnetcore          = local.aspnetcore
  appinsights         = local.appinsights
  environment         = local.environment
  group               = module.groups.apps
  for_each            = toset(var.function)
  plan                = module.plan.function
  key                 = module.monitoring.key
  storage             = module.storage.private
  source              = ".//modules//functions"
  override_special    = local.override_special
  connection          = module.monitoring.connection
  private             = module.networking.subnet[0].id
  public              = module.networking.gateway[0].id
  pfunction           = module.networking.gateway[1].id
  AzureWebJobsStorage = module.storage.AzureWebJobsStorage
}

# ToValidate: 20231116 - Deploy Only Prod:
module "dns" {
  dns                 = var.dns
  private             = local.pdns
  source              = ".//modules//dns"
  environment         = local.environment
  group               = module.groups.networking
  create_dns_resource = local.environment == "prod" ? true : false
}

module "user_assigned_identity" {
  source        = "./modules/user_assigned_identity"
  identity_name = local.identity_name
  group         = module.groups.apps
  location      = local.location
  depends_on    = [module.groups]
}

module "postgresql_server" {
  source      = "./modules/postgresql_flexible_server"
  server_name = local.server_name
  group       = module.groups.apps
  location    = local.actions
  id          = module.user_assigned_identity.id
  depends_on  = [module.user_assigned_identity]
}

# Second deploy for compute.

# Todo: 20231114 - Review Suscription Quotes and Deployments!!!
# module "vms" {
#   vm          = local.vm
#   lvmss       = local.lvmss
#   source      = ".//modules//vms"
#   group       = module.groups.vms
#   environment = local.environment
#   set         = module.storage.set
#   private     = module.networking.subnet[1].id
# }

