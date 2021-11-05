output "key-vault-id" {
    value = "azurerm_key_vault.myapp_kv.id"
}

output "secret-value" {
  value = azurerm_key_vault_secret.myapp_adminpassword.value
}