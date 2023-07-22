# Outputs
output "public" {
  value = azurerm_storage_account.apps[0].name
}

output "private" {
  value = azurerm_storage_account.apps[1].name
}
