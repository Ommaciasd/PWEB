# Outputs
output "web" {
  value = azurerm_service_plan.apps[0].id
}

output "function" {
  value = azurerm_service_plan.apps[1].id
}
