# Example: Advanced — Azure MSSQL Server

Provisions an MSSQL Server with Azure AD administrator, firewall rules, system-assigned identity and Redirect connection policy.

```hcl
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
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mssql_server"></a> [mssql\_server](#module\_mssql\_server) | github.com/Think-Cube/terraform-azure-mssql-server | v1.0.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->