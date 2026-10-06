variable "sql_server_name" {
  description = "Azure SQL Server name"
  type        = string
}

variable "database_name" {
  description = "Azure SQL Database name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "sql_admin_username" {
  description = "SQL administrator username"
  type        = string
  default     = "sqladminuser"
}

variable "database_sku" {
  description = "Azure SQL Database SKU"
  type        = string
  default     = "Basic"
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
variable "vnet_id" {
  description = "Virtual Network ID"
  type        = string
}

variable "db_subnet_id" {
  description = "Database subnet ID"
  type        = string
}