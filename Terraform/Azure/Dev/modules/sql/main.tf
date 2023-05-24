#-------------------------------------
# SQL Creation - Default is "true"
#-------------------------------------
resource "azurerm_mssql_server" "apps" {
  minimum_tls_version          = "1.2"
  version                      = "12.0"
  name                         = local.sql
  resource_group_name          = local.group
  location                     = local.location
  administrator_login          = "missadministrator"
  administrator_login_password = "#BMfF6SAfKn20Sej52"

  /* azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "00000000-0000-0000-0000-000000000000"
  } */

  tags = {
    environment = local.environment
  }
}

resource "azurerm_mssql_database" "apps" {
  max_size_gb    = 4
  name           = local.db
  license_type   = "LicenseIncluded"
  server_id      = azurerm_mssql_server.apps.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  /* read_scale     = true */
  /* sku_name       = "S0" */
  /* zone_redundant = true */

  tags = {
    environment = local.environment
  }
}
