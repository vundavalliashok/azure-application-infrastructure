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