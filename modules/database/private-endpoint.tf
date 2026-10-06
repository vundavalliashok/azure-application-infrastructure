resource "azurerm_private_dns_zone" "sql" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "sql" {
  name                  = "sql-private-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.sql.name
  virtual_network_id    = var.vnet_id

  registration_enabled = false

  tags = var.tags
}

resource "azurerm_private_endpoint" "sql" {
  name                = "${var.sql_server_name}-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name

  subnet_id = var.db_subnet_id

  private_service_connection {
    name                           = "sql-private-connection"
    private_connection_resource_id = azurerm_mssql_server.this.id

    is_manual_connection = false

    subresource_names = [
      "sqlServer"
    ]
  }

  private_dns_zone_group {
    name = "sql-dns-zone-group"

    private_dns_zone_ids = [
      azurerm_private_dns_zone.sql.id
    ]
  }

  tags = var.tags
}