variable "name_prefix" {
  description = "Prefix used for resource names"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "web_subnet_id" {
  description = "Web subnet ID"
  type        = string
}

variable "app_subnet_id" {
  description = "Application subnet ID"
  type        = string
}

variable "web_vm_count" {
  description = "Number of web VMs"
  type        = number
  default     = 2
}

variable "app_vm_count" {
  description = "Number of application VMs"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Linux VM administrator username"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
  sensitive   = true
}

variable "web_zones" {
  description = "Availability zones for web VMs"
  type        = list(string)
  default     = ["1", "2"]
}

variable "app_zones" {
  description = "Availability zones for application VMs"
  type        = list(string)
  default     = ["1", "2"]
}

variable "tags" {
  description = "Azure resource tags"
  type        = map(string)
  default     = {}
}