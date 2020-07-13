# Creating Private DNS Zone for Customer1
resource "azurerm_private_dns_zone" "c1" {
  name                = "customer1.com"
  resource_group_name = azurerm_resource_group.C1RG.name
  provider = azurerm.Customer1
}

# Creating Private DNS Zone for Customer2
resource "azurerm_private_dns_zone" "c2" {
  name                = "customer2.com"
  resource_group_name = azurerm_resource_group.C2RG.name
  provider = azurerm.Customer2
}