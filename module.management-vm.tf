module "management-vm" {
  source                                = "./modules/management/vm"
  management_vm_admin_username          = var.management_vm_admin_username
  management_vm_location                = var.primary_region
  management_vm_resource_group_name     = var.management_vm_resource_group_name
  management_vm_name                    = var.management_vm_name
  management_vm_computer_name           = var.management_vm_computer_name
  management_vm_tags                    = var.management_vm_tags
  management_vm_admin_password          = var.management_vm_admin_password
  management_vm_size                    = var.management_vm_size
  management_vm_subscription_id         = var.subscription_id_management
  management_vm_address_space           = var.management_vm_address_space
  management_vm_subnet_address_prefixes = var.management_vm_subnet_address_prefixes
  management_vm_vnet_name               = var.management_vm_vnet_name
  management_vm_subnet_name             = var.management_vm_subnet_name
}

output "management_vm_vnet_name" {
  value = module.management-vm.management_vm_vnet_name
}

output "management_vm_resource_group_name" {
  value = module.management-vm.management_vm_resource_group_name
}
