resource "azurerm_virtual_network" "identity" {
  name                = var.identity_virtual_network_name
  location            = var.identity_location
  resource_group_name = azurerm_resource_group.identity.name
  address_space       = var.identity_virtual_network_address_space
}
