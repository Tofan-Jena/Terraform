output "key-vault-id" {
  value = module.myapp-kv.key-vault-id
}

output "Rg-id" {
  value = module.myapp-rg.myapp-rg
}

output "secret-value" {
  value = module.myapp-kv.secret-value
  sensitive = true
}

output "vnetid" {
  value = module.vnet.vnetid
}

output "vnetid2" {
  value = module.vnet.vnetid2
}