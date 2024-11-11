module "identity_secondary" {
  source                                 = "./modules/identity"
  identity_location                      = var.secondary_region
  identity_resource_group_name           = var.identity_secondary_resource_group_name
  identity_subnet_name                   = var.identity_secondary_subnet_name
  identity_virtual_network_name          = var.identity_secondary_virtual_network_name
  identity_virtual_network_address_space = var.identity_secondary_virtual_network_address_space
  identity_subnet_address_prefixes       = var.identity_secondary_subnet_address_prefixes
  identity_subscription_id               = var.subscription_id_identity
  caf_enterprise_scale_management_group  = module.caf-enterprise-scale.azurerm_management_group
}
