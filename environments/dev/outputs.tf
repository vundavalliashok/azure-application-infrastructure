output "resource_group_name" {
  value = module.resource_group.name
}

output "resource_group_id" {
  value = module.resource_group.id
}

output "vnet_name" {
  value = module.networking.vnet_name
}

output "vnet_id" {
  value = module.networking.vnet_id
}

output "web_subnet_id" {
  value = module.networking.web_subnet_id
}

output "app_subnet_id" {
  value = module.networking.app_subnet_id
}

output "db_subnet_id" {
  value = module.networking.db_subnet_id
}