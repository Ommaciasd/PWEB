#-------------------------------------
# Random Variable - Default is "true"
#-------------------------------------
resource "random_string" "api_key_secret" {
  upper            = local.always
  special          = local.always
  length           = local.length
  override_special = local.override
}

# -------------------------------------
# LWA Creation - Default is "true"
# -------------------------------------
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
    application_stack { node_version = local.vnode }
  }

  app_settings = {
    "TZ"                                              = local.tz
    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = local.key
    "APPINSIGHTS_PORTALINFO"                          = local.portal
    "SnapshotDebugger_EXTENSION_VERSION"              = local.feature
    "APPINSIGHTS_PROFILERFEATURE_VERSION"             = local.feature
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"             = local.feature
    "DiagnosticServices_EXTENSION_VERSION"            = local.feature
    "XDT_MicrosoftApplicationInsights_Mode"           = local.feature
    "InstrumentationEngine_EXTENSION_VERSION"         = local.feature
    "XDT_MicrosoftApplicationInsights_PreemptSdk"     = local.feature
    "XDT_MicrosoftApplicationInsights_BaseExtensions" = local.feature
    "ApplicationInsightsAgent_EXTENSION_VERSION"      = local.extension
    "ASPNETCORE_ENVIRONMENT"                          = local.aspnetcore
    "APPLICATIONINSIGHTS_CONNECTION_STRING"           = local.connection
    "API_KEY_SECRET"                                  = random_string.api_key_secret.result
  }
}

#-------------------------------------
# Azure Static Web App
#-------------------------------------
resource "azurerm_static_site" "react" {
  name                = "dev-nanaykuna-backoffice-ui"
  location            = "eastus2"
  resource_group_name = local.group
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  # app_settings = {
  #   # Configuraciones específicas de la aplicación
  #   WEBSITE_NODE_DEFAULT_VERSION = local.vnode
  #   AzureStaticApps_Api_Location = "/api"
  #   AzureStaticApps_AppArtifactLocation = "/wwwroot"
  #   # Otras configuraciones según tus necesidades.
  # }

  # build {
  #   publish_webapp  = true
  #   skip_post_build = false
  #   stack           = "node"
  # }
}

# ASVNSC Integration - Default is "true"
resource "azurerm_app_service_virtual_network_swift_connection" "react" {
  subnet_id      = local.public
  app_service_id = azurerm_linux_web_app.react.id
}
