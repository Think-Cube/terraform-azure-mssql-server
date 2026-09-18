module "mssql_server" {
  source = "github.com/Think-Cube/terraform-azure-mssql-server?ref=v1.0.0"

  name                = "sql-example-prod"
  resource_group_name = "rg-example"
  location            = "West Europe"

  administrator_login          = "sqladmin"
  administrator_login_password = "VeryStr0ngP@ss!"

  minimum_tls_version           = "1.2"
  public_network_access_enabled = false
  connection_policy             = "Redirect"

  identity = {
    type = "SystemAssigned"
  }

  azuread_administrator = {
    login_username              = "admin@example.com"
    object_id                   = "00000000-0000-0000-0000-000000000000"
    tenant_id                   = "11111111-1111-1111-1111-111111111111"
    azuread_authentication_only = false
  }

  firewall_rules = {
    "allow-office" = {
      start_ip_address = "203.0.113.0"
      end_ip_address   = "203.0.113.255"
    }
    "allow-azure-services" = {
      start_ip_address = "0.0.0.0"
      end_ip_address   = "0.0.0.0"
    }
  }

  tags = {
    environment = "prod"
    managed_by  = "terraform"
    cost_center = "data"
  }
}