data "azurerm_client_config" "apps" {}

locals {
  apps_client_config = data.azurerm_client_config.apps
}

resource "azurerm_key_vault" "keys-apps" {
  tags = {
    created_by  = var.created
    environment = var.environment
  }

  access_policy {
    secret_permissions = ["Get", "Set", "Delete", "List"]
    tenant_id          = local.apps_client_config.tenant_id
    object_id          = local.apps_client_config.object_id
  }

  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  resource_group_name         = var.group
  sku_name                    = "standard"
  enabled_for_deployment      = var.active
  enabled_for_disk_encryption = var.active
  location                    = var.location
  tenant_id                   = data.azurerm_client_config.apps.tenant_id
  name                        = format("kv-%s-%s-tf", var.assetname, var.environment)
}

resource "azurerm_key_vault_secret" "auth0" {
  name         = "Auth0-Api-Dev-Configuration"
  key_vault_id = azurerm_key_vault.keys-apps.id

  value = <<EOF
  {
    "AuthorityUrl": "https://dev-10pw7xxrmoge570z.us.auth0.com/",
    "AudienceUrl": "https://BackofficeApi.com",
    "Domain": "dev-10pw7xxrmoge570z.us.auth0.com",
    "ClientId": "cM6jIbBtok63Hk2dxc6CZJiTRAgP9DGa",
    "ClientSecret": "CzcZ5_W1Z4o4_sgAroyNtq7ZxeRYnlp0SPqGeGVWw0nx8iZK77X6Ugzw1_HzJxq6"
  }
  EOF
}

resource "azurerm_role_assignment" "apps" {
  role_definition_name = "Contributor"
  scope                = azurerm_key_vault.keys-apps.id
  principal_id         = data.azurerm_client_config.apps.object_id
}

resource "azurerm_key_vault_access_policy" "function_reader" {
  key_vault_id       = azurerm_key_vault.keys-apps.id
  tenant_id          = data.azurerm_client_config.apps.tenant_id
  object_id          = data.azurerm_client_config.apps.object_id

  secret_permissions = ["Get", "List"]
}

variable "key_vault_reference_identity_id" {
  description = "The managed identity ID for Key Vault access in function apps."
  type        = string
}
