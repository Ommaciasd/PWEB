# Outputs
output "instrumentation_key_out" {
  value = azurerm_application_insights.insights.instrumentation_key
}

output "app_id_out" {
  value = azurerm_application_insights.insights.app_id
}
