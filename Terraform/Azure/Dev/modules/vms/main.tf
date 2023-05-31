#-------------------------------------
# VM Creation - Default is "true"
#-------------------------------------
resource "azurerm_network_interface" "agents" {
  name                = local.vms
  resource_group_name = "rg-nanaykuna-dev-tf-eastus-vms"
  location            = local.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/d11da572-d15e-42c4-a61c-9bd28afc17ce/resourceGroups/rg-nanaykuna-dev-tf-eastus-networking/providers/Microsoft.Network/virtualNetworks/apps/subnets/s-nanaykuna-dev-tf-eastus-gw-01"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "agents" {
  name                = "agents-machine"
  resource_group_name = local.group
  location            = local.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.agents.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }

  tags = {
    environment = local.environment
    created_by  = "terraform"
  }
}
