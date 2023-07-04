# Outputs
output "vms"        { value = azurerm_resource_group.vm.name }
output "apps"       { value = azurerm_resource_group.apps.name }
output "storage"    { value = azurerm_resource_group.storage.name }
output "networking" { value = azurerm_resource_group.networking.name }
