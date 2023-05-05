data "azurerm_client_config" "apps" {}

#---------------------------------------
# KVaults Creation - Default is "true"
#---------------------------------------
resource "azurerm_key_vault" "apps" {
  name                = local.apps
  location            = local.location
  resource_group_name = local.group
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.apps.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.apps.tenant_id
    object_id = data.azurerm_client_config.apps.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }

    tags = {
    environment = local.environment
  }

}
