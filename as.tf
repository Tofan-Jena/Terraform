## Creating AS for C1
resource "azurerm_availability_set" "c1-as" {
name = "${var.prefix}-${var.env}-as"
resource_group_name = azurerm_resource_group.C1RG.name
location            = azurerm_resource_group.C1RG.location
platform_update_domain_count = "5"
platform_fault_domain_count = "2"
}

