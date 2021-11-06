/* Add Virtual Machine to Azure DSC after deployment.
   The provisioner block should be inside the VM Creation Block

*/

## Example of Local-Exec ( Local Provisioner )
  provisioner "local-exec" {
    
    command = <<EOT
        $params = @{
        AutomationAccountName = "aa-terraformdemo"
        AzureVMName = "${azurerm_virtual_machine.vm.name}"
        ResourceGroupName = "rg-terraformaa"
        NodeConfigurationName = "WebserverConfig.vmterraform"
        azureVMLocation = "${azurerm_resource_group.rg.location}"
        AzureVMResourceGroup = "${azurerm_resource_group.rg.name}"
        }
        Register-AzAutomationDscNode @params 
   EOT
   interpreter = ["pwsh", "-Command"]
  }




#Remove Virtual Machine from Azure DSC when destroying.
  provisioner "local-exec" {
    when = destroy
    command = <<EOT
        Get-AzAutomationDscNode -ResourceGroupName "rg-terraformaa" -AutomationAccountName "aa-terraformdemo" -Name "${self.name}" | Unregister-AzAutomationDscNode -force
    EOT
   interpreter = ["pwsh", "-Command"]
  }

}

#######################################################################################
#Create Azure Container Registry
resource "azurerm_container_registry" "acr-dev" {
  name                     = "acrdevregistrycloudskillslab001"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                      = "Standard"
  admin_enabled            = false

}
#Import Container Image to Azure Container Registries
resource "null_resource" "image" {

  provisioner "local-exec" {
    command = <<EOT
       az acr import --name ${azurerm_container_registry.acr-prod.name} --source docker.io/library/hello-world:latest --image hello-world:latest
       az acr import --name ${azurerm_container_registry.acr-dev.name} --source docker.io/library/hello-world:latest --image hello-world:latest
   EOT
   interpreter = ["pwsh", "-Command"]
  }
}