variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = string
}

variable "web_subnet_name" {
  type = string
}

variable "web_subnet_address_prefix" {
  type = string
}

variable "app_subnet_name" {
  type = string
}

variable "app_subnet_address_prefix" {
  type = string
}

variable "db_subnet_name" {
  type = string
}

variable "db_subnet_address_prefix" {
  type = string
}

variable "tags" {
  type = map(string)
}
variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Linux VM administrator username"
  type        = string
  default     = "azureadmin"
}

variable "ssh_public_key" {
  description = "SSH public key used to access the VMs"
  type        = string
  sensitive   = true
}
variable "key_vault_name" {
  description = "Key Vault name"
  type        = string
}

variable "storage_account_name" {
  description = "Storage account name"
  type        = string
}