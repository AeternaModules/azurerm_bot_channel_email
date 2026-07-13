variable "bot_channel_emails" {
  description = <<EOT
Map of bot_channel_emails, attributes below
Required:
    - bot_name
    - email_address
    - location
    - resource_group_name
Optional:
    - email_password
    - email_password_key_vault_id (alternative to email_password - read from Key Vault instead)
    - email_password_key_vault_secret_name (alternative to email_password - read from Key Vault instead)
    - magic_code
    - magic_code_key_vault_id (alternative to magic_code - read from Key Vault instead)
    - magic_code_key_vault_secret_name (alternative to magic_code - read from Key Vault instead)
EOT

  type = map(object({
    bot_name                             = string
    email_address                        = string
    location                             = string
    resource_group_name                  = string
    email_password                       = optional(string)
    email_password_key_vault_id          = optional(string)
    email_password_key_vault_secret_name = optional(string)
    magic_code                           = optional(string)
    magic_code_key_vault_id              = optional(string)
    magic_code_key_vault_secret_name     = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_emails : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_emails : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_emails : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_emails : (
        length(v.bot_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_emails : (
        length(v.email_address) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_emails : (
        v.email_password == null || (length(v.email_password) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_emails : (
        v.magic_code == null || (length(v.magic_code) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

