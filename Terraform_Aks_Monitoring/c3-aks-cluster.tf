resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name = "aks-cluster"
  location = azurerm_resource_group.aks-rg.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  dns_prefix = "aksDNS"
  
  
  default_node_pool {
    name = "systempool"
    node_count = 2
    vm_size = "Standard_D2_V2"
    type = "VirtualMachineScaleSets"
  }

  identity {
    type = "SystemAssigned"
  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.aks-log-workspace.id
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin = "kubenet"
  }

 
  # azure_active_directory_role_based_access_control {
  #   admin_group_object_ids = [ azuread_group.aks_admins.id ] # This line gives the error 'can't specify admin_group_object_ids when using managed aad rbac (managed = false)'
  #   azure_rbac_enabled = true
  #   tenant_id = var.ad_tenant_id
    
  # }

  local_account_disabled = true


}
