resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]


  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }
}


resource "azurerm_virtual_network" "vnet2" {
  name                = "vnet2"
  location            = "north europe"
  resource_group_name = var.resource_group_name
  address_space       = ["10.1.0.0/16"]
  dns_servers         = ["10.1.0.4", "10.1.0.5"]


  subnet {
    name           = "subnet1"
    address_prefix = "10.1.1.0/24"
  }
}