# Create resource group for management VM
resource "azurerm_resource_group" "management_vm_resource_group" {
  name     = var.management_vm_resource_group_name
  location = var.management_vm_location
}

