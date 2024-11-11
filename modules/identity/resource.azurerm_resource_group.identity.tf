# Create identity resource group
resource "azurerm_resource_group" "identity" {
  name     = var.identity_resource_group_name
  location = var.identity_location
}
