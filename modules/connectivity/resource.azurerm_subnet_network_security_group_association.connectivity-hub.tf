resource "azurerm_subnet_network_security_group_association" "connectivity-hub" {
  subnet_id                 = azurerm_subnet.connectivity.id
  network_security_group_id = azurerm_network_security_group.connectivity-hub.id
}
