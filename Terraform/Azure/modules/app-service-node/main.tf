# Create a new App Service
# Reference to an existing Azure Resource Group
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}
# Reference to an existing Azure App Service Plan
data "azurerm_service_plan" "service-plan" {
  name                = var.azurerm_service_plan_name
  resource_group_name = data.azurerm_resource_group.rg.name
}
resource "azurerm_linux_web_app" "web_app_service_node" {
  name                = var.name
  location            = var.location-name
  resource_group_name = var.resource_group_name
  service_plan_id     = data.azurerm_service_plan.service-plan.id

  https_only = "true"
  site_config {
    always_on = "false"
    http2_enabled= "false"
    worker_count = "1"
    application_stack {
      node_version = "16-lts"
    }
  }
}