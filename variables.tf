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
  # --- Unconfirmed validation candidates, derived from azurerm_bot_channel_email's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
}

