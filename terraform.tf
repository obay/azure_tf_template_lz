terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "saterraformstate2810"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
  }
}
