variable "name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Tags assigned to the Resource Group"
  type        = map(string)
  default     = {}
}