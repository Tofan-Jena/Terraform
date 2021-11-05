terraform {
  backend "azurerm" {
    resource_group_name   = "dontdelete"
    storage_account_name  = "myappsaprd"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}

# Import the Default settings
