
resource "azurerm_virtual_network" "myapp-vnet" {
  name = "${var.prefix}-vnet"
  resource_group_name = var.rgname
  location = var.location
  address_space = var.vnet-CIDR
  #dns_servers = ["10.0.0.4", "10.0.0.5"]
  
}


resource "azurerm_subnet" "myapp_subnets" {
  for_each = var.myapp_subnets
  name                 = each.key
  virtual_network_name = azurerm_virtual_network.myapp-vnet.name
  address_prefix       = each.value
  resource_group_name  = var.rgname
}

resource "azurerm_public_ip" "myapp_pip" {
     name        = "${var.prefix}-pip${count.index}"
     resource_group_name = var.rgname
     allocation_method = var.environement == "production" ? "Static" : "Dynamic"
     location = var.location
     count    = var.myapp_count
     sku      = "Standard"
}

resource "azurerm_network_interface" "myapp_nic" {
   name = "${var.prefix}-${count.index}-nic"
   location = var.location
   resource_group_name = var.rgname
   count    = var.myapp_count
   ip_configuration {
     name        = "${var.prefix}-ip"
     subnet_id   = azurerm_subnet.myapp_subnets["DataSubnet"].id
     private_ip_address_allocation = "Dynamic"
     public_ip_address_id = azurerm_public_ip.myapp_pip[count.index].id
     

   }
}

resource "azurerm_network_security_group" "myapp_nsg" {
  name                = "${var.prefix}-nsg"
  location            = var.location
  resource_group_name = var.rgname

  security_rule {
    name                       = "RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet_network_security_group_association" "myapp_subnet-nsg" {
  subnet_id                 = azurerm_subnet.myapp_subnets["DataSubnet"].id
  network_security_group_id = azurerm_network_security_group.myapp_nsg.id
}