output "resource_group_name" {
  value       = azurerm_resource_group.main.name
  description = "Name of the resource group"
}

output "vm_public_ip" {
  value       = azurerm_public_ip.main.ip_address
  description = "Public IP address of the virtual machine"
}

output "vm_private_ip" {
  value       = azurerm_network_interface.main.private_ip_address
  description = "Private IP address of the virtual machine"
}

output "vnet_name" {
  value       = azurerm_virtual_network.main.name
  description = "Name of the virtual network"
}
