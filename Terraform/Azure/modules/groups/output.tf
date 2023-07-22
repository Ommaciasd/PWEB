# Outputs
output "vms"        { value = azurerm_resource_group.apps[0].name }
output "apps"       { value = azurerm_resource_group.apps[1].name }
output "storage"    { value = azurerm_resource_group.apps[2].name }
output "networking" { value = azurerm_resource_group.apps[3].name }
