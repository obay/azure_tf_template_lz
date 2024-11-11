module "identity_primary" {
  source                                 = "./modules/identity"
  identity_location                      = var.primary_region
  identity_resource_group_name           = var.identity_primary_resource_group_name
  identity_subnet_name                   = var.identity_primary_subnet_name
  identity_virtual_network_name          = var.identity_primary_virtual_network_name
  identity_virtual_network_address_space = var.identity_primary_virtual_network_address_space
  identity_subnet_address_prefixes       = var.identity_primary_subnet_address_prefixes
  identity_subscription_id               = var.subscription_id_identity
  caf_enterprise_scale_management_group  = module.caf-enterprise-scale.azurerm_management_group
}
