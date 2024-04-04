resource "azurerm_mssql_server" "main" {
  name                          = "${var.environment}-${var.mssql_server_name}-${var.region}-sql"
  resource_group_name           = data.azurerm_resource_group.main.name
  location                      = data.azurerm_resource_group.main.location
  version                       = var.mssql_server_version
  administrator_login           = var.mssql_serveradmin_login
  administrator_login_password  = var.mssql_serveradmin_password
  minimum_tls_version           = var.mssql_serverminimum_tls_version
  public_network_access_enabled = var.mssql_serverpublic_network_access_enabled
  connection_policy             = var.mssql_serverconnection_policy
  tags                          = var.default_tags

  lifecycle {
    ignore_changes = [
      administrator_login,
      administrator_login_password
    ]
  }

  identity {
    type = "SystemAssigned"
  }

  azuread_administrator {
    login_username = var.mssql_serverazure_ad_admin_login
    object_id      = var.mssql_serverazure_ad_admin_object_id
    tenant_id      = var.azure_tenant_id
  }
}