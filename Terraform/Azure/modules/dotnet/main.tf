#-------------------------------------
# Random Variable - Default is "true"
#-------------------------------------
resource "random_string" "api_key_secret" {
  upper            = local.always
  special          = local.always
  length           = local.length
  override_special = local.override
}

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
    application_stack { dotnet_version = local.dotnet }
  }

app_settings = {
    "TZ"                                              = local.tz
    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = local.key
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS"              = local.days
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

# ASVNSC Integration - Default is "true"
resource "azurerm_app_service_virtual_network_swift_connection" "net" {
  subnet_id      = local.public
  app_service_id = azurerm_linux_web_app.net.id
}
