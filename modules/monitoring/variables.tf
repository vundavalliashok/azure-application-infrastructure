variable "workspace_name" {
  description = "Log Analytics workspace name"
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "sql_server_id" {
  description = "SQL Server resource ID"
  type        = string
}

variable "tags" {
  type    = map(string)
  default = {}
}