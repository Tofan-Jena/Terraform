terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=2.67.0"
    }
  }
}
# Configure the Microsoft Azure Provider


provider "azurerm" {    
  features {} 
  
}

/*
provider "azurerm" {    
  features {} 
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

}
*/
/*
provider "azurerm" {
    alias = "RDSLAB"    
  features {}
  subscription_id = "xxxxxxxxxxxxxxxxxxxx"
  client_id       = "bd321a2e-da31-4045-96f4-2c1871d008de"
  client_secret   = "qK~l84J-1y~fPYdvP77004_Li.0XdqjEGc"
  tenant_id       = "xxxxxxxxxxxxx"
}

*/

/*
provider "azurerm" {
  alias = "RDSLAB"    
 features {}
  subscription_id = "67006b24-52bb-4f1c-b621-905523fa2156"
 client_id       = "bd321a2e-da31-4045-96f4-2c1871d008de"
  client_secret   = "qK~l84J-1y~fPYdvP77004_Li.0XdqjEGc"
  tenant_id       = "1c999845-11fd-4223-8086-242e4e8508b8"

*/
