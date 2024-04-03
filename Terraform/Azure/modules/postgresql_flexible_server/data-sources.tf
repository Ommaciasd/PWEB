//modules/postgresql_flexible_server/data-sources.tf

data "azurerm_resource_group" "existing_resource_group" {
  name = var.group
}

# data "azurerm_user_assigned_identity" "existing_azurerm_user_assigned_identity" {
#   name = var.user_assigned_identity_name
# }
