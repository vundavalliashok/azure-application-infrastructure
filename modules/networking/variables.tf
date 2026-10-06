variable "vnet_name" {
  description = "Virtual Network name"
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

variable "vnet_address_space" {
  description = "VNet CIDR"
  type        = string
  default     = "10.10.0.0/16"
}

variable "web_subnet_name" {
  description = "Web subnet name"
  type        = string
  default     = "web-subnet"
}

variable "web_subnet_address_prefix" {
  description = "Web subnet CIDR"
  type        = string
  default     = "10.10.1.0/24"
}

variable "app_subnet_name" {
  description = "Application subnet name"
  type        = string
  default     = "app-subnet"
}

variable "app_subnet_address_prefix" {
  description = "Application subnet CIDR"
  type        = string
  default     = "10.10.2.0/24"
}

variable "db_subnet_name" {
  description = "Database subnet name"
  type        = string
  default     = "db-subnet"
}

variable "db_subnet_address_prefix" {
  description = "Database subnet CIDR"
  type        = string
  default     = "10.10.3.0/24"
}

variable "tags" {
  description = "Azure resource tags"
  type        = map(string)
  default     = {}
}