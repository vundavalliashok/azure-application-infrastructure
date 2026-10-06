output "vnet_id" {
  description = "VNet ID"
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "VNet name"
  value       = azurerm_virtual_network.this.name
}

output "web_subnet_id" {
  description = "Web subnet ID"
  value       = azurerm_subnet.web.id
}

output "app_subnet_id" {
  description = "Application subnet ID"
  value       = azurerm_subnet.app.id
}

output "db_subnet_id" {
  description = "Database subnet ID"
  value       = azurerm_subnet.db.id
}