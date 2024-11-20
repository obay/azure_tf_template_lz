module "connectivity_primary" {
  source                                            = "./modules/connectivity"
  connectivity_location                             = var.primary_region
  connectivity_resource_group_name                  = var.connectivity_primary_resource_group_name
  connectivity_virtual_network_name                 = var.connectivity_primary_virtual_network_name
  connectivity_virtual_network_address_space        = var.connectivity_primary_virtual_network_address_space
  connectivity_subscription_id                      = var.subscription_id_connectivity
  caf_enterprise_scale_management_group             = module.caf-enterprise-scale.azurerm_management_group
  connectivity_gateway_subnet_name                  = var.connectivity_primary_gateway_subnet_name
  connectivity_gateway_subnet_address_prefixes      = var.connectivity_primary_gateway_subnet_address_prefixes
  connectivity_nva_trust_subnet_name                = var.connectivity_primary_nva_trust_subnet_name
  connectivity_nva_trust_subnet_address_prefixes    = var.connectivity_primary_nva_trust_subnet_address_prefixes
  connectivity_nva_untrust_subnet_name              = var.connectivity_primary_nva_untrust_subnet_name
  connectivity_nva_untrust_subnet_address_prefixes  = var.connectivity_primary_nva_untrust_subnet_address_prefixes
  connectivity_dns_resolver_subnet_name             = var.connectivity_primary_dns_resolver_subnet_name
  connectivity_dns_resolver_subnet_address_prefixes = var.connectivity_primary_dns_resolver_subnet_address_prefixes
}
