resource "azurerm_key_vault" "key_vault" {
    for_each = var.key_vault
  name                        = each.value.key_name
  location                    = each.value.key_location
  resource_group_name         = each.value.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get"
    ]

    secret_permissions = [
      "Set",
      "Get"

    ]
  }
}

resource "azurerm_key_vault_secret" "secrets_username" {
    for_each = var.key_vault
  name         = each.value.secret_user_name
  value        = each.value.secret_user_value
  key_vault_id = azurerm_key_vault.key_vault[each.key].id
}
resource "azurerm_key_vault_secret" "secrets_password" {
    for_each = var.key_vault
 name         = each.value.secret_password_name
  value        = each.value.secret_password_value
  key_vault_id = azurerm_key_vault.key_vault[each.key].id
}