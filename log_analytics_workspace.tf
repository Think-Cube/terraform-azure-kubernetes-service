data "azurerm_log_analytics_workspace" "main" {
  name                = var.name_log_analytics_workspace
  resource_group_name = data.azurerm_resource_group.rg.name
}
