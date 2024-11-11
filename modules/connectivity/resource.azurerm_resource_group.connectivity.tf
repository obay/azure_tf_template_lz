resource "azurerm_resource_group" "connectivity" {
  name     = var.connectivity_resource_group_name
  location = var.connectivity_location
}
