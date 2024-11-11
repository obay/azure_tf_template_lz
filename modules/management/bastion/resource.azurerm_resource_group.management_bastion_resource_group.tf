# Create resource group for management VM
resource "azurerm_resource_group" "management_bastion_resource_group" {
  name     = var.management_bastion_resource_group_name
  location = var.management_bastion_location
}
