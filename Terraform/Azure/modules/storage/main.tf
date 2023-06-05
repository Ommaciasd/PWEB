# Create Storage Account
# Apps.
  resource "azurerm_storage_account" "public" {
  tags                     = {
    created_by  = local.created
    environment = local.environment
  }

  min_tls_version          = local.tls
  account_replication_type = local.type
  account_tier             = local.tier
  resource_group_name      = local.group
  name                     = local.public
  location                 = local.location
}


  resource "azurerm_storage_account" "private" {
  tags                     = {
    created_by  = local.created
    environment = local.environment
  }

  min_tls_version          = local.tls
  account_replication_type = local.type
  account_tier             = local.tier
  resource_group_name      = local.group
  name                     = local.private
  location                 = local.location
}

/*
resource "azurerm_storage_container" "azure-webjobs-hosts" {
  container_access_type = "private"
  name                  = "azure-webjobs-hosts"
  storage_account_name  = azurerm_storage_account.apps.name
}

resource "azurerm_storage_container" "logs" {
  name                  = "logs"
  container_access_type = "private"
  storage_account_name  = azurerm_storage_account.apps.name
}

resource "azurerm_storage_container" "azure-webjobs-secrets" {
  container_access_type = "private"
  name                  = "azure-webjobs-secrets"
  storage_account_name  = azurerm_storage_account.apps.name
}

  resource "azurerm_storage_account_network_rules" "apps" {
  storage_account_id = azurerm_storage_account.apps.id
  default_action             = "Deny"
  ip_rules                   = ["181.46.139.60"]
  virtual_network_subnet_ids = [local.private]
  bypass                     = ["Metrics"]
}

resource "azurerm_log_analytics_workspace" "apps" {
  retention_in_days   = 30
  sku                 = "PerGB2018"
  resource_group_name = local.group
  location            = local.location
  name                = "${local.sql}workspace"
}

resource "azurerm_log_analytics_storage_insights" "apps" {
  resource_group_name = local.group

  name                = "${local.sql}-storageinsightconfig"
  workspace_id        = azurerm_log_analytics_workspace.apps.id
  storage_account_id  = azurerm_storage_account.apps.id
  storage_account_key = azurerm_storage_account.apps.primary_access_key
}


# Data.
resource "azurerm_storage_account" "data" {
  account_replication_type = "LRS"
  account_tier             = "Standard"
  resource_group_name      = local.group
  location                 = local.location
  name                     = "azrmsaccountdata"

  tags = {
    environment = local.environment
  }
}

resource "azurerm_storage_container" "azure-webjobs-hosts-data" {
  container_access_type = "private"
  name                  = "azure-webjobs-hosts"
  storage_account_name  = azurerm_storage_account.data.name
}

resource "azurerm_storage_container" "logs-data" {
  name                  = "logs"
  container_access_type = "private"
  storage_account_name  = azurerm_storage_account.data.name
}

resource "azurerm_storage_container" "azure-webjobs-secrets-data" {
  container_access_type = "private"
  name                  = "azure-webjobs-secrets"
  storage_account_name  = azurerm_storage_account.data.name
}

  resource "azurerm_storage_account_network_rules" "data" {
  storage_account_id = azurerm_storage_account.data.id
  default_action             = "Deny"
  ip_rules                   = ["181.46.139.60"]
  virtual_network_subnet_ids = [local.private]
  bypass                     = ["Metrics"]
} */
