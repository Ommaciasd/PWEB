#-------------------------------------
# VNET Creation - Default is "true"
#-------------------------------------
resource "azurerm_virtual_network" "apps" {
  tags = {
    created_by  = var.created
    environment = var.environment
  }

  name                = local.apps
  resource_group_name = var.group
  location            = var.location
  address_space       = var.network
}

#-------------------------------------
# SNETs Creation - Default is "true"
#-------------------------------------
resource "azurerm_subnet" "privates" {
  for_each              = { for idx, subnet in var.subnet : idx => subnet }
  resource_group_name  = var.group
  address_prefixes     = [each.value.address_prefix]
  virtual_network_name = azurerm_virtual_network.apps.name
  name                 = "${local.name}-${tostring(each.value.name)}"

  lifecycle {
    prevent_destroy = false
  }

  dynamic "delegation" {
    for_each = each.value.delegation != null ? [each.value.delegation] : []
    content {
      name = delegation.value.name
      service_delegation {
        name    = var.delegation
        actions = [var.actions]
      }
    }
  }
}

resource "azurerm_subnet" "public" {
  delegation {
    name  = "${local.name}-${tostring(each.value.name)}-${var.delegation}"

    service_delegation {
      actions = [var.actions]
      name    = var.microsoft
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
