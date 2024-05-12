output "id" {
  description = "id of the storage account"
  value = azurerm_storage_account.storageacct.id
}
output "name" {
  description = "name of the storage account"
  value = azurerm_storage_account.storageacct.name
}
output "primary_access_key" {
  description = "value of the primary access key"
  value = azurerm_storage_account.storageacct.primary_access_key
}
output "primary_connection_string" {
  description = "value of the primary connection string"
  value = azurerm_storage_account.storageacct.primary_connection_string
}