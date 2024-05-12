resource "azurerm_public_ip" "pip" {
  name                = "${var.hostname}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tags
}

resource "azurerm_network_interface" "nic" {
  depends_on = [ azurerm_public_ip.pip ]
  name                = "${var.hostname}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address == "" ? "Dynamic" : "Static"
    private_ip_address = var.private_ip_address == "" ? null : var.private_ip_address
    public_ip_address_id = azurerm_public_ip.pip.id
  }

  tags = var.tags
}
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  depends_on = [ azurerm_network_interface.nic, azurerm_network_security_group.nsg ]
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.hostname}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}
resource "azurerm_network_security_rule" "nsgrule" {
  name                   = "${var.hostname}-inboundssh"
  priority               = 100
  direction              = "Inbound"
  access                 = "Allow"
  protocol               = "Tcp"
  description            = "Allowing ssh port to take remote of vm"
  source_port_range      = "*"
  destination_port_range = "22"
  source_address_prefix  = "*"
  destination_address_prefix = "*"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_linux_virtual_machine" "vm_linux" {
  name                = var.hostname
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  zone = var.zone
  os_disk {
    name                 = "${var.hostname}-osdisk"
    storage_account_type = var.storage_account_type
    caching              = var.caching
    disk_size_gb         = var.disk_size_gb
  }
  tags = var.tags
}