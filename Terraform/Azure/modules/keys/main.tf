data "azurerm_client_config" "apps" {}

resource "azurerm_key_vault" "keys-apps" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  access_policy {
    secret_permissions = [
      "Get", "Set", "Delete", "List"
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

resource "azurerm_key_vault_secret" "auth0" {
  name         = "Auth0-Api-Dev-Configuration"
  value        = <<EOF
{
  "AuthorityUrl": "https://dev-10pw7xxrmoge570z.us.auth0.com/",
  "AudienceUrl": "https://BackofficeApi.com",
  "Domain": "dev-10pw7xxrmoge570z.us.auth0.com",
  "ClientId": "cM6jIbBtok63Hk2dxc6CZJiTRAgP9DGa",
  "ClientSecret": "CzcZ5_W1Z4o4_sgAroyNtq7ZxeRYnlp0SPqGeGVWw0nx8iZK77X6Ugzw1_HzJxq6"
}
EOF

  key_vault_id = azurerm_key_vault.keys-apps.id
}

resource "azurerm_role_assignment" "example" {
  principal_id         = data.azurerm_client_config.apps.object_id
  role_definition_name = "Contributor"  # Puedes ajustar el rol según tus necesidades
  scope                = azurerm_key_vault.keys-apps.id  # Aquí es donde se ajusta la referencia
}
