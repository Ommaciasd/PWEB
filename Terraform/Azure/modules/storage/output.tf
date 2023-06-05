# Outputs
output "public" {
  value = azurerm_storage_account.public.name
}

output "private" {
  value = azurerm_storage_account.private.name
}
