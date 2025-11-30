variable "environment" {
  description = "Environment in which this resource is deployed (e.g., dev, test, prod)."
  type        = string
  default     = "dev"
}

variable "default_tags" {
  description = "Map of default tags to assign to all resources. Tags help organize and identify resources in Azure."
  type        = map(any)
  default = {
    "ManagedByTerraform" = "True"
  }
}

variable "region" {
  description = "Azure region where resources will be deployed."
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Name of the existing Azure Resource Group to deploy the SQL Server into."
  type        = string
}

variable "resource_group_location" {
  description = "Location of the Resource Group. Changing this will force a new resource creation."
  type        = string
  default     = "West Europe"
}

variable "mssql_server_name" {
  description = "Base name for the Microsoft SQL Server. Must be globally unique."
  type        = string
}

variable "mssql_server_version" {
  description = "SQL Server version. Valid values: 2.0 (v11) and 12.0 (v12)."
  type        = string
  default     = "12.0"
}

variable "mssql_server_admin_login" {
  description = "Administrator login for the SQL Server. Required unless Azure AD only authentication is used."
  type        = string
}

variable "mssql_server_admin_password" {
  description = "Password for the SQL Server administrator. Must meet Azure Password Policy."
  type        = string
  sensitive   = true
}

variable "mssql_server_minimum_tls_version" {
  description = "Minimum TLS version enforced for SQL connections. Valid values: 1.0, 1.1, 1.2, Disabled."
  type        = string
  default     = "1.2"
}

variable "mssql_server_public_network_access_enabled" {
  description = "Enable or disable public network access to the SQL Server."
  type        = bool
  default     = true
}

variable "mssql_server_connection_policy" {
  description = "Connection policy for the SQL Server. Valid values: Default, Proxy, Redirect."
  type        = string
  default     = "Default"
}

variable "mssql_server_azure_ad_admin_login" {
  description = "Login username for the Azure AD Administrator of the SQL Server."
  type        = string
}

variable "mssql_server_azure_ad_admin_object_id" {
  description = "Object ID of the Azure AD Administrator."
  type        = string
}

variable "mssql_server_azure_tenant_id" {
  description = "Azure Tenant ID of the Azure AD Administrator."
  type        = string
}

variable "mssql_server_ip_rules" {
  description = "Map of allowed IP addresses or CIDRs for firewall rules. Key = name, value = IP/CIDR."
  type        = map(string)
  default     = {}
}

variable "mssql_server_identity_type" {
  description = "Type of identity for the SQL Server. Options: None, SystemAssigned."
  type        = string
  default     = "SystemAssigned"
}

variable "mssql_server_key_vault_key_id" {
  description = "Optional Key Vault key ID for TDE encryption. If not set, TDE uses service-managed keys."
  type        = string
  default     = null
}

variable "mssql_server_auditing_policy" {
  description = "Optional auditing policy block. Follow AzureRM documentation structure."
  type        = any
  default     = null
}
