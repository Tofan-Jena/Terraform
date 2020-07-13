# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "2.2.0"
  features {}
}


//Call modules

module "Alias-providers" {
  source              = "./Module\alias-Providers"
  
  client_id       = var.client_id_C1
  client_secret   = var.client_secret_C1
  tenant_id       = var.tenant_id_C1
  subscription_id = var.subscription_id_C1
  
}





##### RESOURCE CREATION START FROM HERE #####

locals {
data_disk_name = var.env == "prod" ? "${var.data_disk_name}-prod" : "${var.data_disk_name}-stg"
build_env = var.env == "prod" ? "production" : "stg"
}

# terraform import azurerm_storage_account.diaog /subscriptions/4c1885b8-7dc3-4bb3-8cfc-ebcb9fefdf3b/resourceGroups/tfimport/providers/Microsoft.Storage/storageAccounts/tfimport #
resource "azurerm_storage_account" "diaog" {

  name = "tfimport"
  resource_group_name = "tfimport"
  location            = azurerm_resource_group.C1RG.location
  access_tier         = "Hot"
  account_kind        = "BlobStorage"
  account_replication_type = "LRS"
  account_tier         = "Standard"
  
}



