resource "azurerm_subnet" "dns_resolver" {
  name                 = var.connectivity_dns_resolver_subnet_name
  resource_group_name  = azurerm_resource_group.connectivity.name
  virtual_network_name = azurerm_virtual_network.connectivity.name
  address_prefixes     = var.connectivity_dns_resolver_subnet_address_prefixes
}
