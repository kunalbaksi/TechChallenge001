output "id" {
  description = "id of the vnet"
  value = azurerm_virtual_network.vnet.id
}
output "subnet_web_id" {
  description = "value of the web subnet id"
  value = azurerm_subnet.web.id
}
output "subnet_app_id" {
  description = "value of the app subnet id"
  value = azurerm_subnet.app.id
}
output "subnet_data_id" {
  description = "value of the data subnet id"
  value = azurerm_subnet.data.id
}