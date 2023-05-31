#-------------------------------------
# LFA Creation - Default is "true"
#-------------------------------------
resource "azurerm_linux_function_app" "functions" {
  name                 = local.function
  service_plan_id      = local.plan
  resource_group_name  = local.group
  storage_account_name = local.storage
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

  tags = {
    environment = local.environment
    created_by  = "terraform"
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
  subnet_id      = "/subscriptions/d11da572-d15e-42c4-a61c-9bd28afc17ce/resourceGroups/rg-nanaykuna-dev-tf-eastus-networking/providers/Microsoft.Network/virtualNetworks/apps/subnets/s-nanaykuna-dev-tf-eastus-gw-01"
  app_service_id = azurerm_linux_function_app.functions.id
}

#-------------------------------------
# LWA Creation - Default is "true"
#-------------------------------------
resource "azurerm_linux_web_app" "react" {
  name                = local.node
  service_plan_id     = local.plan
  resource_group_name = local.group
  location            = local.location

  site_config {
#   linux_fx_version = "NODE|14-lts"
  }

  tags = {
    environment = local.environment
    created_by  = "terraform"
  }

app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "14.17.0"
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
  subnet_id      = "/subscriptions/d11da572-d15e-42c4-a61c-9bd28afc17ce/resourceGroups/rg-nanaykuna-dev-tf-eastus-networking/providers/Microsoft.Network/virtualNetworks/apps/subnets/s-nanaykuna-dev-tf-eastus-gw-01"
  app_service_id = azurerm_linux_web_app.react.id
}

#-------------------------------------
# LWA Creation - Default is "true"
#-------------------------------------
resource "azurerm_linux_web_app" "net" {
  name                = local.net
  service_plan_id     = local.plan
  resource_group_name = local.group
  location            = local.location

  site_config {
#   dotnet_framework_version = "v6.0"
#   scm_type                 = "LocalGit"
  }

  tags = {
    environment = local.environment
    created_by  = "terraform"
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
  subnet_id      = "/subscriptions/d11da572-d15e-42c4-a61c-9bd28afc17ce/resourceGroups/rg-nanaykuna-dev-tf-eastus-networking/providers/Microsoft.Network/virtualNetworks/apps/subnets/s-nanaykuna-dev-tf-eastus-gw-01"
  app_service_id = azurerm_linux_web_app.net.id
}
