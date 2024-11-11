resource "azurerm_bastion_host" "management_bastion" {
  name                = var.management_bastion_name
  location            = var.management_bastion_location
  resource_group_name = azurerm_resource_group.management_bastion_resource_group.name
  tags                = var.management_bastion_tags
  sku                 = "Standard"
  copy_paste_enabled  = true
  file_copy_enabled   = true

  ip_configuration {
    name                 = "${var.management_bastion_name}-bastion-ip"
    subnet_id            = azurerm_subnet.management_bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.management_bastion_ip.id
  }
}
