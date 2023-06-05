#-------------------------------------
# SPLAN Creation - Default is "true"
#-------------------------------------
resource "azurerm_service_plan" "webs" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  os_type             = local.os
  sku_name            = local.sku
  name                = local.web
  resource_group_name = local.group
  location            = local.location
}

resource "azurerm_service_plan" "functions" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  os_type             = local.os
  sku_name            = local.sku
  resource_group_name = local.group
  name                = local.function
  location            = local.location
}
