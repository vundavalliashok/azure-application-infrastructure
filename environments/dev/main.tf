module "resource_group" {
  source = "../../modules/resource-group"

  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

module "networking" {
  source = "../../modules/networking"

  vnet_name           = var.vnet_name
  location            = var.location
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
module "compute" {
  source = "../../modules/compute"

  name_prefix         = "azure-app-dev"
  location            = var.location
  resource_group_name = module.resource_group.name

  web_subnet_id = module.networking.web_subnet_id
  app_subnet_id = module.networking.app_subnet_id

  web_vm_count = 2
  app_vm_count = 2

  vm_size = var.vm_size

  admin_username = var.admin_username
  ssh_public_key = var.ssh_public_key

  web_zones = ["1", "2"]
  app_zones = ["1", "2"]

  tags = var.tags
}

module "load_balancer" {
  source = "../../modules/load-balancer"

  name_prefix         = "azure-app-dev"
  location            = var.location
  resource_group_name = module.resource_group.name

  web_nic_ids = module.compute.web_nic_ids

  zones = ["1", "2", "3"]

  tags = var.tags
}