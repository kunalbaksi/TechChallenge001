provider "azurerm" {
  features {}
}

locals {
  tags = {
    "environment_type" : var.environment_type,
    "owner" : var.owner,
    "deployed_by" : var.deployed_by
    "solution" : var.solution
  }
}
module "resource_group" {
  source = "../../modules/resource-group"

  name     = "${var.resource_group_name}${var.environment_type}"
  location = var.location
  tags = local.tags
}

module "vnet_subnet" {
  source = "../../modules/vnet-subnet"
  
  name = "${var.vnet_name}${var.environment_type}"
  resource_group_name = module.resource_group.name
  location = var.location
  subnet_web_name = var.subnet_web_name
  subnet_app_name = var.subnet_app_name
  subnet_data_name = var.subnet_data_name
}

module "storage_account" {
  source = "../../modules/storage-account"

  name = "${var.storage_account_name}${var.environment_type}"
  resource_group_name = module.resource_group.name
  location = var.location
  public_network_access_enabled = true
  virtual_network_subnet_ids = [module.vnet_subnet.subnet_data_id,module.vnet_subnet.subnet_app_id]
  ip_rules = ["49.37.48.196"]
  tags = local.tags
}

module "vm_linux" {
  source = "../../modules/linux-vm"

  for_each = var.vm_instances

  hostname            = "${each.value["hostname"]}${var.environment_type}"
  resource_group_name = module.resource_group.name
  location            = var.location
  size                = each.value["size"]
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  subnet_id           = each.value["subnet_id"]
  ip_configuration_name = "${each.value["hostname"]}${var.environment_type}-ipconfig"
  disk_size_gb         = each.value["disk_size_gb"]

  tags = local.tags
}
module "postgresql_flexible_server" {
  source = "../../modules/postgresql-flexible"
  name                   = "${var.psql_server_name}${var.environment_type}"
  resource_group_name    = module.resource_group.name
  location               = var.location
  psql_version                = var.psql_version

  administrator_login    = var.admin_username
  administrator_password = var.admin_password
  storage_mb   = var.storage_mb
  sku_name   = var.sku_name

  backup_retention_days  = var.backup_retention_days

  db_name = var.db_name
  tags=local.tags

}