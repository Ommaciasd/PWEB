#-------------------------------------
# SPLAN Creation - Default is "true"
#-------------------------------------
resource "azurerm_service_plan" "webs" {
  os_type             = local.os
  sku_name            = local.sku
  name                = local.web
  resource_group_name = local.group
  location            = local.location

  tags = {
    environment = local.environment
  }
}

resource "azurerm_service_plan" "functions" {
  os_type             = local.os
  sku_name            = local.sku
  resource_group_name = local.group
  name                = local.function
  location            = local.location

  tags = {
    environment = local.environment
  }
}
