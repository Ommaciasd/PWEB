#---------------------------------------------------
# Application Insights Creation - Default is "true"
#---------------------------------------------------
resource "azurerm_application_insights" "insights" {
  name                 = local.insights
  location             = local.location
  application_type     = local.type
  resource_group_name  = local.group

  tags = {
    environment = local.environment
  }
}
