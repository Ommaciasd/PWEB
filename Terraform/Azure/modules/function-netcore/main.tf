resource "azurerm_linux_function_app" "function" {
  location            = var.location-name
  name                = var.func-service-name-netcore
  resource_group_name = var.resource_group_name

  service_plan_id            = var.service-plan-id
  storage_account_name       = var.storage-name
  storage_account_access_key = var.primary_access_key

  app_settings = var.app_settings
  
  site_config {
    minimum_tls_version = "1.2"
    use_32_bit_worker = false
  cors {
    allowed_origins = var.allowed_origins
  }    
    application_stack {
      dotnet_version = var.dotnet-version
    }
  }
}