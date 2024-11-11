resource "azurerm_subnet" "management_bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.management_vm_resource_group_name
  virtual_network_name = var.management_vm_vnet_name
  address_prefixes     = var.management_bastion_subnet_address_prefixes
}
