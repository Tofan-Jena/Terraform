
# Creating ResourceGroup for Customer1.
resource "azurerm_resource_group" "C1RG" {
  name = "${var.prefix}-${var.customer["Customer1"]}-RG"
  provider = azurerm.Customer1
  location = var.location["locationC1"]
  tags = var.tag
}
# Creating ResourceGroup for Customer2.
resource "azurerm_resource_group" "C2RG" {
  name = "${var.prefix}-${var.customer["Customer2"]}-RG"
  provider = azurerm.Customer2
  location = var.location["locationC2"]
  tags = var.tag
}
