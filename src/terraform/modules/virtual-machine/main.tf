## <https://www.terraform.io/docs/providers/azurerm/r/network_interface.html>
resource "azurerm_network_interface" "tablet_vm_nic" {
  name                = "uk-tea-xpw-swb-nic"
  location            = var.location 
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
## <https://www.terraform.io/docs/providers/azurerm/r/windows_virtual_machine.html>
resource "azurerm_windows_virtual_machine" "tablet_vm" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password      = var.vm_password
  network_interface_ids = [
    azurerm_network_interface.tablet_vm_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

source_image_id = "/subscriptions/b6b47eb7-d3e2-43ee-b1f4-b2de5f3881cf/resourceGroups/uk-dev-xpressweigh-terraform-spike-2/providers/Microsoft.Compute/images/defaultTabletImage"
}		
