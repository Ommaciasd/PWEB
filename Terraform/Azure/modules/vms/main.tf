# resource "azurerm_network_interface" "robot" {
#   name                      = "my-network-interface"
#   location                  = local.location
#   resource_group_name       = local.group
#   ip_configuration {
#     name                          = "my-ip-configuration"
#     subnet_id                     = local.private
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_virtual_machine" "robot" {
#   name                  = local.vm
#   location              = local.location
#   resource_group_name   = local.group
#   network_interface_ids = [azurerm_network_interface.robot.id]
#   vm_size               = "Standard_DS1_v2"

#   storage_image_reference {
#     publisher = "MicrosoftWindowsDesktop"
#     offer     = "Windows-10"
#     sku       = "20h2-evd"
#     version   = "latest"
#   }

#   storage_os_disk {
#     name              = "my-os-disk"
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }

#   os_profile {
#     computer_name  = "myvm"
#     admin_username = "adminuser"
#     admin_password = "Password1234!"
#   }

#   os_profile_windows_config {
#     enable_automatic_upgrades = true
#   }
# }

locals {
  first_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+wWK73dCr+jgQOAxNsHAnNNNMEMWOHYEccp6wJm2gotpr9katuF/ZAdou5AaW1C61slRkHRkpRRX9FA9CYBiitZgvCCz+3nWNN7l/Up54Zps/pHWGZLHNJZRYyAB6j5yVLMVHIHriY49d/GZTZVNB8GoJv9Gakwc/fuEZYYl4YDFiGMBP///TzlI4jhiJzjKnEvqPFki5p2ZRJqcbCiF4pJrxUQR/RXqVFQdbRLZgYfJ8xGB878RENq3yQ39d8dVOkq4edbkzwcUmwwwkYVPIoDGsYLaRHnG+To7FvMeyO7xDVQkMKzopTQV8AuKpyvpqu0a9pWOMaiCyDytO7GGN you@me.com"
}

resource "azurerm_linux_virtual_machine_scale_set" "virtualset" {
  name                = local.lvmss
  location              = local.location
  resource_group_name   = local.group
  sku                 = "Standard_D2s_v3"
  instances           = 1
  admin_username      = "adminuser"
  zones               = ["1"]   # <-- Aquí es donde defines las zonas
  overprovision = false  # <-- Aquí es donde habilitas con "true" el overprovisioning
  platform_fault_domain_count = 1 # <-- Aquí es donde defines el recuento de dominios de error
  single_placement_group = false # <-- Aquí es donde defines single_placement_group con "true"

  admin_ssh_key {
    username   = "adminuser"
    public_key = local.first_public_key
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

computer_name_prefix = local.lvmss // Personaliza el nombre de las instancias aquí

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = local.lvmss
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = local.private
    }
  }

  boot_diagnostics {  # <-- Aquí es donde habilitas los diagnósticos de arranque
    storage_account_uri = local.set
  }

  identity {   # <-- Aquí es donde habilitas la identidad administrada por el sistema
    type = "SystemAssigned"
  }

  extension {
    name                 = "Microsoft.Azure.DevOps.Pipelines.Agent"
    publisher            = "Microsoft.VisualStudio.Services"
    type                 = "TeamServicesAgent"
    type_handler_version = "1.0"
    auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
      "commandToExecute": "echo hello"
    }
     SETTINGS
  }

  tags = {
    created_by  = local.created
    environment = local.environment
  }
}
