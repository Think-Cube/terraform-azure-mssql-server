provider "azurerm" {
features {}
}

module "mssql_server" {
  source  = "Think-Cube/mssql-server/azure"
  version = "1.0.0"
  resource_group_name = "dev-test-weu-rg"
  resource_group_location = "West Europe"
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
