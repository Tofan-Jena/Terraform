## Creating VM for Customer1 (Admin@12345)
resource "azurerm_windows_virtual_machine" "vm-c1" {
  name                = "${var.prefix}-${var.env}-${var.prefix-vm}-${count.index}"
  resource_group_name = azurerm_resource_group.C1RG.name
  location            = azurerm_resource_group.C1RG.location
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  admin_password      = var.pswd
  count               = var.counts
  provider = azurerm.Customer1
  network_interface_ids = [azurerm_network_interface.c1-nic[count.index].id]
    
  availability_set_id = azurerm_availability_set.c1-as.id
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
 

 boot_diagnostics {
   
   storage_account_uri = azurerm_storage_account.diaog.primary_blob_endpoint

 }
 depends_on = [azurerm_storage_account.diaog]
}


resource "azurerm_virtual_machine_extension" "vm-ext" {

  name                 = "IIS"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm-c1[count.index].id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  count                = var.counts
  settings = <<SETTINGS
    {
        "fileUris": ["https://raw.githubusercontent.com/eltimmo/learning/master/azureInstallWebServer.ps1"],
        "commandToExecute" : "start powershell -ExecutionPolicy Unrestricted -File azureInstallWebServer.ps1"
    }
    SETTINGS

    depends_on = [azurerm_windows_virtual_machine.vm-c1]    
}


