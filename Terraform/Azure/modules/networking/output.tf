# Outputs
# napps = "/subscriptions/d11da572-d15e-42c4-a61c-9bd28afc17ce/resourceGroups/rg-nanaykuna-dev-tf-eastus-networking/providers/Microsoft.Network/virtualNetworks/apps"
output "apps" {
  value = azurerm_virtual_network.apps.id
}

# ID PUBLIC SUBNET.
# webs = "/subscriptions/d11da572-d15e-42c4-a61c-9bd28afc17ce/resourceGroups/rg-nanaykuna-dev-tf-eastus-networking/providers/Microsoft.Network/virtualNetworks/apps/subnets/s-nanaykuna-dev-tf-eastus-gw-01"
output "webs" {
  value = azurerm_subnet.web.id
}

output "functions" {
  value = azurerm_subnet.function.id
}
