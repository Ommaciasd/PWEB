#-------------------------------------
# VNET Creation - Default is "true"
#-------------------------------------
resource "azurerm_virtual_network" "apps" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  name                = local.apps
  resource_group_name = local.group
  location            = local.location
  address_space       = [local.network]
}

#-------------------------------------
# SNETs Creation - Default is "true"
#-------------------------------------
resource "azurerm_subnet" "subnet" {
  for_each              = { for idx, subnet in var.subnet : idx => subnet }
  resource_group_name  = local.group
  address_prefixes     = [each.value.address_prefix]
  virtual_network_name = azurerm_virtual_network.apps.name
  name                 = "${local.name}-${tostring(each.value.name)}"
}

resource "azurerm_subnet" "gateway" {
  delegation {
    name  = "${local.name}-${tostring(each.value.name)}-${local.delegation}"

    service_delegation {
      actions = [local.actions]
      name    = local.microsoft
    }
  }

  resource_group_name  = local.group
  for_each             = { for idx, gateway in var.gateway : idx => gateway }
  address_prefixes     = [each.value.address_prefix]
  virtual_network_name = azurerm_virtual_network.apps.name
  name                 = "${local.name}-${tostring(each.value.name)}"
}
