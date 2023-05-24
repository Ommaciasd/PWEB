#-------------------------------------
# LWA Creation - Default is "true"
#-------------------------------------
resource "azurerm_linux_web_app" "webs" {
  name                = local.web
  service_plan_id     = local.plan
  resource_group_name = local.group
  location            = local.location

  site_config {}

  tags = {
    environment = local.environment
  }

app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = local.key
    "APPINSIGHTS_PORTALINFO"                     = local.portal
    "APPINSIGHTS_PROFILERFEATURE_VERSION"        = local.feature
    "ApplicationInsightsAgent_EXTENSION_VERSION" = local.extension
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = local.connection
  }
}

#----------------------------------------
# ASVNSC Integration - Default is "true"
#----------------------------------------
resource "azurerm_app_service_virtual_network_swift_connection" "webs" {
  subnet_id      = local.public
  app_service_id = azurerm_linux_web_app.webs.id
}
