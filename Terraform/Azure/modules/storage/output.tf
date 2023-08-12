# Outputs
output "public" {
  value = azurerm_storage_account.apps[0].name
}

output "private" {
  value = azurerm_storage_account.apps[1].name
}

output "set" {
  value = azurerm_storage_account.apps[2].primary_blob_endpoint
}
