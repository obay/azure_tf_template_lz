module "caf-enterprise-scale" {
  source           = "Azure/caf-enterprise-scale/azurerm"
  version          = "6.1.0"
  root_parent_id   = data.azurerm_client_config.current.tenant_id
  root_id          = var.root_id
  root_name        = var.root_name
  default_location = var.primary_region

  subscription_id_connectivity = var.subscription_id_connectivity
  subscription_id_identity     = var.subscription_id_identity
  subscription_id_management   = var.subscription_id_management

  archetype_config_overrides = {
    "mg-platform" = {
      archetype_id = "es_platform"
    }
    "mg-connectivity" = {
      archetype_id = "es_connectivity"
    }
    "mg-identity" = {
      archetype_id = "es_identity"
    }
    "mg-management" = {
      archetype_id = "es_management"
    }
    "mg-security" = {
      archetype_id = "es_security"
    }
    "mg-landingzones" = {
      archetype_id = "es_landingzones"
    }
    "mg-corp" = {
      archetype_id = "es_corp"
    }
    "mg-online" = {
      archetype_id = "es_online"
    }
    "mg-sandbox" = {
      archetype_id = "es_sandbox"
    }
    "mg-decommissioned" = {
      archetype_id = "es_decommissioned"
    }
  }

  configure_connectivity_resources = {
    settings = {
      tags = var.connectivity_primary_tags
    }
  }

  configure_identity_resources = {
    tags = var.identity_primary_tags
  }

  configure_management_resources = {
    settings = {
      log_analytics = {
        enabled = true
        config = {
          retention_in_days                      = 30
          enable_monitoring_for_vm               = true
          enable_monitoring_for_vmss             = true
          enable_solution_for_vm_insights        = true
          enable_solution_for_container_insights = true
        }
      }
    }
    tags = var.management_primary_tags
  }

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
    # azurerm.identity     = azurerm
    # azurerm.security     = azurerm
  }
}
