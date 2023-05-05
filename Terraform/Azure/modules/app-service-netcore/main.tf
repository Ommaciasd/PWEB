# Reference to an existing Azure Resource Group
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Reference to an existing Azure App Service Plan
data "azurerm_service_plan" "service-plan" {
  name                = var.azurerm_service_plan_name
  resource_group_name = data.azurerm_resource_group.rg.name
}
resource "azurerm_linux_web_app" "web_app_service_netcore" {
  location            = var.location-name
  name                = var.name
  resource_group_name = var.resource_group_name
  service_plan_id     = data.azurerm_service_plan.service-plan.id
  
  app_settings          = var.app_settings
  https_only            = var.https_only
site_config {
  always_on = "true"
  http2_enabled= "false"
  worker_count = "1"
  cors {
    allowed_origins = var.allowed_origins
  }
  application_stack {
    dotnet_version = "6.0"
  }
 }
}
