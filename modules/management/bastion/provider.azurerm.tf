provider "azurerm" {
  features {}

  subscription_id = var.management_bastion_subscription_id
}