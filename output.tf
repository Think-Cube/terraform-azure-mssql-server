output "id" {
  description = "The ID of the MS SQL Server."
  value       = azurerm_mssql_server.main.id
}

output "name" {
  description = "The name of the MS SQL Server."
  value       = azurerm_mssql_server.main.name
}

output "fqdn" {
  description = "The fully qualified domain name of the MS SQL Server."
  value       = azurerm_mssql_server.main.fully_qualified_domain_name
}

output "identity" {
  description = "The identity of the MS SQL Server."
  value       = azurerm_mssql_server.main.identity
}
