terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116.0"
    }
  }

  backend "azurerm" {
    subscription_id      = "abd5b4fd-a8fd-40db-8c20-25af66c54e0c"
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "saterraformstate2810"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
  }
}
