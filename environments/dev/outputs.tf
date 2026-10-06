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
output "load_balancer_public_ip" {
  description = "Public IP address of the Azure Load Balancer"
  value       = module.load_balancer.public_ip_address
}

output "web_private_ips" {
  description = "Private IPs of web VMs"
  value       = module.compute.web_private_ips
}

output "app_private_ips" {
  description = "Private IPs of application VMs"
  value       = module.compute.app_private_ips
}