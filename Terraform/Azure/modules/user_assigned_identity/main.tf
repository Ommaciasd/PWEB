// modules/user_assigned_identity/main.tf

resource "azurerm_user_assigned_identity" "example" {
  name                = var.identity_name
  resource_group_name = var.group
  location =  var.location
}

