resource "azurerm_log_analytics_workspace" "log_workspace" {
  name = "log-workspace"
  location = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  sku = "PerGB2018"
  retention_in_days = 30    
}

resource "azurerm_monitor_diagnostic_setting" "vm-log-settings" {
  name = "vm-log-settings"
  target_resource_id = azurerm_windows_virtual_machine.vm.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_workspace.id

  metric {
    category = "AllMetrics"
    
  }
}

resource "azurerm_monitor_action_group" "action-grp" {
  name="action-grp"
  resource_group_name = azurerm_resource_group.myrg.name
  short_name = "actGrp"

  email_receiver {
    name = "myemail"
    email_address = "naviubhi123@gmail.com"
  }

}

resource "azurerm_monitor_metric_alert" "alert-1" {
  name = "vm-cpu-alert"
  description = "ALert for CPU usage"
  resource_group_name = azurerm_resource_group.myrg.name
  scopes = [ azurerm_windows_virtual_machine.vm.id ]

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name = "Percentage CPU"
    aggregation = "Average"
    operator = "GreaterThan"
    threshold = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.action-grp.id
  }
}