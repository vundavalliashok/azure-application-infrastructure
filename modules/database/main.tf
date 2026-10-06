resource "random_password" "sql_admin" {
  length           = 32
  special          = true
  min_numeric      = 4
  min_upper        = 4
  min_lower        = 4
  min_special      = 4
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_mssql_server" "this" {
  name                = var.sql_server_name
  resource_group_name = var.resource_group_name
  location            = var.location

  version = "12.0"

  administrator_login          = var.sql_admin_username
  administrator_login_password = random_password.sql_admin.result

  minimum_tls_version       = "1.2"
  public_network_access_enabled = false

  tags = var.tags
}

resource "azurerm_mssql_database" "this" {
  name      = var.database_name
  server_id = azurerm_mssql_server.this.id

  sku_name = var.database_sku

  storage_account_type = "Local"

  lifecycle {
    prevent_destroy = true
  }

  tags = var.tags
}