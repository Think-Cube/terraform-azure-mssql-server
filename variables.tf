###########################
# Common vars
###########################
variable "environment" {
  description = "Variable that defines the name of the environment."
  type        = string
  default     = "dev"
}
variable "default_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default = {
    "ManagedByTerraform" = "True"
  }
}
variable "region" {
  description = "Region in which resources are deployed."
  type        = string
  default     = "weu"
}
###########################
# Resource groups vars
###########################
variable "resource_group_location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  default     = "West Europe"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Microsoft SQL Server. Changing this forces a new resource to be created."
  type        = string
}
###########################
# MSSQL Server vars
###########################
variable "mssql_server_name" {
  description = "The name of the Microsoft SQL Server. This needs to be globally unique within Azure. Changing this forces a new resource to be created."
  type        = string
}
variable "mssql_server_version" {
  description = "The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server). Changing this forces a new resource to be created."
  type        = number
  default     = 12.0
}
variable "mssql_serveradmin_login" {
  description = "The administrator login name for the new server. Required unless azuread_authentication_only in the azuread_administrator block is true. When omitted, Azure will generate a default username which cannot be subsequently changed. Changing this forces a new resource to be created."
  type        = string
}
variable "mssql_serveradmin_password" {
  description = "The password associated with the administrator_login user. Needs to comply with Azure's Password Policy. Required unless azuread_authentication_only in the azuread_administrator block is true."
  type        = string
}
variable "mssql_serverminimum_tls_version" {
  description = "The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 , 1.2 and Disabled. Defaults to 1.2."
  type        = string
  default     = "1.2"
}
variable "mssql_serverpublic_network_access_enabled" {
  description = "Whether public network access is allowed for this server. Defaults to true."
  type        = bool
  default     = true
}
variable "mssql_serverconnection_policy" {
  description = "The connection policy the server will use. Possible values are Default, Proxy, and Redirect. Defaults to Default."
  type        = string
  default     = "Default"
}
variable "mssql_serverazure_ad_admin_login" {
  description = "The login username of the Azure AD Administrator of this SQL Server."
  type        = string
}
variable "mssql_serverazure_ad_admin_object_id" {
  description = "The object id of the Azure AD Administrator of this SQL Server."
  type        = string
}
variable "azure_tenant_id" {
  description = "The tenant id of the Azure AD Administrator of this SQL Server."
  type        = string
}
variable "ip_rules" {
  type        = map(string)
  description = "Map of IP addresses permitted for access to DB"
  default     = {}
}