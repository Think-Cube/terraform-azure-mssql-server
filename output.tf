output "id" {
  value       = azurerm_mssql_server.main.id
  description = "The Azure SQL Server ID."
  sensitive   = false
}

output "name" {
  value       = azurerm_mssql_server.main.name
  description = "The Azure SQL Server Name."
  sensitive   = false
}

output "fqdn" {
  value       = azurerm_mssql_server.main.fully_qualified_domain_name
  description = "Fully Qualified Domain Name of the SQL Server."
  sensitive   = false
}

output "location" {
  value       = azurerm_mssql_server.main.location
  description = "Azure region where the SQL Server is deployed."
  sensitive   = false
}

output "version" {
  value       = azurerm_mssql_server.main.version
  description = "SQL Server version."
  sensitive   = false
}

output "identity" {
  value       = azurerm_mssql_server.main.identity
  description = "System assigned identity details, if enabled."
  sensitive   = false
}

output "azure_ad_admin" {
  value       = azurerm_mssql_server.main.azuread_administrator
  description = "Azure AD Administrator details for the SQL Server."
  sensitive   = false
}

output "public_network_access" {
  value       = azurerm_mssql_server.main.public_network_access_enabled
  description = "Indicates whether public network access is enabled."
  sensitive   = false
}
