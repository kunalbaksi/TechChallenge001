resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "web" {
  name                 = var.subnet_web_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group_name
  service_endpoints    = ["Microsoft.Storage","Microsoft.KeyVault","Microsoft.Sql"]
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "app" {
  name                 = var.subnet_app_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group_name
  service_endpoints    = ["Microsoft.Storage","Microsoft.KeyVault","Microsoft.Sql"]
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "data" {
  name                 = var.subnet_data_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group_name
  service_endpoints    = ["Microsoft.Storage","Microsoft.KeyVault","Microsoft.Sql"]
  address_prefixes     = ["10.0.3.0/24"]
}