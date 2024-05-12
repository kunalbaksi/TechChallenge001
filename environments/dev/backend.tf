terraform {
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "tfestatestorage"
    container_name       = "tfestatefiles"
    key                  = "terraform.tfstate"
  }
}