variable "ip_configuration_name" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "private_ip_address" {
  type = string
  default = ""
}
variable "admin_password" {
  type = string
}
variable "admin_username" {
  type = string
}
variable "disk_size_gb" {
  type = number
  default = 128
}
variable "caching" {
  type = string
  default = "ReadWrite"
}
variable "hostname" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "storage_account_type" {
  type = string
  default = "Standard_LRS"
}
variable "size" {
  type = string
  default = "Standard_D4_v3"
}
variable "zone" {
  type = number
  default = 1
}
variable "tags" {
  type = map(string)
}