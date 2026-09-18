module "mssql_server" {
  source = "github.com/Think-Cube/terraform-azure-mssql-server?ref=v1.0.0"

  name                = "sql-example-dev"
  resource_group_name = "rg-example"
  location            = "West Europe"

  administrator_login          = "sqladmin"
  administrator_login_password = "StrongP@ssw0rd123!"

  minimum_tls_version           = "1.2"
  public_network_access_enabled = false

  tags = {
    environment = "dev"
    managed_by  = "terraform"
  }
}
