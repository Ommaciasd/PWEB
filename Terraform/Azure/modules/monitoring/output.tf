# Outputs
output "key" {
  value = azurerm_application_insights.apps.instrumentation_key
}

output "connection" {
  value = azurerm_application_insights.apps.connection_string
}
