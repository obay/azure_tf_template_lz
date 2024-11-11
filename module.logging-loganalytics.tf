module "logging-loganalytics" {
  source                                   = "./modules/logging/loganalytics"
  logging_loganalytics_resource_group_name = module.logging-resourcegroup.logging_resource_group_name
  logging_loganalytics_location            = module.logging-resourcegroup.logging_resource_group_location
  logging_loganalytics_workspace_name      = var.logging_loganalytics_workspace_name
}
