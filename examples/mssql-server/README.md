# Terraform Module: Azure SQL Server

This Terraform module creates a Microsoft SQL Server instance in Azure, along with necessary configurations such as firewall rules.

## Prerequisites

- Terraform installed on your local machine
- Azure subscription
- Azure CLI installed (for authentication)

## Usage

### Example

```hcl
provider "azurerm" {
features {}
}

module "application_insight" {
  source  = "Think-Cube/mssql-server/azure"
  version = "1.0.0"
  resource_group_name = "dev-test-weu-rg"
  resource_group_location = "West Europe"
  application_insights_type = "web"
  environment = "dev"
  region = "weu"
  mssql_server_name = "examplemssql"
  mssql_server_version = "12.0"
  mssql_server_admin_login = "mssqladministrator"
  mssql_server_admin_password = "P@ssw0rd_123"
  mssql_server_minimum_tls_version = "1.2"
  mssql_server_public_network_access_enabled = true
  mssql_server_connection_policy = "Default"
  mssql_server_azure_ad_admin_login = "mssqladministrator@domain.com"
  mssql_server_azure_ad_admin_object_id = "<uuid>"
  mssql_server_azure_tenant_id = "<uuid>"
  mssql_server_ip_rules = {  
    "rule-01" = "10.10.1.0/24"
  }
  default_tags = {
      Administrator     = "John Doe"
      Department        = "IT"
      CostCentre        = "CC123"
      ContactPerson     = "Jane Smith"
      ManagedByTerraform = "True"
}
}
```

### Variables

- `resource_group_name`: Name of the resource group.
- `mssql_server_name`: Name of the SQL Server instance.
- `environment`: Name of the environment.
- `region`: Azure region where resources will be provisioned.
- `mssql_server_ip_rules`: Map of IP addresses permitted for access to the database.
- `mssql_server_version`: Version for the new server.
- `mssql_server_admin_login`: Administrator login name.
- `mssql_server_admin_password`: Password associated with the admin login.
- `mssql_server_minimum_tls_version`: Minimum TLS Version for SQL databases.
- `mssql_server_public_network_access_enabled`: Public network access allowed.
- `mssql_server_connection_policy`: Connection policy for the server.
- `mssql_server_azure_ad_admin_login`: Azure AD admin login username.
- `mssql_server_azure_ad_admin_object_id`: Azure AD admin object ID.
- `mssql_server_azure_tenant_id`: Tenant ID of the Azure AD administrator.

### Outputs

- `sql_server_id`: The Microsoft SQL Server ID
- `sql_server_name`: Azure SQL Server Name
- `sql_server_fqdn`: Fully qualified domain name of the SQL Server
- `sql_server_identity`: Identity properties assigned to Azure SQL Server

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## Contribution

Feel free to contribute by opening issues or pull requests. Your feedback and improvements are highly appreciated!
