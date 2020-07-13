# Saving the STATE file into Azure SA.
terraform {
  backend "azurerm" {
    resource_group_name = "TFSTATE"
    storage_account_name = "terraformfstates"
    container_name = "tfstatecont"
    access_key = "0eeW7LbTK57iFhrDS0gZdA3htgyTnCIgAOExuWCzyifBzu5srY6e0OkJxqRXv9pGJfRQ9VmNIJVvDuqfBWRfKw=="
    key = "prod.tfstate"
  }
}