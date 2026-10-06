output "load_balancer_id" {
  description = "Load Balancer ID"
  value       = azurerm_lb.this.id
}

output "public_ip_address" {
  description = "Load Balancer public IP"
  value       = azurerm_public_ip.this.ip_address
}

output "backend_pool_id" {
  description = "Web backend pool ID"
  value       = azurerm_lb_backend_address_pool.web.id
}