output "id" {
  value       = azurerm_mssql_server.main.id
  description = "the Microsoft SQL Server ID."
  sensitive   = false
}

output "name" {
  value       = azurerm_mssql_server.main.name
  description = "Azure SQL Server Name"
  sensitive   = false
}

output "fqdn" {
  value       = azurerm_mssql_server.main.fully_qualified_domain_name
  description = "The fully qualified domain name of the Azure SQL Server"
  sensitive   = false
}

output "identity" {
  value       = azurerm_mssql_server.main.identity
  description = "Identity properties assigned to Azure SQL Server"
  sensitive   = false
}