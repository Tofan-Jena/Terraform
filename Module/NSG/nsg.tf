## Creating NSG for Customer 1
resource "azurerm_network_security_group" "NSG-C1" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.C1RG.location
  resource_group_name = azurerm_resource_group.C1RG.name
  provider = azurerm.Customer1
  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

## Creating NSG for Customer 2
resource "azurerm_network_security_group" "NSG-C2" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.C2RG.location
  resource_group_name = azurerm_resource_group.C2RG.name
  provider = azurerm.Customer2
  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "http"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "80"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

## Assigning NSG to Customer 1 Subnet.
resource "azurerm_subnet_network_security_group_association" "NSG-Assigne-C1" {
network_security_group_id = azurerm_network_security_group.NSG-C1.id
subnet_id = azurerm_subnet.C1-Subnet["DB-Subnet"].id
provider = azurerm.Customer1
}

## Assigning NSG to Customer 1 Subnet.
resource "azurerm_subnet_network_security_group_association" "NSG-Assigne-C2" {
network_security_group_id = azurerm_network_security_group.NSG-C2.id
subnet_id = azurerm_subnet.C2-Subnet.id
provider = azurerm.Customer2
}