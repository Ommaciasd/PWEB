#-------------------------------------
# VNET Creation - Default is "true"
#-------------------------------------
resource "azurerm_virtual_network" "apps" {
  location            = local.location
  name                = local.apps
  resource_group_name = local.group
  address_space       = [local.network]

  tags = {
    environment = local.environment
  }
}

#-------------------------------------
# SNETs Creation - Default is "true"
#-------------------------------------
resource "azurerm_subnet" "web" {
  name                 = local.web
  resource_group_name = local.group
  virtual_network_name = azurerm_virtual_network.apps.name
  address_prefixes     = [local.public]

  delegation {
    name = "${local.public}"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_subnet" "function" {
  name                 = local.function
  resource_group_name = local.group
  address_prefixes     = [local.private]
  virtual_network_name = azurerm_virtual_network.apps.name
  }

#-----------------------------------------
# Interfaces Creation - Default is "true"
#-----------------------------------------
resource "azurerm_network_interface" "main" {
  name                = local.apps
  location            = local.location
  resource_group_name = local.group

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.web.id
    private_ip_address_allocation = "Dynamic"
  }
}

#-----------------------------------------
# DNS Integration - Default is "true"
#-----------------------------------------
resource "azurerm_virtual_network_dns_servers" "apps" {
  virtual_network_id = azurerm_virtual_network.apps.id
  dns_servers        = ["10.7.7.2", "10.7.7.7", "10.7.7.1"]
}
