module "functions_net_core" {
  source = "./modules/function-netcore"
  func-service-name-netcore = "${var.env}-shipping-reports"
  resource_group_name = var.resource_group_name
  
  service-plan-id    = module.service_plan_function.service_plan_function
  storage-name       = module.storage_account_function.storage_account_name
  primary_access_key = module.storage_account_function.storage-primary-access-key

  app_settings = {
    "AzureWebJobsSecretStorageType"       ="File"
    "Quickcomm.AuthorityBaseUrl"          ="https://dev-nan-services-identity.azurewebsites.net"
    "Quickcomm.BaseUrl"                   ="https://nanaykuna-dev-api.azure-api.net/"
    "Quickcomm.ClientId"                  ="d8501a5d-455e-4fe9-99ee-1bc21869aa8e"
    "Quickcomm.ClientSecret"              ="0LXrhb6Rq9pFX1Zd84k7sLKQ+qudIbhhyEd4WvekEiA="
    "ReportBlobcontainer"                 ="dev-shipping-reports"
    "ReportDatamartTable"                 ="DatamartItemsdev" 
    "ReportRouteConfirmationTable"        ="RouteConfirmationReportItemsdev" 
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" ="true" 
    "WEBSITE_ENABLE_SYNC_UPDATE_SITE"     ="true"
    #APPINSIGHTS_INSTRUMENTATIONKEY        = var.app-insight-instrumentation-key
    #APPLICATIONINSIGHTS_CONNECTION_STRING = var.app-insight-connection-string
    TZ="America/Lima"
    #DATABASE_CONNECTION_STRING=var.db-connection-string
  }
    allowed_origins =  ["https://backoffice-dev.progresolplus.pe", "https://portal.azure.com","https://noprodshippingreports.blob.core.windows.net"]
}

module "functions_net_core_customer_loyalty" {
  source = "./modules/function-netcore"
  func-service-name-netcore = "${var.env}-customer-loyalty"
  resource_group_name = var.resource_group_name
  
  service-plan-id    = module.service_plan_function.service_plan_function
  storage-name       = module.storage_account_function.storage_account_name
  primary_access_key = module.storage_account_function.storage-primary-access-key

  app_settings = {
    #APPINSIGHTS_INSTRUMENTATIONKEY        = var.app-insight-instrumentation-key
    #APPLICATIONINSIGHTS_CONNECTION_STRING = var.app-insight-connection-string
    TZ="America/Lima"
    DATABASE_CONNECTION_STRING= "Server=tcp:dev-nanaykuna.database.windows.net,1433;Initial Catalog=SupportDb;Persist Security Info=False;User ID=nanaykuna-db-admin;Password=6zLrZUDbbL8gLYzu0v7T3RL4;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
    allowed_origins =  ["https://portal.azure.com"]
}


module "functions_net_core_marketing" {
  source = "./modules/function-netcore"
  func-service-name-netcore = "${var.env}-marketing"
  resource_group_name = var.resource_group_name
  
  service-plan-id    = module.service_plan_function.service_plan_function
  storage-name       = module.storage_account_function.storage_account_name
  primary_access_key = module.storage_account_function.storage-primary-access-key

  app_settings = {
    #APPINSIGHTS_INSTRUMENTATIONKEY        = var.app-insight-instrumentation-key
    #APPLICATIONINSIGHTS_CONNECTION_STRING = var.app-insight-connection-string
    TZ="America/Lima"
    DATABASE_CONNECTION_STRING= "Server=tcp:dev-nanaykuna.database.windows.net,1433;Initial Catalog=SupportDb;Persist Security Info=False;User ID=nanaykuna-db-admin;Password=6zLrZUDbbL8gLYzu0v7T3RL4;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
    allowed_origins =  ["https://backoffice-dev.progresolplus.pe"]
}

module "functions_net_core_notification" {
  source = "./modules/function-netcore"
  func-service-name-netcore = "${var.env}-notification"
  resource_group_name = var.resource_group_name
  
  service-plan-id    = module.service_plan_function.service_plan_function
  storage-name       = module.storage_account_function.storage_account_name
  primary_access_key = module.storage_account_function.storage-primary-access-key

  app_settings = {
    #APPINSIGHTS_INSTRUMENTATIONKEY        = var.app-insight-instrumentation-key
    #APPLICATIONINSIGHTS_CONNECTION_STRING = var.app-insight-connection-string
    TZ="America/Lima"
    DATABASE_CONNECTION_STRING= "Server=tcp:dev-nanaykuna.database.windows.net,1433;Initial Catalog=SupportDb;Persist Security Info=False;User ID=nanaykuna-db-admin;Password=6zLrZUDbbL8gLYzu0v7T3RL4;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
    allowed_origins =  ["https://portal.azure.com"]
}

module "functions_net_core_payments" {
  source = "./modules/function-netcore"
  func-service-name-netcore = "${var.env}-payments"
  resource_group_name = var.resource_group_name
  
  service-plan-id    = module.service_plan_function.service_plan_function
  storage-name       = module.storage_account_function.storage_account_name
  primary_access_key = module.storage_account_function.storage-primary-access-key

  app_settings = {
    #APPINSIGHTS_INSTRUMENTATIONKEY        = var.app-insight-instrumentation-key
    #APPLICATIONINSIGHTS_CONNECTION_STRING = var.app-insight-connection-string
    TZ="America/Lima"
    DATABASE_CONNECTION_STRING= "Server=tcp:dev-nanaykuna.database.windows.net,1433;Initial Catalog=SupportDb;Persist Security Info=False;User ID=nanaykuna-db-admin;Password=6zLrZUDbbL8gLYzu0v7T3RL4;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
    allowed_origins =  ["https://portal.azure.com"]
}

module "functions_net_core_products" {
  source = "./modules/function-netcore"
  func-service-name-netcore = "${var.env}-products"
  resource_group_name = var.resource_group_name
  
  service-plan-id    = module.service_plan_function.service_plan_function
  storage-name       = module.storage_account_function.storage_account_name
  primary_access_key = module.storage_account_function.storage-primary-access-key

  app_settings = {
    #APPINSIGHTS_INSTRUMENTATIONKEY        = var.app-insight-instrumentation-key
    #APPLICATIONINSIGHTS_CONNECTION_STRING = var.app-insight-connection-string
    TZ="America/Lima"
    #DATABASE_CONNECTION_STRING= "Server=tcp:dev-nanaykuna.database.windows.net,1433;Initial Catalog=SupportDb;Persist Security Info=False;User ID=nanaykuna-db-admin;Password=6zLrZUDbbL8gLYzu0v7T3RL4;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
    allowed_origins =  ["https://portal.azure.com"]
}

module "functions_net_core_shipping_dates" {
  source = "./modules/function-netcore"
  func-service-name-netcore = "${var.env}-shipping-dates"
  resource_group_name = var.resource_group_name
  
  service-plan-id    = module.service_plan_function.service_plan_function
  storage-name       = module.storage_account_function.storage_account_name
  primary_access_key = module.storage_account_function.storage-primary-access-key

  app_settings = {
    #APPINSIGHTS_INSTRUMENTATIONKEY        = var.app-insight-instrumentation-key
    #APPLICATIONINSIGHTS_CONNECTION_STRING = var.app-insight-connection-string
    TZ="America/Lima"
    DATABASE_CONNECTION_STRING= "Server=tcp:dev-nanaykuna.database.windows.net,1433;Initial Catalog=SupportDb;Persist Security Info=False;User ID=nanaykuna-db-admin;Password=6zLrZUDbbL8gLYzu0v7T3RL4;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
    allowed_origins =  ["https://portal.azure.com"]
}

module "functions_net_core_shipping_experience" {
  source = "./modules/function-netcore"
  func-service-name-netcore = "${var.env}-shipping-experience"
  resource_group_name = var.resource_group_name
  
  service-plan-id    = module.service_plan_function.service_plan_function
  storage-name       = module.storage_account_function.storage_account_name
  primary_access_key = module.storage_account_function.storage-primary-access-key

  app_settings = {
    #APPINSIGHTS_INSTRUMENTATIONKEY        = var.app-insight-instrumentation-key
    #APPLICATIONINSIGHTS_CONNECTION_STRING = var.app-insight-connection-string
    TZ="America/Lima"
    DATABASE_CONNECTION_STRING= "Server=tcp:dev-nanaykuna.database.windows.net,1433;Initial Catalog=SupportDb;Persist Security Info=False;User ID=nanaykuna-db-admin;Password=6zLrZUDbbL8gLYzu0v7T3RL4;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
    allowed_origins =  ["https://portal.azure.com"]
}
