resource "azurerm_resource_group" "logging" {
  name     = var.logging_resource_group_name
  location = var.logging_resource_group_location
}

