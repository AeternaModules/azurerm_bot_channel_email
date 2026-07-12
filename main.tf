data "azurerm_key_vault_secret" "email_password" {
  for_each     = { for k, v in var.bot_channel_emails : k => v if v.email_password_key_vault_id != null && v.email_password_key_vault_secret_name != null }
  name         = each.value.email_password_key_vault_secret_name
  key_vault_id = each.value.email_password_key_vault_id
}
data "azurerm_key_vault_secret" "magic_code" {
  for_each     = { for k, v in var.bot_channel_emails : k => v if v.magic_code_key_vault_id != null && v.magic_code_key_vault_secret_name != null }
  name         = each.value.magic_code_key_vault_secret_name
  key_vault_id = each.value.magic_code_key_vault_id
}
resource "azurerm_bot_channel_email" "bot_channel_emails" {
  for_each = var.bot_channel_emails

  bot_name            = each.value.bot_name
  email_address       = each.value.email_address
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  email_password      = each.value.email_password != null ? each.value.email_password : try(data.azurerm_key_vault_secret.email_password[each.key].value, null)
  magic_code          = each.value.magic_code != null ? each.value.magic_code : try(data.azurerm_key_vault_secret.magic_code[each.key].value, null)
}

