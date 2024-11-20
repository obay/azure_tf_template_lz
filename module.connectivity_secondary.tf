module "connectivity_secondary" {
  source                                            = "./modules/connectivity"
  connectivity_location                             = var.secondary_region
  connectivity_resource_group_name                  = var.connectivity_secondary_resource_group_name
  connectivity_virtual_network_name                 = var.connectivity_secondary_virtual_network_name
  connectivity_virtual_network_address_space        = var.connectivity_secondary_virtual_network_address_space
  connectivity_subscription_id                      = var.subscription_id_connectivity
  caf_enterprise_scale_management_group             = module.caf-enterprise-scale.azurerm_management_group
  connectivity_gateway_subnet_name                  = var.connectivity_secondary_gateway_subnet_name
  connectivity_gateway_subnet_address_prefixes      = var.connectivity_secondary_gateway_subnet_address_prefixes
  connectivity_nva_trust_subnet_name                = var.connectivity_secondary_nva_trust_subnet_name
  connectivity_nva_trust_subnet_address_prefixes    = var.connectivity_secondary_nva_trust_subnet_address_prefixes
  connectivity_nva_untrust_subnet_name              = var.connectivity_secondary_nva_untrust_subnet_name
  connectivity_nva_untrust_subnet_address_prefixes  = var.connectivity_secondary_nva_untrust_subnet_address_prefixes
  connectivity_dns_resolver_subnet_name             = var.connectivity_secondary_dns_resolver_subnet_name
  connectivity_dns_resolver_subnet_address_prefixes = var.connectivity_secondary_dns_resolver_subnet_address_prefixes
}
