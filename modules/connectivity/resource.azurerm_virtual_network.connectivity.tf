resource "azurerm_virtual_network" "connectivity" {
  name                = var.connectivity_virtual_network_name
  location            = var.connectivity_location
  resource_group_name = azurerm_resource_group.connectivity.name
  address_space       = var.connectivity_virtual_network_address_space
}
