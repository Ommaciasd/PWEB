resource "random_string" "api_key_secret" {
  upper            = var.active
  length           = var.length
  special          = var.active
  override_special = var.override_special
}

resource "azurerm_linux_web_app" "react" {
  tags = {
    created_by  = var.created
    environment = var.environment
  }

  service_plan_id     = var.plan
  resource_group_name = var.group
  name                = format ( "lwa-%s-%s-tf-%s-%s", var.assetname, var.environment, var.location, var.app )
  location            = var.location

  site_config {
    application_stack { node_version = "16-lts" }
  }

  app_settings = {
    "ApplicationInsightsAgent_EXTENSION_VERSION"      = "~3"
    "TZ"                                              = var.tz
    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = var.key
    "SnapshotDebugger_EXTENSION_VERSION"              = var.feature
    "APPINSIGHTS_PROFILERFEATURE_VERSION"             = var.feature
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"             = var.feature
    "DiagnosticServices_EXTENSION_VERSION"            = var.feature
    "XDT_MicrosoftApplicationInsights_Mode"           = var.feature
    "InstrumentationEngine_EXTENSION_VERSION"         = var.feature
    "XDT_MicrosoftApplicationInsights_PreemptSdk"     = var.feature
    "XDT_MicrosoftApplicationInsights_BaseExtensions" = var.feature
    "ASPNETCORE_ENVIRONMENT"                          = var.aspnetcore
    "APPLICATIONINSIGHTS_CONNECTION_STRING"           = var.connection
    "APPINSIGHTS_PORTALINFO"                          = var.appinsights
    "API_KEY_SECRET"                                  = random_string.api_key_secret.result
  }

  identity {
    type = var.identity
  }
}

resource "azurerm_static_site" "react" {
  name                = "swa-nanaykuna-dev-tf-eastus2-backoffice-ui"
  location            = "eastus2"
  resource_group_name = var.group
  tags = {
    created_by  = var.created
    environment = var.environment
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "react" {
  subnet_id      = var.public
  app_service_id = azurerm_linux_web_app.react.id
}
