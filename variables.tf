variable "name" {
  description = "The name of the MS SQL Server. Must be globally unique."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the MS SQL Server should be created."
  type        = string
}

variable "location" {
  description = "The Azure Region where the MS SQL Server should be created."
  type        = string
}

variable "version" {
  description = "The version of the MS SQL Server. Valid values: 2.0 (for v11 server) and 12.0 (for v12 server)."
  type        = string
  default     = "12.0"
}

variable "administrator_login" {
  description = "The administrator login name for the new server. Required unless azuread_authentication_only is true in the azuread_administrator block."
  type        = string
  default     = null
}

variable "administrator_login_password" {
  description = "The password associated with the administrator_login user."
  type        = string
  default     = null
  sensitive   = true
}

variable "azuread_administrator" {
  description = "An Azure AD Administrator block for the MS SQL Server."
  type = object({
    login_username              = string
    object_id                   = string
    tenant_id                   = optional(string)
    azuread_authentication_only = optional(bool)
  })
  default = null
}

variable "connection_policy" {
  description = "The connection policy the server will use. Possible values: Default, Proxy, Redirect."
  type        = string
  default     = "Default"
}

variable "minimum_tls_version" {
  description = "The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid value: 1.2."
  type        = string
  default     = "1.2"
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for this server."
  type        = bool
  default     = true
}

variable "outbound_network_restriction_enabled" {
  description = "Whether outbound network traffic is restricted for this server."
  type        = bool
  default     = false
}

variable "primary_user_assigned_identity_id" {
  description = "Specifies the primary user managed identity ID. Required if type within the identity block is set to either SystemAssigned, UserAssigned or UserAssigned."
  type        = string
  default     = null
}

variable "transparent_data_encryption_key_vault_key_id" {
  description = "The fully versioned Key Vault Key URL to be used as the Customer Managed Key for Transparent Data Encryption."
  type        = string
  default     = null
}

variable "identity" {
  description = "An identity block for the MS SQL Server."
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = null
}

variable "firewall_rules" {
  description = "A map of firewall rules. Key is the rule name, value is an object with start_ip_address and end_ip_address."
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
  default = {}
}

variable "virtual_network_rules" {
  description = "A map of virtual network rules. Key is the rule name, value is an object with subnet_id and optional ignore_missing_vnet_service_endpoint."
  type = map(object({
    subnet_id                            = string
    ignore_missing_vnet_service_endpoint = optional(bool, false)
  }))
  default = {}
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the MS SQL Server."
  type        = map(string)
  default     = {}
}
