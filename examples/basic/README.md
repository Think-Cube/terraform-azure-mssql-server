# Terraform Azure SQL Server Module – Basic Example

This example demonstrates a **basic Azure SQL Server deployment**.

## Description

- Public network access enabled
- Simple firewall rules (IP/CIDR)
- System-assigned managed identity enabled
- No Azure AD admin configured
- No Key Vault TDE encryption
- Suitable for development or test environments

## Features

- Easy deployment of SQL Server
- Supports IP-based firewall rules
- Configurable TLS version
- Tagged resources for governance

```yml
module "mssql_server_basic" {
  source                                     = "./terraform-azure-mssql-server"
  environment                                = "dev"
  region                                     = "westeurope"
  resource_group_name                        = "rg-dev"
  resource_group_location                    = "westeurope"
  mssql_server_name                          = "appdb"
  mssql_server_version                       = "12.0"
  mssql_server_admin_login                   = "sqladminuser"
  mssql_server_admin_password                = "StrongP@ssw0rd!"
  mssql_server_minimum_tls_version           = "1.2"
  mssql_server_connection_policy             = "Default"
  mssql_server_public_network_access_enabled = true
  mssql_server_identity_type                 = "SystemAssigned"
  mssql_server_azure_ad_admin_login          = ""
  mssql_server_azure_ad_admin_object_id      = ""
  mssql_server_azure_tenant_id               = ""
  mssql_server_key_vault_key_id              = null
  mssql_server_ip_rules = {
    "office"    = "192.168.1.15"
    "vpn-range" = "10.0.0.0/24"
  }

  default_tags = {
    environment = "dev"
    project     = "example"
  }
}
```