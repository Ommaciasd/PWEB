# Outputs
output "apps" {
  value = azurerm_virtual_network.apps.id
}

# ID PUBLIC SUBNET.
output "web" {
  value = azurerm_subnet.web.id
}

output "function" {
  value = azurerm_subnet.function.id
}
