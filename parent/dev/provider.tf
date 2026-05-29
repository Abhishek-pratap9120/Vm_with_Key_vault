terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.73.0"
    }
  }
#   backend "azurerm" {
#     resource_group_name  = "statefile-rg"
#     storage_account_name = "statefilemanage"                          
#     container_name       = "statefilemanagement"                              
#     key                  = "terraform.tfstate"            
#   }
}

provider "azurerm" {
  features {}
}