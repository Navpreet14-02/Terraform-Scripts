resource "azurerm_log_analytics_workspace" "aks-log-workspace" {
  name = "aks-log-workspace"
  location = azurerm_resource_group.aks-rg.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  sku = "PerGB2018"
  retention_in_days = 30
}

