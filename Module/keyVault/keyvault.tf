data "azurerm_client_config" "current" {
    #tenant_id = "48699f77-3aba-4072-b0dd-c8cd69976131"
    #sobject_id = "944bf774-f041-4da2-b1ee-bc3dbe5c3504"
}

resource "azurerm_key_vault" "myapp_kv" {
  name                       = "${var.prefix}-kv-01"
  location                   = var.location
  resource_group_name        = var.rgname
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "create",
      "get",
    ]

    secret_permissions = [
      "set",
      "get",
      "delete",
      "purge",
      "recover"
    ]
  }
   lifecycle {
   prevent_destroy = false
   }
}

resource "azurerm_key_vault_secret" "myapp_adminpassword" {
  name         = "adminpassword"
  value        = var.adminpassword
  key_vault_id = azurerm_key_vault.myapp_kv.id
}