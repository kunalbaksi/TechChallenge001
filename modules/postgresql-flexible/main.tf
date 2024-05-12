resource "azurerm_postgresql_flexible_server" "psql" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = var.psql_version
  
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  storage_mb   = var.storage_mb
  sku_name   = var.sku_name

  zone                   = var.zone
  backup_retention_days  = var.backup_retention_days

  tags=var.tags
}
resource "azurerm_postgresql_flexible_server_firewall_rule" "example" {
  name             = "${var.name}-tfe-firewall"
  server_id        = azurerm_postgresql_flexible_server.psql.id
  start_ip_address = "49.37.51.124"
  end_ip_address   = "49.37.51.124"
  depends_on = [ azurerm_postgresql_flexible_server.psql ]
}
resource "azurerm_postgresql_flexible_server_database" "psql_db" {
  name      = var.db_name
  server_id = azurerm_postgresql_flexible_server.psql.id
  collation = "en_US.utf8"
  charset   = "utf8"

  depends_on = [ azurerm_postgresql_flexible_server.psql ]
  # prevent accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}