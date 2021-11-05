resource "azurerm_virtual_network_peering" "vnet1" {
  name                      = "peer1to2"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.virtual_network_name1
  remote_virtual_network_id = var.remote_virtual_network_id2
    allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit = false
}

resource "azurerm_virtual_network_peering" "vnet2" {
  name                      = "peer2to1"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.virtual_network_name2
  remote_virtual_network_id = var.remote_virtual_network_id1
    allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit = false
}