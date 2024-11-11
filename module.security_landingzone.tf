module "security_landingzone" {
  source                                 = "./modules/security"
  security_parent_management_group_id    = var.security_parent_management_group_id
  security_subscription_id               = var.subscription_id_security
  security_management_group_display_name = "Security"
  security_management_group_name         = "mg-cpkcr-security"


  caf_enterprise_scale_management_group = module.caf-enterprise-scale.azurerm_management_group
}
