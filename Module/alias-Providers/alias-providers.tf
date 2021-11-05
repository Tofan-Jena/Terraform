
# Use this file/featue where you want to deploy in to multiple subscriptions.
# Customer1 Details
provider "azurerm" {
  alias = "Customer1"
  features {}
  client_id       = var.client_id_C1
  client_secret   = var.client_secret_C1
  tenant_id       = var.tenant_id_C1
  subscription_id = var.subscription_id_C1
}
# Customer2 Details
provider "azurerm" {
 alias = "Customer2"
 features {}
  client_id       = var.client_id_C2
  client_secret   = var.client_secret_C2
  tenant_id       = var.tenant_id_C2
  subscription_id = var.subscription_id_C2
}

