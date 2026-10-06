module "resource_group" {
  source = "../../modules/resource-group"

  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

module "networking" {
  source = "../../modules/networking"

  vnet_name         = var.vnet_name
  location          = var.location
  resource_group_name = module.resource_group.name

  vnet_address_space = var.vnet_address_space

  web_subnet_name           = var.web_subnet_name
  web_subnet_address_prefix = var.web_subnet_address_prefix

  app_subnet_name           = var.app_subnet_name
  app_subnet_address_prefix = var.app_subnet_address_prefix

  db_subnet_name           = var.db_subnet_name
  db_subnet_address_prefix = var.db_subnet_address_prefix

  tags = var.tags
}