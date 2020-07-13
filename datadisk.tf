# Creating Data Disk 

resource "azurerm_managed_disk" "datadisk" {
  name                 = "${local.data_disk_name}-disk-${var.counts}"
  resource_group_name = azurerm_resource_group.C1RG.name
  location            = azurerm_resource_group.C1RG.location
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  count                = var.counts 
}

resource "azurerm_virtual_machine_data_disk_attachment" "datadisk-attach" {
  managed_disk_id    = azurerm_managed_disk.datadisk[count.index].id
  virtual_machine_id = azurerm_windows_virtual_machine.vm-c1[count.index].id
  caching            = "ReadWrite"
  lun                = 1
  count              = var.counts
  depends_on          = [azurerm_managed_disk.datadisk]
}
