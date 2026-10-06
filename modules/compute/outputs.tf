output "web_vm_ids" {
  description = "Web VM IDs"
  value       = azurerm_linux_virtual_machine.web[*].id
}

output "web_nic_ids" {
  description = "Web NIC IDs"
  value       = azurerm_network_interface.web[*].id
}

output "web_private_ips" {
  description = "Web VM private IP addresses"
  value       = azurerm_network_interface.web[*].private_ip_address
}

output "app_vm_ids" {
  description = "Application VM IDs"
  value       = azurerm_linux_virtual_machine.app[*].id
}

output "app_private_ips" {
  description = "Application VM private IP addresses"
  value       = azurerm_network_interface.app[*].private_ip_address
}