locals {
  name = format("lwa%s001", var.base_name)
}

#-------------------------------------
# LWA Creation - Default is "true"
#-------------------------------------
resource "azurerm_linux_web_app" "lwa" {
  name                = "${local.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  site_config {}

  tags = {
    enviroment = var.enviroment
  }
}

#----------------------------------------
# ASVNSC Integration - Default is "true"
#----------------------------------------
resource "azurerm_app_service_virtual_network_swift_connection" "asvnsc" {
  app_service_id = azurerm_linux_web_app.lwa.id
  subnet_id = var.subnet_id
}
