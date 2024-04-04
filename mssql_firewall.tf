locals {
  ip_rules    = { for e in [for k, ip in var.ip_rules : try(regex("/", ip), 0) != 0 ? { (k) = { start_ip_address = cidrhost(ip, 0), end_ip_address = cidrhost(ip, -1) } } : { (k) = { start_ip_address = ip, end_ip_address = ip } }] : keys(e)[0] => e[keys(e)[0]] }
}


resource "azurerm_mssql_firewall_rule" "main" {
  for_each = local.ip_rules

  name             = "sql-firewall-rule-${var.mssql_server_name}-${var.environment}-${var.region}-${each.key}"
  server_id        = azurerm_mssql_server.this.id
  start_ip_address = each.value["start_ip_address"]
  end_ip_address   = each.value["end_ip_address"]
}