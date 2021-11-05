resource "azurerm_storage_account" "sa" {
  name                     = "aninnninnsa"
  resource_group_name      = var.resource_group_name
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}