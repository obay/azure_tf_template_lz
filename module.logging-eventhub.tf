module "logging-eventhub" {
  source                               = "./modules/logging/eventhub"
  logging_eventhub_namespace_name      = var.logging_eventhub_namespace_name
  logging_eventhub_workspace_name      = var.logging_eventhub_workspace_name
  logging_eventhub_resource_group_name = module.logging-resourcegroup.logging_resource_group_name
  logging_eventhub_location            = module.logging-resourcegroup.logging_resource_group_location
}
