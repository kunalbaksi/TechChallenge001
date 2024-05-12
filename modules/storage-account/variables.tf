variable "name" {
  type = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "account_tier" {
  type = string
  default = "Standard"
}
variable "account_kind" {
  type = string
  default = "StorageV2"
}
variable "account_replication_type" {
  type = string
  default = "LRS"
}
variable "public_network_access_enabled" {
  type = bool
}
variable "default_action" {
  type = string
  default = "Deny"
}
variable "ip_rules" {
  type = list(string)
}
variable "virtual_network_subnet_ids" {
  type = list(string)
}
variable "tags" {
  type = map(string)
}