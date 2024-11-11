resource "azurerm_subnet" "identity" {
  name                 = var.identity_subnet_name
  resource_group_name  = azurerm_resource_group.identity.name
  virtual_network_name = azurerm_virtual_network.identity.name
  address_prefixes     = var.identity_subnet_address_prefixes
}
