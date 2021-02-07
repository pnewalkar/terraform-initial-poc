output "instance_ip_addr" {
  value = azurerm_network_interface.tablet_vm_nic.private_ip_address
}