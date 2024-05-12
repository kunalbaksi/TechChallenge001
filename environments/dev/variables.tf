variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "solution" {
  type = string
}
variable "owner" {
  type = string
}
variable "environment_type" {
  type = string
}
variable "deployed_by" {
  type = string
}
variable "vnet_name" {
  type = string
}
variable "subnet_web_name" {
  type = string
}
variable "subnet_app_name" {
  type = string
}
variable "subnet_data_name" {
  type = string
}
variable "storage_account_name" {
  type = string
}
variable "admin_password" {
  type = string
}
variable "admin_username" {
  type = string
}
variable "vm_instances" {
  type = map(object({
    hostname = string
    size = string
    disk_size_gb = number
    subnet_id = string
  }
  )
)
}
variable "psql_server_name" {
  type = string
}
variable "storage_mb" {
  type = number
}
variable "sku_name" {
  type = string
}
variable "backup_retention_days" {
  type = number
}
variable "db_name" {
  type = string
}
variable "psql_version" {
  type = number
}