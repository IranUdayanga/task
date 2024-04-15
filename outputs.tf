output "key_vault_id" {
  value = azurerm_key_vault.az_key_vault.id
}

output "key_vault_uri" {
  value = azurerm_key_vault.az_key_vault.vault_uri
}
