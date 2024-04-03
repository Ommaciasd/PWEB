// modules/postgresql_flexible_server/main.tf

resource "azurerm_postgresql_flexible_server" "example" {
  name                = var.server_name
  resource_group_name = data.azurerm_resource_group.existing_resource_group.name
  location            = data.azurerm_resource_group.existing_resource_group.location

  identity {
    type            = "UserAssigned"
    identity_ids = [var.id]
  }
}
