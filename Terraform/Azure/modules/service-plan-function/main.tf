resource "azurerm_service_plan" "service_plan_function" {
  name                = var.name-plan-func
  location            = var.location-name
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "B1"
}