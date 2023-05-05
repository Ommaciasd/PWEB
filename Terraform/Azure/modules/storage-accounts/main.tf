resource "azurerm_storage_account" "storage-accounts" {
  name                     = var.storage-account-name
  resource_group_name      = var.resource_group_name
  location                 = var.location-name
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Develop"
  }
}