resource "azurerm_virtual_machine" "palo_alto" {
  name                  = "vm-connectivity-hub-${var.connectivity_location}"
  location              = var.connectivity_location
  resource_group_name   = azurerm_resource_group.connectivity.name
  network_interface_ids = [azurerm_network_interface.connectivity-hub.id]
  vm_size               = "Standard_D3_v2"

  plan {
    name      = "byol"
    product   = "vmseries1"
    publisher = "paloaltonetworks"
  }

  storage_image_reference {
    publisher = "paloaltonetworks"
    offer     = "vmseries1"
    sku       = "byol"
    version   = "latest"
  }

  storage_os_disk {
    name              = "osdisk-connectivity-hub-${var.connectivity_location}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "vm-connectivity-hub-${var.connectivity_location}"
    admin_username = "adminuser"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
