data "azurerm_subnet" "data_subnet" {
    for_each = var.vm
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_key_vault" "data_keyvault" {
         for_each = var.vm
  name                = each.value.key_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "data_key_username" {
  for_each = var.vm
  name         = each.value.secret_user_name
  key_vault_id = data.azurerm_key_vault.data_keyvault[each.key].id
}

data "azurerm_key_vault_secret" "data_key_password" {
  for_each = var.vm
  name         = each.value.secret_password_name
  key_vault_id = data.azurerm_key_vault.data_keyvault[each.key].id
}