output "bot_channel_emails_id" {
  description = "Map of id values across all bot_channel_emails, keyed the same as var.bot_channel_emails"
  value       = { for k, v in azurerm_bot_channel_email.bot_channel_emails : k => v.id if v.id != null && length(v.id) > 0 }
}
output "bot_channel_emails_bot_name" {
  description = "Map of bot_name values across all bot_channel_emails, keyed the same as var.bot_channel_emails"
  value       = { for k, v in azurerm_bot_channel_email.bot_channel_emails : k => v.bot_name if v.bot_name != null && length(v.bot_name) > 0 }
}
output "bot_channel_emails_email_address" {
  description = "Map of email_address values across all bot_channel_emails, keyed the same as var.bot_channel_emails"
  value       = { for k, v in azurerm_bot_channel_email.bot_channel_emails : k => v.email_address if v.email_address != null && length(v.email_address) > 0 }
}
output "bot_channel_emails_email_password" {
  description = "Map of email_password values across all bot_channel_emails, keyed the same as var.bot_channel_emails"
  value       = { for k, v in azurerm_bot_channel_email.bot_channel_emails : k => v.email_password if v.email_password != null && length(v.email_password) > 0 }
  sensitive   = true
}
output "bot_channel_emails_location" {
  description = "Map of location values across all bot_channel_emails, keyed the same as var.bot_channel_emails"
  value       = { for k, v in azurerm_bot_channel_email.bot_channel_emails : k => v.location if v.location != null && length(v.location) > 0 }
}
output "bot_channel_emails_magic_code" {
  description = "Map of magic_code values across all bot_channel_emails, keyed the same as var.bot_channel_emails"
  value       = { for k, v in azurerm_bot_channel_email.bot_channel_emails : k => v.magic_code if v.magic_code != null && length(v.magic_code) > 0 }
  sensitive   = true
}
output "bot_channel_emails_resource_group_name" {
  description = "Map of resource_group_name values across all bot_channel_emails, keyed the same as var.bot_channel_emails"
  value       = { for k, v in azurerm_bot_channel_email.bot_channel_emails : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}

