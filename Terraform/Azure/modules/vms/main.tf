resource "azurerm_network_interface" "robot" {
  name                      = "my-network-interface"
  location                  = local.location
  resource_group_name       = local.group
  ip_configuration {
    name                          = "my-ip-configuration"
    subnet_id                     = local.private
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "robot" {
  name                  = local.vm
  location              = local.location
  resource_group_name   = local.group
  network_interface_ids = [azurerm_network_interface.robot.id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-10"
    sku       = "20h2-evd"
    version   = "latest"
  }

  storage_os_disk {
    name              = "my-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "myvm"
    admin_username = "adminuser"
    admin_password = "Password1234!"
  }

  os_profile_windows_config {
    enable_automatic_upgrades = true
  }
}
