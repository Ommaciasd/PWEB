#-------------------------------------
# LWA Creation - Default is "true"
#-------------------------------------
resource "azurerm_linux_web_app" "net" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  name                = local.net
  service_plan_id     = local.plan
  resource_group_name = local.group
  location            = local.location

  site_config {
    application_stack { dotnet_version = "6.0" }
  }

app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = local.key
    "APPINSIGHTS_PORTALINFO"                     = local.portal
    "APPINSIGHTS_PROFILERFEATURE_VERSION"        = local.feature
    "ApplicationInsightsAgent_EXTENSION_VERSION" = local.extension
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = local.connection
  }
}

# ASVNSC Integration - Default is "true"
resource "azurerm_app_service_virtual_network_swift_connection" "net" {
  subnet_id      = local.public
  app_service_id = azurerm_linux_web_app.net.id
}

#-------------------------------------
# LWA Creation - Default is "true"
#-------------------------------------
resource "azurerm_linux_web_app" "react" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  name                = local.node
  service_plan_id     = local.plan
  resource_group_name = local.group
  location            = local.location

  site_config {
    application_stack { node_version = "16-lts" }
  }

app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "16.0.0"
#   "WEBSITE_RUN_FROM_PACKAGE"     = "https://github.com/<tu-usuario>/mi-aplicacion-react/tarball/master"
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = local.key
    "APPINSIGHTS_PORTALINFO"                     = local.portal
    "APPINSIGHTS_PROFILERFEATURE_VERSION"        = local.feature
    "ApplicationInsightsAgent_EXTENSION_VERSION" = local.extension
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = local.connection
  }
}

# ASVNSC Integration - Default is "true"
resource "azurerm_app_service_virtual_network_swift_connection" "react" {
  subnet_id      = local.public
  app_service_id = azurerm_linux_web_app.react.id
}

#-------------------------------------
# LFA Creation - Default is "true"
#-------------------------------------
resource "azurerm_linux_function_app" "functions" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  service_plan_id      = local.plan2
  resource_group_name  = local.group
  storage_account_name = local.storage
  name                 = local.function
  location             = local.location
# app_settings         = var.app_settings

# auth_settings {
#   token_refresh_extension_hours =
# }
  site_config {
    always_on = local.always

    # RULES DE ACCESS AND RESTRICTION ON AZURE FUNCTION APP.
    ip_restriction {
      ip_address = local.ip
      name       = local.rule
      action     = local.action
      priority   = local.priority
    }
  }
}

#-------------------------------------
# PE Creation - Default is "true"
#-------------------------------------
resource "azurerm_private_endpoint" "functions" {
  resource_group_name = local.group
  subnet_id           = local.private
  location            = local.location
  name                = local.endpoint

  private_service_connection {
    is_manual_connection           = local.manual
    name                           = local.pscendpoint
    subresource_names              = [local.subresource]
    private_connection_resource_id = azurerm_linux_function_app.functions.id
  }
}

# ASVNSC Integration - Default is "true"
resource "azurerm_app_service_virtual_network_swift_connection" "functions" {
  subnet_id      = local.pfunction
  app_service_id = azurerm_linux_function_app.functions.id
}
