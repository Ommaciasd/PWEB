resource "random_string" "api_key_secret" {
  length           = var.length
  upper            = var.active
  special          = var.active
  override_special = var.override_special
}

resource "azurerm_linux_function_app" "functions" {
  tags = {
    created_by  = var.created
    environment = var.environment
  }

  service_plan_id      = var.plan
  resource_group_name  = var.group
  storage_account_name = var.storage
  location             = var.location
  name                 = format ( "lfa-%s-%s-tf-%s-%s", var.assetname, var.environment, var.location, var.app )
  site_config {
    always_on = var.active

    ip_restriction {
      priority   = 1
      action     = "Deny"
      ip_address = "0.0.0.0/0"
      name       = "Block Access Public"
    }
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE"                        = 1
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS"              = 2
    "ApplicationInsightsAgent_EXTENSION_VERSION"      = 3
    "FUNCTIONS_EXTENSION_VERSION"                     = "~4"
    "AzureWebJobsSecretStorageType"                   = "File"
    "TZ"                                              = var.tz
    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = var.key
    "FUNCTIONS_WORKER_RUNTIME"                        = "dotnet"
    "APPINSIGHTS_PORTALINFO"                          = "ASP.NET"
    "WEBSITE_ENABLE_SYNC_UPDATE_SITE"                 = var.active
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"             = var.active
    "SnapshotDebugger_EXTENSION_VERSION"              = var.feature
    "APPINSIGHTS_PROFILERFEATURE_VERSION"             = var.feature
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"             = var.feature
    "DiagnosticServices_EXTENSION_VERSION"            = var.feature
    "XDT_MicrosoftApplicationInsights_Mode"           = var.feature
    "InstrumentationEngine_EXTENSION_VERSION"         = var.feature
    "XDT_MicrosoftApplicationInsights_PreemptSdk"     = var.feature
    "XDT_MicrosoftApplicationInsights_BaseExtensions" = var.feature
    "WEBSITE_TIME_ZONE"                               = "America/Lima"
    "FUNCTION_ENVIRONMENT"                            = var.aspnetcore
    "APPLICATIONINSIGHTS_CONNECTION_STRING"           = var.connection
    "AzureWebJobsStorage"                             = var.AzureWebJobsStorage
    "API_KEY_SECRET"                                  = random_string.api_key_secret.result
<<<<<<< HEAD
=======
    "AzureWebJobsStorage"                             = "DefaultEndpointsProtocol=https;AccountName=storageaccountsfundev;AccountKey=BIC2buLKlT7Evwwy/ix9jRRmVt6fsKB/Z6Mwpz4uWB2H13zaEXFI8p0KDrrnypK7P0QBeO8QKmpJ+AStnhKEag==;EndpointSuffix=core.windows.net"
>>>>>>> 5bae8a2e89c9e698370e895c982826da48e358a4
    "DATABASE_CONNECTION_STRING"                      = "Server=tcp:dev-nanaykuna.database.windows.net,1433;Initial Catalog=SupportDb;Persist Security Info=False;User ID=nanaykuna-db-admin;Password=6zLrZUDbbL8gLYzu0v7T3RL4;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }

  identity {
    type = var.identity
  }
}

resource "azurerm_private_endpoint" "functions" {
  resource_group_name = var.group
  subnet_id           = var.private
  location            = var.location
  name                = format ( "pe-%s-%s-tf-%s-%s", var.assetname, var.environment, var.location, var.app )

  private_service_connection {
    is_manual_connection           = false
    subresource_names              = ["sites"]
    private_connection_resource_id = azurerm_linux_function_app.functions.id
    name                           = format ( "psce-%s-%s-tf-%s-%s", var.assetname, var.environment, var.location, var.app )
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "functions" {
  subnet_id      = var.pfunction
  app_service_id = azurerm_linux_function_app.functions.id
}
