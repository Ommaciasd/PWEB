#-------------------------------------
# SPLAN Creation - Default is "true"
#-------------------------------------
resource "azurerm_service_plan" "apps" {
  name                = local.apps
  resource_group_name = local.group
  location            = local.location
  os_type             = local.os
  sku_name            = local.sku

  tags = {
    environment = local.environment
  }
}
