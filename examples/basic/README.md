# Example: Basic — Azure MSSQL Server

Provisions an `azurerm_mssql_server` with SQL authentication, TLS 1.2 enforcement and no public network access.

```hcl
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