## <https://www.terraform.io/docs/providers/azurerm/index.html>
provider "azurerm" {
 skip_provider_registration = true
  version = "=2.5.0"
  features {}
  subscription_id = "b6b47eb7-d3e2-43ee-b1f4-b2de5f3881cf"
}

module pay_tablet_vm {
  source = "../../modules/virtual-machine"

  location = data.azurerm_resource_group.rg.location
  rg_name = data.azurerm_resource_group.rg.name
  subnet_id = data.azurerm_subnet.frontend_subnet.id

  vm_name = "pay"
  vm_password = data.azurerm_key_vault_secret.admin_pass_secret.value
}
