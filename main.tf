provider "azurerm" {
  features {}
}

resource "azurerm_key_vault" "az_key_vault" {
  name                       = var.key_vault_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
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

variable "key_vault_name" {
  description = "Key Vault Name"
}

variable "location" {
  description = " Key Vault Location "
}

variable "resource_group_name" {
  description = "resource group Of Key Vault"
}

variable "sku_name" {
  description = "Azure Key Vault SKU"
  default     = "standard"
}

variable "tenant_id" {
  description = "Azure Tenant ID"
}

variable "object_id" {
  description = "Object ID - RBAC"
}

variable "secret_permissions" {
  description = "Secrets Permissions"
  type        = list(string)
  default     = ["get", "list"]
}

variable "key_permissions" {
  description = "keys Permissions"
  type        = list(string)
  default     = ["get", "list"]
}

variable "enabled_for_deployment" {
  description = "Specifies whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
  type        = bool
  default     = false
}

variable "enabled_for_disk_encryption" {
  description = "Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Specifies whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
  type        = bool
  default     = false
}
