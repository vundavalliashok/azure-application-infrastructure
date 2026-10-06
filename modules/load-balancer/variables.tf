variable "name_prefix" {
  description = "Resource naming prefix"
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

variable "web_nic_ids" {
  description = "Web server NIC IDs"
  type        = list(string)
}

variable "zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["1", "2", "3"]
}

variable "tags" {
  description = "Azure resource tags"
  type        = map(string)
  default     = {}
}   