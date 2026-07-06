output "bot_channel_emails" {
  description = "All bot_channel_email resources"
  value       = azurerm_bot_channel_email.bot_channel_emails
  sensitive   = true
}
output "bot_channel_emails_bot_name" {
  description = "List of bot_name values across all bot_channel_emails"
  value       = [for k, v in azurerm_bot_channel_email.bot_channel_emails : v.bot_name]
}
output "bot_channel_emails_email_address" {
  description = "List of email_address values across all bot_channel_emails"
  value       = [for k, v in azurerm_bot_channel_email.bot_channel_emails : v.email_address]
}
output "bot_channel_emails_email_password" {
  description = "List of email_password values across all bot_channel_emails"
  value       = [for k, v in azurerm_bot_channel_email.bot_channel_emails : v.email_password]
  sensitive   = true
}
output "bot_channel_emails_location" {
  description = "List of location values across all bot_channel_emails"
  value       = [for k, v in azurerm_bot_channel_email.bot_channel_emails : v.location]
}
output "bot_channel_emails_magic_code" {
  description = "List of magic_code values across all bot_channel_emails"
  value       = [for k, v in azurerm_bot_channel_email.bot_channel_emails : v.magic_code]
  sensitive   = true
}
output "bot_channel_emails_resource_group_name" {
  description = "List of resource_group_name values across all bot_channel_emails"
  value       = [for k, v in azurerm_bot_channel_email.bot_channel_emails : v.resource_group_name]
}

