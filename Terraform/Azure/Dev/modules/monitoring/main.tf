#---------------------------------------------------
# Application Insights Creation - Default is "true"
#---------------------------------------------------
resource "azurerm_application_insights" "apps" {
  name                 = local.apps
  application_type     = local.type
  resource_group_name  = local.group
  location             = local.location

  tags = {
    environment = local.environment
  }
}
