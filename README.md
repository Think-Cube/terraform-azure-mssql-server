<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.94.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.94.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_firewall_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.94.0/docs/resources/mssql_firewall_rule) | resource |
| [azurerm_mssql_server.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.94.0/docs/resources/mssql_server) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.94.0/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.94.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_tenant_id"></a> [azure\_tenant\_id](#input\_azure\_tenant\_id) | The tenant id of the Azure AD Administrator of this SQL Server. | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A mapping of tags to assign to the resource. | `map(any)` | <pre>{<br>  "ManagedByTerraform": "True"<br>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Variable that defines the name of the environment. | `string` | `"dev"` | no |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | Map of IP addresses permitted for access to DB | `map(string)` | `{}` | no |
| <a name="input_mssql_server_name"></a> [mssql\_server\_name](#input\_mssql\_server\_name) | The name of the Microsoft SQL Server. This needs to be globally unique within Azure. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_mssql_server_version"></a> [mssql\_server\_version](#input\_mssql\_server\_version) | The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server). Changing this forces a new resource to be created. | `string` | `12` | no |
| <a name="input_mssql_serveradmin_login"></a> [mssql\_serveradmin\_login](#input\_mssql\_serveradmin\_login) | The administrator login name for the new server. Required unless azuread\_authentication\_only in the azuread\_administrator block is true. When omitted, Azure will generate a default username which cannot be subsequently changed. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_mssql_serveradmin_password"></a> [mssql\_serveradmin\_password](#input\_mssql\_serveradmin\_password) | The password associated with the administrator\_login user. Needs to comply with Azure's Password Policy. Required unless azuread\_authentication\_only in the azuread\_administrator block is true. | `string` | n/a | yes |
| <a name="input_mssql_serverazure_ad_admin_login"></a> [mssql\_serverazure\_ad\_admin\_login](#input\_mssql\_serverazure\_ad\_admin\_login) | The login username of the Azure AD Administrator of this SQL Server. | `string` | n/a | yes |
| <a name="input_mssql_serverazure_ad_admin_object_id"></a> [mssql\_serverazure\_ad\_admin\_object\_id](#input\_mssql\_serverazure\_ad\_admin\_object\_id) | The object id of the Azure AD Administrator of this SQL Server. | `string` | n/a | yes |
| <a name="input_mssql_serverconnection_policy"></a> [mssql\_serverconnection\_policy](#input\_mssql\_serverconnection\_policy) | The connection policy the server will use. Possible values are Default, Proxy, and Redirect. Defaults to Default. | `string` | `"Default"` | no |
| <a name="input_mssql_serverminimum_tls_version"></a> [mssql\_serverminimum\_tls\_version](#input\_mssql\_serverminimum\_tls\_version) | The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 , 1.2 and Disabled. Defaults to 1.2. | `string` | `"1.2"` | no |
| <a name="input_mssql_serverpublic_network_access_enabled"></a> [mssql\_serverpublic\_network\_access\_enabled](#input\_mssql\_serverpublic\_network\_access\_enabled) | Whether public network access is allowed for this server. Defaults to true. | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | Region in which resources are deployed. | `string` | `"weu"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Microsoft SQL Server. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The fully qualified domain name of the Azure SQL Server |
| <a name="output_id"></a> [id](#output\_id) | the Microsoft SQL Server ID. |
| <a name="output_identity"></a> [identity](#output\_identity) | Identity properties assigned to Azure SQL Server |
| <a name="output_name"></a> [name](#output\_name) | Azure SQL Server Name |
<!-- END_TF_DOCS -->