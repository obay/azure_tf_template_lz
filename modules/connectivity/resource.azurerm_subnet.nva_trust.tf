resource "azurerm_subnet" "nva_trust" {
  name                 = var.connectivity_nva_trust_subnet_name
  resource_group_name  = azurerm_resource_group.connectivity.name
  virtual_network_name = azurerm_virtual_network.connectivity.name
  address_prefixes     = var.connectivity_nva_trust_subnet_address_prefixes
}
