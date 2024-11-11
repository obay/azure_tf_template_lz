# Create virtual network and subnet for management VM
resource "azurerm_virtual_network" "management_vm_vnet" {
  name                = var.management_vm_vnet_name
  location            = var.management_vm_location
  resource_group_name = azurerm_resource_group.management_vm_resource_group.name
  address_space       = var.management_vm_address_space
  tags                = var.management_vm_tags
}
