resource "azurerm_network_interface" "connectivity-hub" {
  name                = "nic-connectivity-hub-${var.connectivity_location}"
  location            = var.connectivity_location
  resource_group_name = azurerm_resource_group.connectivity.name

  ip_configuration {
    name                          = "ipconfig-connectivity-hub-${var.connectivity_location}"
    subnet_id                     = azurerm_subnet.nva_untrust.id
    private_ip_address_allocation = "Dynamic"
  }
}
