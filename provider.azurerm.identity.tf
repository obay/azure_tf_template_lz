provider "azurerm" {
  alias           = "identity"
  subscription_id = var.subscription_id_identity
  features {}
}
