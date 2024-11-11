resource "azurerm_subnet" "management_vm_subnet" {
  name                 = var.management_vm_subnet_name
  resource_group_name  = azurerm_resource_group.management_vm_resource_group.name
  virtual_network_name = azurerm_virtual_network.management_vm_vnet.name
  address_prefixes     = var.management_vm_subnet_address_prefixes
}
