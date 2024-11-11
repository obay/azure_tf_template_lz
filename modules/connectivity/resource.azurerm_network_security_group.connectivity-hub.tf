resource "azurerm_network_security_group" "connectivity-hub" {
  name                = "nsg-connectivity-hub-${var.connectivity_location}"
  location            = var.connectivity_location
  resource_group_name = var.connectivity_resource_group_name

  security_rule {
    name                       = "allow-https"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
