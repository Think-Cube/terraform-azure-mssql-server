resource "azurerm_mssql_server" "main" {
  name                          = "${var.environment}-${var.mssql_server_name}-${var.region}-sql"
  resource_group_name           = data.azurerm_resource_group.main.name
  location                      = data.azurerm_resource_group.main.location
  version                       = var.mssql_server_version
  administrator_login           = var.mssql_server_admin_login
  administrator_login_password  = var.mssql_server_admin_password
  minimum_tls_version           = var.mssql_server_minimum_tls_version
  public_network_access_enabled = var.mssql_server_public_network_access_enabled
  connection_policy             = var.mssql_server_connection_policy
  tags                          = var.default_tags

  lifecycle {
    ignore_changes = [
      administrator_login,
      administrator_login_password
    ]
  }

  identity {
    type = var.mssql_server_identity_type
  }

  dynamic "azuread_administrator" {
    for_each = var.mssql_server_azure_ad_admin_login != "" && var.mssql_server_azure_ad_admin_object_id != "" && var.mssql_server_azure_tenant_id != "" ? [1] : []
    content {
      login_username = var.mssql_server_azure_ad_admin_login
      object_id      = var.mssql_server_azure_ad_admin_object_id
      tenant_id      = var.mssql_server_azure_tenant_id
    }
  }

  dynamic "key_vault_key" {
    for_each = var.mssql_server_key_vault_key_id != null ? [1] : []
    content {
      key_vault_key_id = var.mssql_server_key_vault_key_id
    }
  }

  dynamic "auditing_policy" {
    for_each = var.mssql_server_auditing_policy != null ? [1] : []
    content {
      policy = var.mssql_server_auditing_policy
    }
  }
}
