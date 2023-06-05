#---------------------------------------
# SGroup Creation - Default is "true"
#---------------------------------------
resource "azurerm_network_security_group" "apps" {
  tags = {
    created_by  = local.created
    environment = local.environment
  }

  name                = local.apps
  resource_group_name = local.group
  location            = local.location

# Inbound Rules.
  security_rule {
    name                       = "RDP"
    source_address_prefix      = local.all
    destination_port_range     = local.all
    destination_address_prefix = local.all
    source_port_range          = local.port
    access                     = local.allow
    protocol                   = local.protocol
    priority                   = local.priority4
    direction                  = local.direction
  }


  security_rule {
    protocol                   = local.all
    source_port_range          = local.all
    destination_port_range     = local.all
    source_address_prefix      = local.all
    destination_address_prefix = local.all
    access                     = local.access2
    direction                  = local.direction
    priority                   = local.priority2
    name                       = "DenyAllInBound"
  }
  
  security_rule {
    protocol                   = local.all
    source_port_range          = local.all
    destination_port_range     = local.all
    source_address_prefix      = local.all
    destination_address_prefix = local.all
    access                     = local.access2
    priority                   = local.priority2
    direction                  = local.direction2
    name                       = "DenyAllOutbound"
  }

  security_rule {
    source_port_range          = local.all
    destination_port_range     = local.all
    access                     = local.access
    source_address_prefix      = local.source
    destination_address_prefix = local.source
    protocol                   = local.protocol
    priority                   = local.priority
    direction                  = local.direction
    name                       = "AllowVnetInBound"
  }

# Outbound Security Rules.
  security_rule {
    protocol                   = local.all
    source_port_range          = local.all
    destination_port_range     = local.all
    access                     = local.access
    source_address_prefix      = local.source
    destination_address_prefix = local.source
    priority                   = local.priority
    direction                  = local.direction2
    name                       = "AllowVnetOutbound"
  }

  security_rule {
    protocol                   = local.all
    source_port_range          = local.all
    destination_port_range     = local.all
    source_address_prefix      = local.all
    destination_address_prefix = "Internet"
    access                     = local.access
    priority                   = local.priority3
    direction                  = local.direction2
    name                       = "AllowInternetOutBound"
  }

  security_rule {
    protocol                   = local.all
    source_port_range          = local.all
    destination_port_range     = local.all
    destination_address_prefix = local.all
    access                     = local.access
    direction                  = local.direction
    priority                   = local.priority3
    source_address_prefix      = "AzureLoadBalancer"
    name                       = "AllowAzureLoadBalancerInBound"
  }
}
