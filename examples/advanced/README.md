# Terraform Module: Azure MSSQL Server (Advanced Usage)

This module deploys an **Azure SQL Server** in production-ready configuration with advanced features:

- **Azure AD Administrator** for centralized identity management  
- **Firewall rules** (IP addresses or CIDR ranges)  
- **Transparent Data Encryption (TDE)** using **Customer Managed Key (CMK)** from Azure Key Vault  
- **Auditing** to Azure Storage and optional Log Analytics workspace  

---

## Example Usage

```yml
module "mssql_advanced" {
  source                                     = "./terraform-azure-mssql-server"
  environment                                = "prod"
  region                                     = "westeurope"
  resource_group_name                        = "rg-prod"
  mssql_server_name                          = "prod-sql"
  mssql_server_admin_login                   = "sqladmin"
  mssql_server_admin_password                = "VeryStr0ngP@ss!"
  mssql_server_identity_type                 = "SystemAssigned"
  mssql_server_public_network_access_enabled = true
  mssql_server_azure_ad_admin_login          = "admin@tenant.onmicrosoft.com"
  mssql_server_azure_ad_admin_object_id      = "00000000-0000-0000-0000-000000000000"
  mssql_server_azure_tenant_id               = "11111111-1111-1111-1111-111111111111"
  mssql_server_ip_rules = {
    "office" = "203.0.113.5"
    "vpn"    = "10.0.0.0/24"
  }
  mssql_server_key_vault_key_id = "/subscriptions/xxxx/resourceGroups/rg-prod/providers/Microsoft.KeyVault/vaults/my-kv/keys/mykey"
  mssql_server_auditing_policy = {
    storage_endpoint           = "https://mystorage.blob.core.windows.net/"
    storage_account_access_key = "base64encodedkey=="
    retention_in_days          = 90
    log_analytics_workspace_id = "/subscriptions/xxxx/resourceGroups/rg-prod/providers/Microsoft.OperationalInsights/workspaces/my-law"
  }
}
```