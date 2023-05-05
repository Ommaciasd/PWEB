# Outputs
output "apps" {
  value = azurerm_resource_group.apps.name
}

output "storage" {
  value = azurerm_resource_group.data.name
}

output "vm" {
  value = azurerm_resource_group.vm.name
}

output "networking" {
  value = azurerm_resource_group.networking.name
}
