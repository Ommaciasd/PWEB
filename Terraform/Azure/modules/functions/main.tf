#-------------------------------------
# LFA Creation - Default is "true"
#-------------------------------------
resource "azurerm_linux_function_app" "functions" {
  location             = local.location
  service_plan_id      = local.plan
  resource_group_name  = local.group
  storage_account_name = local.storage
  name                 = local.function

  site_config {
    always_on = local.always
    
    # RULES DE ACCESS AND RESTRICTION ON AZURE FUNCTION APP.
    ip_restriction {
      action     = local.action
      name       = local.rule
      priority   = local.priority
      ip_address = local.ip
    }
  }

  tags = {
    environment = local.environment
  }
}

#----------------------------------------
# ASVNSC Integration - Default is "true"
#----------------------------------------
resource "azurerm_app_service_virtual_network_swift_connection" "integration-vnet-functions" {
  subnet_id      = local.public
  app_service_id = azurerm_linux_function_app.functions.id
}

#-------------------------------------
# PE Creation - Default is "true"
#-------------------------------------
resource "azurerm_private_endpoint" "functions" {
  location            = local.location
  resource_group_name = local.group
  subnet_id           = local.private
  name                = "${local.function}-pe"

  private_service_connection {
    subresource_names              = [local.subresource]
    is_manual_connection           = local.manual
    name                           = "${local.function}-pe-psc"
    private_connection_resource_id = azurerm_linux_function_app.functions.id
  }
}
