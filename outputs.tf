output "bot_channel_emails_id" {
  description = "Map of id values across all bot_channel_emails, keyed the same as var.bot_channel_emails"
  value       = { for k, v in azurerm_bot_channel_email.bot_channel_emails : k => v.id }
}
output "bot_channel_emails_bot_name" {
  description = "Map of bot_name values across all bot_channel_emails, keyed the same as var.bot_channel_emails"
  value       = { for k, v in azurerm_bot_channel_email.bot_channel_emails : k => v.bot_name }
}
output "bot_channel_emails_email_address" {
  description = "Map of email_address values across all bot_channel_emails, keyed the same as var.bot_channel_emails"
  value       = { for k, v in azurerm_bot_channel_email.bot_channel_emails : k => v.email_address }
}
output "bot_channel_emails_email_password" {
  description = "Map of email_password values across all bot_channel_emails, keyed the same as var.bot_channel_emails"
  value       = { for k, v in azurerm_bot_channel_email.bot_channel_emails : k => v.email_password }
  sensitive   = true
}
output "bot_channel_emails_location" {
  description = "Map of location values across all bot_channel_emails, keyed the same as var.bot_channel_emails"
  value       = { for k, v in azurerm_bot_channel_email.bot_channel_emails : k => v.location }
}
output "bot_channel_emails_magic_code" {
  description = "Map of magic_code values across all bot_channel_emails, keyed the same as var.bot_channel_emails"
  value       = { for k, v in azurerm_bot_channel_email.bot_channel_emails : k => v.magic_code }
  sensitive   = true
}
output "bot_channel_emails_resource_group_name" {
  description = "Map of resource_group_name values across all bot_channel_emails, keyed the same as var.bot_channel_emails"
  value       = { for k, v in azurerm_bot_channel_email.bot_channel_emails : k => v.resource_group_name }
}

