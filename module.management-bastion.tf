module "management-bastion" {
  source                                     = "./modules/management/bastion"
  management_bastion_name                    = var.management_bastion_name
  management_bastion_location                = var.primary_region
  management_bastion_resource_group_name     = var.management_bastion_resource_group_name
  management_bastion_tags                    = var.management_bastion_tags
  management_bastion_subscription_id         = var.subscription_id_management
  management_bastion_address_space           = var.management_bastion_address_space
  management_bastion_subnet_address_prefixes = var.management_bastion_subnet_address_prefixes
  management_bastion_vnet_name               = module.management-vm.management_vm_vnet_name
  management_vm_resource_group_name          = module.management-vm.management_vm_resource_group_name
  management_vm_vnet_name                    = module.management-vm.management_vm_vnet_name
}
