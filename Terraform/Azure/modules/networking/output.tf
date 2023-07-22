# Outputs
output "apps" { value = azurerm_virtual_network.apps }

# ID PUBLIC SUBNETS.
output "gateway" {
  value = [for idx, gateway in azurerm_subnet.gateway : { index = idx, id = gateway.id }]
}

# ID SUBNETS.
output "subnet" {
  value = [for idx, subnet in azurerm_subnet.subnet : { index = idx, id = subnet.id }]
}
