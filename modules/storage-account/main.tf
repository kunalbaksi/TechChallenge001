resource "azurerm_storage_account" "storageacct" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  public_network_access_enabled = var.public_network_access_enabled
  network_rules {
    default_action = var.default_action
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
    ip_rules       = var.ip_rules
  }
  tags = var.tags
}