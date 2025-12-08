module "mssql_basic" {
  source                                     = "./terraform-azure-mssql-server"
  environment                                = "dev"
  region                                     = "westeurope"
  resource_group_name                        = "rg-dev"
  mssql_server_name                          = "demo-sql"
  mssql_server_admin_login                   = "sqladmin"
  mssql_server_admin_password                = "StrongP@ssw0rd123!"
  mssql_server_identity_type                 = "SystemAssigned"
  mssql_server_public_network_access_enabled = true
  mssql_server_ip_rules                      = {}
}
