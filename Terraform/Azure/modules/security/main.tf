#---------------------------------------
# SGroup Creation - Default is "true"
#---------------------------------------
resource "azurerm_network_security_group" "apps" {
  name                = local.apps
  location            = local.location
  resource_group_name = local.group

# Inbound Rules.
  security_rule {
        priority                   = 300
    name                       = "RDP"
    direction                  = "Inbound"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
        access                     = "Allow"
  }

  security_rule {
        priority                   = 65000
    name                       = "AllowVnetInBound"
    direction                  = "Inbound"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
        access                     = "Allow"
  }

  security_rule {
        priority                   = 65001
    name                       = "AllowAzureLoadBalancerInBound"
    direction                  = "Inbound"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "AzureLoadBalancer"
    destination_address_prefix = "*"
        access                     = "Allow"
  }

    security_rule {
        priority                   = 65500
    name                       = "DenyAllInBound"
    direction                  = "Inbound"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
        access                     = "Deny"
  }


# Outbound Security Rules.
  security_rule {
        priority                   = 65000
    name                       = "AllowVnetOutbound"
    direction                  = "Outbound"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
        access                     = "Allow"
  }

  security_rule {
        priority                   = 65001
    name                       = "AllowInternetOutBound"
    direction                  = "Outbound"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "Internet"
        access                     = "Allow"
  }

    security_rule {
        priority                   = 65500
    name                       = "DenyAllOutbound"
    direction                  = "Outbound"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
        access                     = "Deny"
  }

  tags = {
    environment = local.environment
  }
}
