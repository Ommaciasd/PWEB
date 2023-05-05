#-------------------------------------
# LWA Creation - Default is "true"
#-------------------------------------
resource "azurerm_linux_web_app" "webs" {
  name                = local.web
  resource_group_name = local.group
  location            = local.location
  service_plan_id     = local.plan

  site_config {}

  tags = {
    environment = local.environment
  }
}

#----------------------------------------
# ASVNSC Integration - Default is "true"
#----------------------------------------
resource "azurerm_app_service_virtual_network_swift_connection" "integration-vnet-webs" {
  app_service_id = azurerm_linux_web_app.webs.id
  subnet_id      = local.public
}
