output "storage-primary-access-key" {
  value = azurerm_storage_account.storage-accounts.primary_access_key
}
output "storage_account_name" {
  value = azurerm_storage_account.storage-accounts.name
}
