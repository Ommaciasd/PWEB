# Outputs
output "apps" {
  value = azurerm_virtual_network.apps.id
}

# ID PUBLIC SUBNET.
output "webs" {
  value = azurerm_subnet.web.id
}

output "functions" {
  value = azurerm_subnet.function.id
}

# ID PUBLIC SUBNET APP Functions.
output "pfunction" {
  value = azurerm_subnet.pfunction.id
}
