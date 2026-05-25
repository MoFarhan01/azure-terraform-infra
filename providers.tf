terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "tfstate-rg"
    storage_account_name = "tfstatefarhan01"
    container_name = "tfstate"
    key = "azure-infra.tfstate"
    
  }

}

provider "azurerm" {
  features {}         
}