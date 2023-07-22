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
# LFA Creation - Default is "true"
#-------------------------------------
resource "azurerm_linux_function_app" "functions" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  service_plan_id      = local.plan
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

  app_settings = {
    "TZ"                                              = local.tz
    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = local.key
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS"              = local.days
    "AzureWebJobsSecretStorageType"                   = local.file
    "APPINSIGHTS_PORTALINFO"                          = local.portal
    "WEBSITE_ENABLE_SYNC_UPDATE_SITE"                 = local.always
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"             = local.always
    "FUNCTIONS_WORKER_RUNTIME"                        = local.runtime
    "SnapshotDebugger_EXTENSION_VERSION"              = local.feature
    "APPINSIGHTS_PROFILERFEATURE_VERSION"             = local.feature
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"             = local.feature
    "DiagnosticServices_EXTENSION_VERSION"            = local.feature
    "XDT_MicrosoftApplicationInsights_Mode"           = local.feature
    "InstrumentationEngine_EXTENSION_VERSION"         = local.feature
    "XDT_MicrosoftApplicationInsights_PreemptSdk"     = local.feature
    "XDT_MicrosoftApplicationInsights_BaseExtensions" = local.feature
    "ApplicationInsightsAgent_EXTENSION_VERSION"      = local.extension
    "FUNCTION_ENVIRONMENT"                            = local.aspnetcore
    "FUNCTIONS_EXTENSION_VERSION"                     = local.efunctions
    "APPLICATIONINSIGHTS_CONNECTION_STRING"           = local.connection
    "API_KEY_SECRET"                                  = random_string.api_key_secret.result
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
