output "id" {
  description = "id of the linux VM"
  value = azurerm_linux_virtual_machine.vm_linux.id
}
output "name" {
  description = "name of the linux VM"
  value = azurerm_linux_virtual_machine.vm_linux.name
}
output "nic_id" {
  description = "ID of the nic created during VM"
  value = azurerm_network_interface.nic.id
}
output "private_ip_address" {
  description = "private ip assigned to the VM"
  value = azurerm_linux_virtual_machine.vm_linux.private_ip_address
}