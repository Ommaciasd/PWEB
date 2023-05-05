module "web_app_service_bff" {
  source                    = "./modules/app-service-netcore"
  name                      = "${var.env}-as-bff"
  resource_group_name       = var.resource_group_name    
  azurerm_service_plan_name = var.azurerm_service_plan_name
  app_settings              = { 
  "ASPNETCORE_ENVIRONMENT"  = var.aspnetcore_environment
  "API_KEY_SECRET"          = var.api_key_secret
  "TZ" = "America/Lima" }
  allowed_origins           = ["http://localhost:3000", "https://dev-nanaykuna.azurewebsites.net","${var.env}-as-fe"]
}

module "web_app_service_backoffice" {
  source                    = "./modules/app-service-netcore"
  name                      = "${var.env}-as-backoffice"
  resource_group_name       = var.resource_group_name    
  azurerm_service_plan_name = var.azurerm_service_plan_name
  app_settings              = { 
  "TZ" = "America/Lima" }
  allowed_origins = []
}

module "web_app_service_ticket-manager" {
  source                    = "./modules/app-service-netcore"
  name                      = "${var.env}-as-ticket-manager"
  resource_group_name       = var.resource_group_name    
  azurerm_service_plan_name = var.azurerm_service_plan_name
  app_settings              = { 
  "DATABASE_CONNECTION_STRING" = "$(SUPPORT-DB)"
  "TZ" = "America/Lima" }
  allowed_origins = []
}