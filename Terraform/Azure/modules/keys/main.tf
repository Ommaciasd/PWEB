data "azurerm_client_config" "apps" {}

#---------------------------------------
# KVaults Creation - Default is "true"
#---------------------------------------
resource "azurerm_key_vault" "keys-apps" {
  tags = {
    created_by  = var.created
    environment = var.environment
  }

  access_policy {
    key_permissions = [
      "${var.permissions}",
    ]

    secret_permissions = [
      "${var.permissions}",
    ]

    storage_permissions = [
      "${var.permissions}",
    ]

    tenant_id = data.azurerm_client_config.apps.tenant_id
    object_id = data.azurerm_client_config.apps.object_id
  }

  sku_name                    = var.sku
  name                        = var.apps
  soft_delete_retention_days  = var.days
  resource_group_name         = var.group
  location                    = var.location
  purge_protection_enabled    = var.protection
  enabled_for_disk_encryption = var.encryption
  tenant_id                   = data.azurerm_client_config.apps.tenant_id
}
