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
resource "azurerm_subnet" "function" {
  resource_group_name  = local.group
  name                 = local.function
  address_prefixes     = [local.private]
  virtual_network_name = azurerm_virtual_network.apps.name
}

resource "azurerm_subnet" "web" {
  delegation {
    name = local.dweb

    service_delegation {
      actions = [local.actions]
      name    = local.microsoft
    }
  }

  name                 = local.web
  resource_group_name  = local.group
  address_prefixes     = [local.public]
  virtual_network_name = azurerm_virtual_network.apps.name
}

resource "azurerm_subnet" "pfunction" {
  delegation {
    name = local.difunction

    service_delegation {
      actions = [local.actions]
      name    = local.microsoft
    }
  }

  resource_group_name  = local.group
  name                 = local.ifunction
  address_prefixes     = [local.pfunction]
  virtual_network_name = azurerm_virtual_network.apps.name
}

#-----------------------------------------
# Interfaces Creation - Default is "true"
#-----------------------------------------
/* resource "azurerm_network_interface" "apps" {
  name                = "azurerm_network_interface_apps"
  location            = local.location
  resource_group_name = local.group

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.web.id
    private_ip_address_allocation = "Dynamic"
  }
} */

#-----------------------------------------
# DNS Integration - Default is "true"
#-----------------------------------------
resource "azurerm_virtual_network_dns_servers" "apps" {
  virtual_network_id = azurerm_virtual_network.apps.id
  dns_servers        = ["10.7.7.2", "10.7.7.7", "10.7.7.1"]
}

/* #-----------------------------------------
# Application Gateway - Default is "true"
#-----------------------------------------
resource "azurerm_public_ip" "apps" {
  name                = "my-public-ip"
  resource_group_name = local.group
  location            = local.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "apps" {
  name                = "my-nic"
  resource_group_name = local.group
  location            = local.location

  ip_configuration {
    name                          = "my-ip-config"
#   subnet_id                     = azurerm_subnet.apps.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.apps.id
  }
}

resource "azurerm_application_gateway" "apps" {
  name                = "my-app-gateway"
  resource_group_name = local.group
  location            = local.location
  sku                 = "Standard_v2"
  capacity            = 2

  gateway_ip_configuration {
    name      = "my-gateway-ip-config"
#   subnet_id = azurerm_subnet.apps.id
  }

  frontend_port {
    name = "my-frontend-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "my-frontend-ip-config"
    public_ip_address_id = azurerm_public_ip.apps.id
  }

  http_listener {
    name                           = "my-http-listener"
    frontend_ip_configuration_name = azurerm_application_gateway.apps.frontend_ip_configuration[0].name
#   frontend_port_name             = azurerm_application_gateway.apps.frontend_port[0].name
    protocol                       = "Http"
  }

  backend_address_pool {
    name = "my-backend-pool"
  }

  backend_http_settings {
    name                  = "my-backend-http-settings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
  }

  http_load_balancing_rule {
    name                           = "my-http-lb-rule"
    frontend_ip_configuration_name = azurerm_application_gateway.apps.frontend_ip_configuration[0].name
    frontend_port_name             = azurerm_application_gateway.apps.frontend_port[0].name
    backend_address_pool_name      = azurerm_application_gateway.apps.backend_address_pool[0].name
    backend_http_settings_name     = azurerm_application_gateway.apps.backend_http_settings[0].name
  }

  tags = {
    environment = local.environment
    created_by  = "terraform"
  }
} */
