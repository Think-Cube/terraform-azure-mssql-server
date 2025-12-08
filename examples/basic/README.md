# Terraform Module: Azure MSSQL Server

This Terraform module deploys an **Azure SQL Server** with optional features for **TDE (Transparent Data Encryption)** and **Auditing**.

## Features

- Create SQL Server with system-assigned identity
- Configure Azure AD Administrator
- Optional firewall rules (IP addresses or CIDR ranges)
- Optional Transparent Data Encryption (Customer Managed Key via Key Vault)
- Optional Auditing to Azure Storage and Log Analytics

## Usage Examples

### Basic Usage

```yml
module "mssql_basic" {
  source = "./modules/mssql-server"
  environment = "dev"
  resource_group_name = "rg-dev"
  mssql_server_name = "demo-sql"
  mssql_server_admin_login = "sqladmin"
  mssql_server_admin_password = "StrongP@ssw0rd123!"
}
```