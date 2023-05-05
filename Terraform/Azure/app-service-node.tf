module "web_app_service_fe" {
  source                    = "./modules/app-service-node"
  name                      = "${var.env}-as-fe"
  resource_group_name       = var.resource_group_name
  azurerm_service_plan_name = var.azurerm_service_plan_name    
}