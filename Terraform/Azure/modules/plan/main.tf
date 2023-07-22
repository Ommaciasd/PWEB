#-------------------------------------
# SPLAN Creation - Default is "true"
#-------------------------------------
resource "azurerm_service_plan" "apps" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  count               = length(var.app)
  name                = "${local.name}-${var.app[count.index]}"
  os_type             = local.os
  sku_name            = local.sku
  resource_group_name = local.group
  location            = local.location
}
