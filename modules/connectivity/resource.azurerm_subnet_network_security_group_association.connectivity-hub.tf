resource "azurerm_subnet_network_security_group_association" "connectivity-hub" {
  subnet_id                 = azurerm_subnet.nva_untrust.id
  network_security_group_id = azurerm_network_security_group.connectivity-hub.id
}
