
# Creating VNet for Customer1.

resource "azurerm_virtual_network" "C1-Vnet" {
  name = "${var.prefix}-${var.env}-${var.customer["Customer1"]}-${var.prefix-vnet}"
  resource_group_name = azurerm_resource_group.C1RG.name
  location = var.location["locationC1"]
  address_space = [var.vnet-c1]
  provider = azurerm.Customer1
  tags = var.tag
  #depends_on = [azurerm_resource_group.C1RG]
}

# Creating VNet for Customer2.

resource "azurerm_virtual_network" "C2-Vnet" {
  name = "${var.prefix}-${var.env}-${var.customer["Customer2"]}-${var.prefix-vnet}"
  resource_group_name = azurerm_resource_group.C2RG.name
  location = var.location["locationC2"]
  address_space = [var.vnet-c2]
  provider = azurerm.Customer2
  #depends_on = [azurerm_resource_group.C2RG]
}

# Creating Subnet(DB-Subnet,AzureBastionSubnet,GatewaySubnet) for Customer1.
resource "azurerm_subnet" "C1-Subnet"{
for_each = var.subnet-c1
name = each.key
resource_group_name = azurerm_resource_group.C1RG.name
virtual_network_name = azurerm_virtual_network.C1-Vnet.name
address_prefix = each.value
provider = azurerm.Customer1
}

# Creating Subnet for Customer2.
resource "azurerm_subnet" "C2-Subnet"{
name = "dbsubnet"
resource_group_name = azurerm_resource_group.C2RG.name
virtual_network_name = azurerm_virtual_network.C2-Vnet.name
address_prefix = var.subnet-c2["DB-Subnet"]
provider = azurerm.Customer2
}

# Creating NIC for Customer1.

resource "azurerm_network_interface" "c1-nic" {

  name = "${var.prefix}-${var.prefix-nic}-${count.index}"
  resource_group_name = azurerm_resource_group.C1RG.name
  location =  var.location["locationC1"]               
  provider = azurerm.Customer1
  ip_configuration {
    name = "${var.prefix}-ip"
    subnet_id = azurerm_subnet.C1-Subnet["DB-Subnet"].id
    private_ip_address_allocation = "dynamic"
  }
  count= var.counts
}

# Creating NIC for Customer2.

resource "azurerm_network_interface" "c2-nic" {

  name = "${var.prefix}-${var.prefix-nic}-${count.index}"
  resource_group_name = azurerm_resource_group.C2RG.name
  location =  var.location["locationC2"]               
  provider = azurerm.Customer2
  ip_configuration {
    name = "${var.prefix}-ip"
    subnet_id = azurerm_subnet.C2-Subnet.id
    private_ip_address_allocation = "dynamic"
  }
  count = var.counts
}

# Creating PIP for Customer1.
resource "azurerm_public_ip" "c1-pip" {

  name = "${var.prefix}-${var.prefix-pip}-lbpip"
  resource_group_name = azurerm_resource_group.C1RG.name
  location =  var.location["locationC1"]               
  provider = azurerm.Customer1
  allocation_method = "Static"
  sku = "Standard"
}

# Creating PIP for Customer2.
resource "azurerm_public_ip" "c2-pip" {

  name = "${var.prefix}-${var.prefix-pip}"
  resource_group_name = azurerm_resource_group.C2RG.name
  location =  var.location["locationC2"]               
  provider = azurerm.Customer2
  allocation_method = var.env == "stg" ? "Static" : "Dynamic"  
    # without conditional = allocation_method = "Dynamic"
}
