#-------------------------------------
# SQL Creation - Default is "true"
#-------------------------------------
resource "azurerm_mssql_database" "apps" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  name           = local.db
  max_size_gb    = local.gb
  license_type   = local.type
  collation      = local.collation
  server_id      = azurerm_mssql_server.apps.id
  /* read_scale     = true */
  /* sku_name       = "S0" */
  /* zone_redundant = true */
}

resource "azurerm_mssql_server" "apps" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  name                         = local.sql
  minimum_tls_version          = local.tls
  resource_group_name          = local.group
  version                      = local.version
  location                     = local.location
  administrator_login_password = local.password
  administrator_login          = local.administrator

  /* azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "00000000-0000-0000-0000-000000000000"
  } */
}
