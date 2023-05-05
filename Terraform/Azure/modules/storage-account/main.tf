# Create Storage Account
# Apps.
resource "azurerm_storage_account" "apps" {
  name                     = local.apps
  resource_group_name      = local.group
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = local.environment
  }
}

resource "azurerm_storage_container" "azure-webjobs-hosts" {
  name                  = "azure-webjobs-hosts"
  storage_account_name  = azurerm_storage_account.apps.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "logs" {
  name                  = "logs"
  storage_account_name  = azurerm_storage_account.apps.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "azure-webjobs-secrets" {
  name                  = "azure-webjobs-secrets"
  storage_account_name  = azurerm_storage_account.apps.name
  container_access_type = "private"
}

resource "azurerm_storage_account_network_rules" "apps" {
  storage_account_id = azurerm_storage_account.apps.id
  default_action             = "Deny"
  ip_rules                   = ["181.46.139.60"]
  virtual_network_subnet_ids = [local.private]
  bypass                     = ["Metrics"]
}

/* variable "storage_account_bypass_settings" {
  type = list
  description = "any combination of Logging, Metrics, AzureServices, or None."
  default = ["Metrics", "Logging", "AzureServices"]
} */

# Data.
resource "azurerm_storage_account" "data" {
  name                     = local.data
  resource_group_name     = local.group
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = local.environment
  }
}
