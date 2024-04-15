provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_key_vault" "example" {
  name                       = var.key_vault_name
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  sku_name                   = var.sku_name
  tenant_id                  = var.tenant_id
  enabled_for_deployment     = var.enabled_for_deployment
  enabled_for_disk_encryption= var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  access_policy {
    tenant_id     = var.tenant_id
    object_id     = var.object_id
    secret_permissions = var.secret_permissions
    key_permissions    = var.key_permissions
  }
}
