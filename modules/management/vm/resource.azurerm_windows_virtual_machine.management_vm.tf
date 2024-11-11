# Create a Windows 11 Virtual machine for management
resource "azurerm_windows_virtual_machine" "management_vm" {
  name                = var.management_vm_name
  computer_name       = var.management_vm_computer_name
  resource_group_name = azurerm_resource_group.management_vm_resource_group.name
  location            = var.management_vm_location
  size                = var.management_vm_size
  admin_username      = var.management_vm_admin_username
  admin_password      = var.management_vm_admin_password
  network_interface_ids = [
    azurerm_network_interface.management_vm_nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    name                 = "${var.management_vm_name}-osdisk"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-11"
    sku       = "win11-22h2-pro" # Windows 11 Pro, 22H2
    version   = "latest"
  }

  tags = var.management_vm_tags
}
