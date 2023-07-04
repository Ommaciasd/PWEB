data "azurerm_client_config" "apps" {}

#---------------------------------------
# KVaults Creation - Default is "true"
#---------------------------------------
resource "azurerm_key_vault" "keys-apps" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  access_policy {
    key_permissions = [
      "${local.permissions}",
    ]

    secret_permissions = [
      "${local.permissions}",
    ]

    storage_permissions = [
      "${local.permissions}",
    ]

    tenant_id = data.azurerm_client_config.apps.tenant_id
    object_id = data.azurerm_client_config.apps.object_id
  }

  sku_name                    = local.sku
  name                        = local.apps
  soft_delete_retention_days  = local.days
  resource_group_name         = local.group
  location                    = local.location
  purge_protection_enabled    = local.protection
  enabled_for_disk_encryption = local.encryption
  tenant_id                   = data.azurerm_client_config.apps.tenant_id
}
