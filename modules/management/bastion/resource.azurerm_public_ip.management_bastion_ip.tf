resource "azurerm_public_ip" "management_bastion_ip" {
  name                = "${var.management_bastion_name}-ip"
  location            = var.management_bastion_location
  resource_group_name = azurerm_resource_group.management_bastion_resource_group.name
  allocation_method   = "Static"
  sku                 = "Standard"
}
