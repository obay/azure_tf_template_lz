provider "azurerm" {
  alias           = "security"
  subscription_id = var.subscription_id_security
  features {}
}
