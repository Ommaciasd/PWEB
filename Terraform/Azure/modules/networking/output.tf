# Outputs
output "apps" { value = azurerm_virtual_network.apps }

# ID PUBLIC SUBNETS.
output "gateway" {
  value = [for idx, gateway in azurerm_subnet.public : { index = idx, id = gateway.id }]
}

# ID PRIVATE SUBNETS.
output "subnet" {
  value = [for idx, subnet in azurerm_subnet.privates : { index = idx, id = subnet.id }]
}
