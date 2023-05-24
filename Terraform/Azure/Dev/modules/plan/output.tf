# Outputs
output "web" {
  value = azurerm_service_plan.webs.id
}

output "function" {
  value = azurerm_service_plan.functions.id
}
