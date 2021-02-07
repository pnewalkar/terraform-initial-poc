// data objects that are created outside of this TF scope

## <https://www.terraform.io/docs/providers/azurerm/r/resource_group.html>
 data "azurerm_resource_group" "rg" {
  name     = var.vm_resource_group
  // location = "UK South"
}

## <https://www.terraform.io/docs/providers/azurerm/r/virtual_network.html>
data "azurerm_virtual_network" "environment_vnet" {
  name                = "uk-tea-xpw-vnet"
  resource_group_name = var.network_resource_group
}

## <https://www.terraform.io/docs/providers/azurerm/r/subnet.html> 
data "azurerm_subnet" "frontend_subnet" {
  name                 = "uk-tea-xpw-subnet-fe"
  resource_group_name  = var.network_resource_group
  virtual_network_name = data.azurerm_virtual_network.environment_vnet.name
}

## <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault>
data "azurerm_key_vault" "secrets_kv" {
  name                        = "tablet-vm-secrets"
  resource_group_name         = var.vm_resource_group
}

## <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret>
data "azurerm_key_vault_secret" "admin_pass_secret" {
    name = "vm-admin-password"
    key_vault_id = data.azurerm_key_vault.secrets_kv.id
}

