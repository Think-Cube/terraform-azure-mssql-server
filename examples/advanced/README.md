# Terraform Azure SQL Server Module – Advanced Example

This example demonstrates a **production-ready Azure SQL Server deployment**.

## Description

- Public network access disabled
- Firewall rules restricted to corporate IPs or VPN
- Azure AD administrator configured
- Key Vault TDE encryption enabled
- System-assigned managed identity enabled
- Suitable for production workloads

## Features

- Secure, production-ready SQL Server
- Supports Azure AD authentication
- Customer-managed TDE encryption via Key Vault
- IP/CIDR or VNET-restricted firewall rules
- Tagged resources for governance and cost management
- Minimum TLS version enforced

```yml
module "mssql_server_advanced" {
  source                                     = "./terraform-azure-mssql-server"
  environment                                = "prod"
  region                                     = "westeurope"
  resource_group_name                        = "rg-prod"
  resource_group_location                    = "westeurope"
  mssql_server_name                          = "appdb"
  mssql_server_version                       = "12.0"
  mssql_server_admin_login                   = "sqladmin"
  mssql_server_admin_password                = "ProdStr0ngP@ss!"
  mssql_server_minimum_tls_version           = "1.2"
  mssql_server_connection_policy             = "Default"
  mssql_server_public_network_access_enabled = false
  mssql_server_identity_type                 = "SystemAssigned"
  mssql_server_azure_ad_admin_login          = "aadadmin@example.com"
  mssql_server_azure_ad_admin_object_id      = "00000000-0000-0000-0000-000000000000"
  mssql_server_azure_tenant_id               = "11111111-1111-1111-1111-111111111111"
  mssql_server_key_vault_key_id              = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-prod/providers/Microsoft.KeyVault/vaults/kv-prod/keys/sql-tde-key"
  mssql_server_ip_rules = {
    "corp-office" = "203.0.113.10"
    "vpn"         = "10.0.0.0/16"
  }
  default_tags = {
    environment = "prod"
    project     = "secure-app"
  }
}
```