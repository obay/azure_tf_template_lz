resource "azurerm_network_interface" "management_vm_nic" {
  name                = "${var.management_vm_name}-nic"
  location            = var.management_vm_location
  resource_group_name = azurerm_resource_group.management_vm_resource_group.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.management_vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
