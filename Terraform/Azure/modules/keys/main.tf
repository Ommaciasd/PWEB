resource "azurerm_virtual_network" "apps" {
  tags = {
    created_by  = var.created
    environment = var.environment
  }

  name                = local.apps
  resource_group_name = var.group
  location            = var.location
  address_space       = [var.network]
}

resource "azurerm_subnet" "subnet" {
  for_each              = { for idx, subnet in var.subnet : idx => subnet }
  resource_group_name  = var.group
  address_prefixes     = [each.value.address_prefix]
  virtual_network_name = azurerm_virtual_network.apps.name
  name                 = "${local.name}-${tostring(each.value.name)}"

  lifecycle {
    prevent_destroy = false
  }
}

resource "azurerm_subnet" "gateway" {
  delegation {
    name  = "${local.name}-${tostring(each.value.name)}-delegation"

    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      name    = "Microsoft.Web/serverFarms"
    }
  }

  resource_group_name  = var.group
  for_each             = { for idx, gateway in var.gateway : idx => gateway }
  address_prefixes     = [each.value.address_prefix]
  virtual_network_name = azurerm_virtual_network.apps.name
  name                 = "${local.name}-${tostring(each.value.name)}"

  lifecycle {
    prevent_destroy = false
  }
}
