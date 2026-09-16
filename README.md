## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.62.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.62.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_firewall_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.62.0/docs/resources/mssql_firewall_rule) | resource |
| [azurerm_mssql_server.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.62.0/docs/resources/mssql_server) | resource |
| [azurerm_mssql_server_extended_auditing_policy.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.62.0/docs/resources/mssql_server_extended_auditing_policy) | resource |
| [azurerm_mssql_server_transparent_data_encryption.tde](https://registry.terraform.io/providers/hashicorp/azurerm/4.62.0/docs/resources/mssql_server_transparent_data_encryption) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.62.0/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.62.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Map of default tags to assign to all resources. Tags help organize and identify resources in Azure. | `map(any)` | <pre>{<br/>  "ManagedByTerraform": "True"<br/>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment in which this resource is deployed (e.g., dev, test, prod). | `string` | `"dev"` | no |
| <a name="input_mssql_server_admin_login"></a> [mssql\_server\_admin\_login](#input\_mssql\_server\_admin\_login) | Administrator login for the SQL Server. Required unless Azure AD only authentication is used. | `string` | n/a | yes |
| <a name="input_mssql_server_admin_password"></a> [mssql\_server\_admin\_password](#input\_mssql\_server\_admin\_password) | Password for the SQL Server administrator. Must meet Azure Password Policy. | `string` | n/a | yes |
| <a name="input_mssql_server_azure_ad_admin_login"></a> [mssql\_server\_azure\_ad\_admin\_login](#input\_mssql\_server\_azure\_ad\_admin\_login) | Login username for the Azure AD Administrator of the SQL Server. | `string` | `""` | no |
| <a name="input_mssql_server_azure_ad_admin_object_id"></a> [mssql\_server\_azure\_ad\_admin\_object\_id](#input\_mssql\_server\_azure\_ad\_admin\_object\_id) | Object ID of the Azure AD Administrator. | `string` | `""` | no |
| <a name="input_mssql_server_azure_tenant_id"></a> [mssql\_server\_azure\_tenant\_id](#input\_mssql\_server\_azure\_tenant\_id) | Azure Tenant ID of the Azure AD Administrator. | `string` | `""` | no |
| <a name="input_mssql_server_connection_policy"></a> [mssql\_server\_connection\_policy](#input\_mssql\_server\_connection\_policy) | Connection policy for the SQL Server. Valid values: Default, Proxy, Redirect. | `string` | `"Default"` | no |
| <a name="input_mssql_server_extended_auditing"></a> [mssql\_server\_extended\_auditing](#input\_mssql\_server\_extended\_auditing) | Optional extended auditing policy for SQL Server. Provide as a map:<br/>- storage\_endpoint (string, required)<br/>- storage\_account\_access\_key (string, required)<br/>- retention\_in\_days (number, optional, default 90) | `any` | `null` | no |
| <a name="input_mssql_server_identity_type"></a> [mssql\_server\_identity\_type](#input\_mssql\_server\_identity\_type) | Type of identity for the SQL Server. Options: None, SystemAssigned. | `string` | `"SystemAssigned"` | no |
| <a name="input_mssql_server_ip_rules"></a> [mssql\_server\_ip\_rules](#input\_mssql\_server\_ip\_rules) | Map of allowed IP addresses or CIDRs for firewall rules. Key = name, value = IP/CIDR. | `map(string)` | `{}` | no |
| <a name="input_mssql_server_key_vault_key_id"></a> [mssql\_server\_key\_vault\_key\_id](#input\_mssql\_server\_key\_vault\_key\_id) | Optional Key Vault key ID for TDE encryption (Customer Managed Key). If not set, TDE uses service-managed keys. | `string` | `null` | no |
| <a name="input_mssql_server_minimum_tls_version"></a> [mssql\_server\_minimum\_tls\_version](#input\_mssql\_server\_minimum\_tls\_version) | Minimum TLS version enforced for SQL connections. Valid values: 1.0, 1.1, 1.2, Disabled. | `string` | `"1.2"` | no |
| <a name="input_mssql_server_name"></a> [mssql\_server\_name](#input\_mssql\_server\_name) | Base name for the Microsoft SQL Server. Must be globally unique. | `string` | n/a | yes |
| <a name="input_mssql_server_public_network_access_enabled"></a> [mssql\_server\_public\_network\_access\_enabled](#input\_mssql\_server\_public\_network\_access\_enabled) | Enable or disable public network access to the SQL Server. | `bool` | `true` | no |
| <a name="input_mssql_server_version"></a> [mssql\_server\_version](#input\_mssql\_server\_version) | SQL Server version. Valid values: 2.0 (v11) and 12.0 (v12). | `string` | `"12.0"` | no |
| <a name="input_region"></a> [region](#input\_region) | Azure region where resources will be deployed. | `string` | `"westeurope"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the Resource Group. Changing this will force a new resource creation. | `string` | `"westeurope"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the existing Azure Resource Group to deploy the SQL Server into. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_ad_admin"></a> [azure\_ad\_admin](#output\_azure\_ad\_admin) | Azure AD Administrator details for the SQL Server. |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | Fully Qualified Domain Name of the SQL Server. |
| <a name="output_id"></a> [id](#output\_id) | The Azure SQL Server ID. |
| <a name="output_identity"></a> [identity](#output\_identity) | System assigned identity details, if enabled. |
| <a name="output_location"></a> [location](#output\_location) | Azure region where the SQL Server is deployed. |
| <a name="output_name"></a> [name](#output\_name) | The Azure SQL Server Name. |
| <a name="output_public_network_access"></a> [public\_network\_access](#output\_public\_network\_access) | Indicates whether public network access is enabled. |
| <a name="output_version"></a> [version](#output\_version) | SQL Server version. |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_firewall_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_firewall_rule) | resource |
| [azurerm_mssql_server.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [azurerm_mssql_virtual_network_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_virtual_network_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | The administrator login name for the new server. Required unless azuread\_authentication\_only is true in the azuread\_administrator block. | `string` | `null` | no |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | The password associated with the administrator\_login user. | `string` | `null` | no |
| <a name="input_azuread_administrator"></a> [azuread\_administrator](#input\_azuread\_administrator) | An Azure AD Administrator block for the MS SQL Server. | <pre>object({<br>    login_username              = string<br>    object_id                   = string<br>    tenant_id                   = optional(string)<br>    azuread_authentication_only = optional(bool)<br>  })</pre> | `null` | no |
| <a name="input_connection_policy"></a> [connection\_policy](#input\_connection\_policy) | The connection policy the server will use. Possible values: Default, Proxy, Redirect. | `string` | `"Default"` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | A map of firewall rules. Key is the rule name, value is an object with start\_ip\_address and end\_ip\_address. | <pre>map(object({<br>    start_ip_address = string<br>    end_ip_address   = string<br>  }))</pre> | `{}` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | An identity block for the MS SQL Server. | <pre>object({<br>    type         = string<br>    identity_ids = optional(list(string))<br>  })</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the MS SQL Server should be created. | `string` | n/a | yes |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid value: 1.2. | `string` | `"1.2"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the MS SQL Server. Must be globally unique. | `string` | n/a | yes |
| <a name="input_outbound_network_restriction_enabled"></a> [outbound\_network\_restriction\_enabled](#input\_outbound\_network\_restriction\_enabled) | Whether outbound network traffic is restricted for this server. | `bool` | `false` | no |
| <a name="input_primary_user_assigned_identity_id"></a> [primary\_user\_assigned\_identity\_id](#input\_primary\_user\_assigned\_identity\_id) | Specifies the primary user managed identity ID. Required if type within the identity block is set to either SystemAssigned, UserAssigned or UserAssigned. | `string` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is allowed for this server. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group where the MS SQL Server should be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the MS SQL Server. | `map(string)` | `{}` | no |
| <a name="input_transparent_data_encryption_key_vault_key_id"></a> [transparent\_data\_encryption\_key\_vault\_key\_id](#input\_transparent\_data\_encryption\_key\_vault\_key\_id) | The fully versioned Key Vault Key URL to be used as the Customer Managed Key for Transparent Data Encryption. | `string` | `null` | no |
| <a name="input_version"></a> [version](#input\_version) | The version of the MS SQL Server. Valid values: 2.0 (for v11 server) and 12.0 (for v12 server). | `string` | `"12.0"` | no |
| <a name="input_virtual_network_rules"></a> [virtual\_network\_rules](#input\_virtual\_network\_rules) | A map of virtual network rules. Key is the rule name, value is an object with subnet\_id and optional ignore\_missing\_vnet\_service\_endpoint. | <pre>map(object({<br>    subnet_id                            = string<br>    ignore_missing_vnet_service_endpoint = optional(bool, false)<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The fully qualified domain name of the MS SQL Server. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the MS SQL Server. |
| <a name="output_identity"></a> [identity](#output\_identity) | The identity of the MS SQL Server. |
| <a name="output_name"></a> [name](#output\_name) | The name of the MS SQL Server. |
<!-- END_TF_DOCS -->