# Create Resources Groups
resource "azurerm_resource_group" "vm" {
  name     = local.vm
  location = local.location

  tags = {
    environment = local.environment
  }
}

resource "azurerm_resource_group" "apps" {
  name     = local.apps
  location = local.location

  tags = {
    environment = local.environment
  }
}

resource "azurerm_resource_group" "storage" {
  name     = local.storage
  location = local.location

  tags = {
    environment = local.environment
  }
}

resource "azurerm_resource_group" "networking" {
  name     = local.networking
  location = local.location

  tags = {
    environment = local.environment
  }
}
