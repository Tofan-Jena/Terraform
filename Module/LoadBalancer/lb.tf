# Load Balancer

resource "azurerm_lb" "web_server_lb" {
  name                = "${var.resource_prefix}-lb"
  location            = var.web_server_location
  resource_group_name = azurerm_resource_group.web_server_rg.name

  frontend_ip_configuration {
    name                 = "PrivateIPAddress"
    private_ip_address_allocation = "Static"
    private_ip_address  = "10.0.0.38"
    subnet_id = azurerm_subnet.web_server_subnets["DataSubnet"].id

  }
  sku = "Standard"
}

resource "azurerm_lb_backend_address_pool" "web_server_lb_backend_address_pool" {
  loadbalancer_id = azurerm_lb.web_server_lb.id
  name            = "Web-IIS"
}

resource "azurerm_lb_probe" "web_server_lb_probe" {
  resource_group_name = azurerm_resource_group.web_server_rg.name
  loadbalancer_id     = azurerm_lb.web_server_lb.id 
  name                = "http"
  port                = 80
}

resource "azurerm_lb_rule" "web_server_lb_rule" {
  resource_group_name            = azurerm_resource_group.web_server_rg.name
  loadbalancer_id                = azurerm_lb.web_server_lb.id 
  name                           = "http"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PrivateIPAddress"
  probe_id                       = azurerm_lb_probe.web_server_lb_probe.id
  backend_address_pool_id        = azurerm_lb_backend_address_pool.web_server_lb_backend_address_pool.id
}

resource "azurerm_network_interface_backend_address_pool_association" "backend-vms" {
  network_interface_id    = azurerm_network_interface.web_server_nic[count.index].id
  ip_configuration_name   = "${var.web-server-name}-ip"
  backend_address_pool_id = azurerm_lb_backend_address_pool.web_server_lb_backend_address_pool.id
  count                   = var.web_server_count
}
