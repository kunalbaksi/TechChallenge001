variable "name" {
  type = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "psql_version" {
  type = number
}
variable "administrator_login" {
  type = string
}
variable "administrator_password" {
  type = string
}
variable "storage_mb" {
  type = number
}
variable "sku_name" {
  type = string
}
variable "zone" {
  type = number
  default = 1
}
variable "backup_retention_days" {
  type = number
}
variable "tags" {
  type = map(string)
}
variable "db_name" {
  type = string
}