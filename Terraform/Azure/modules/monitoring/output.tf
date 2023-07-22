# Outputs

output "connection" {
  value = azurerm_application_insights.apps.connection_string
}

output "key" {
  value = azurerm_application_insights.apps.instrumentation_key
}
