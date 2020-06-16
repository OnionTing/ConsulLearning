# Declare the Azure provider
provider "azurerm" {
    # the "feature" block is required for AzureRM provider 2.0x. 
    version = "~>2.0"
    features {}
  }

}