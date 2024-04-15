variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
}

variable "location" {
  description = "Location of the Azure Key Vault"
}

variable "resource_group_name" {
  description = "Name of the resource group where the Azure Key Vault will be deployed"
}

variable "sku_name" {
  description = "SKU of the Azure Key Vault"
}

variable "tenant_id" {
  description = "Tenant ID for RBAC"
}

variable "object_id" {
  description = "Object ID for RBAC"
}

variable "secret_permissions" {
  description = "Permissions for secrets"
}

variable "key_permissions" {
  description = "Permissions for keys"
}

variable "enabled_for_deployment" {
  description = "Specifies whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
}

variable "enabled_for_disk_encryption" {
  description = "Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
}

variable "enabled_for_template_deployment" {
  description = "Specifies whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
}
