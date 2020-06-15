# Declare the Azure provider
provider "azurerm" {
    # the "feature" block is required for AzureRM provider 2.0x. 
    version = "~>2.0"
    features {}
}

terraform {
    # config the backend for terraform, using standard backend.
    backend "azurerm" {}
}