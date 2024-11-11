module "logging-resourcegroup" {
  source                          = "./modules/logging/resourcegroup"
  logging_resource_group_name     = var.logging_resource_group_name
  logging_resource_group_location = var.logging_resource_group_location
}

output "logging_resource_group_name" {
  value = module.logging-resourcegroup.logging_resource_group_name
}

output "logging_resource_group_location" {
  value = module.logging-resourcegroup.logging_resource_group_location
}

