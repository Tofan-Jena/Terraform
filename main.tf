

//Calling modules  

module "myapp-rg" {
  source              = "./module/RG"
  rgname              = var.rgname
  location            = var.location
  tag                = var.tag
}

#/ will create a key vault with a secret which will contain password of admin account
#/ also the resource has LifeCycle Syntax True ( the DESTROY Cyntax can't delete)
module "myapp-kv" {
  source = "./module/KeyVault"
  adminpassword = var.adminpassword
  rgname         = var.rgname
  location       = var.location
  prefix         = var.prefix
  depends_on = [
    module.myapp-rg
  ]
  }


module "ResouceG" {
  source = "./module/rg"
}

/*
module "sa" {
  source = "./module/sa"
  resource_group_name = module.ResouceG.rg
}
*/
module "vnet" {
    source = "./module/vnet"
    location = "west europe"
    resource_group_name = module.ResouceG.rg
}


module "peer" {
    source = "./module/peer"
    resource_group_name = module.ResouceG.rg
    virtual_network_name1 = module.vnet.vnetname
    virtual_network_name2 = module.vnet.vnetname2
    remote_virtual_network_id1 = module.vnet.vnetid
    remote_virtual_network_id2 = module.vnet.vnetid2
}

resource "random_pet" "aksrandom" {}





# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "2.2.0"
  features {}
}


//Call modules

module "Alias-providers" {
  source              = "./Module/alias-Providers"
  client_id_C1        = var.client_id_C1
  client_secret_C1    = var.client_secret_C1
  tenant_id_C1        = var.tenant_id_C1
  subscription_id_C1  = var.subscription_id_C1

  client_id_C2        = var.client_id_C2
  client_secret_C2    = var.client_secret_C2
  tenant_id_C2        = var.tenant_id_C2
  subscription_id_C2  = var.subscription_id_C2
}

module "AvailabilitySet" {
  source = "./Module/AvailabilitySet"
  name = "${var.prefix}-${var.env}-as"
  


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



