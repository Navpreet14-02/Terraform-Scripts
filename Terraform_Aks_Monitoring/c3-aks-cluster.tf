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

  # role_based_access_control {
  #   enable = true
  #   azure_active_directory {
  #     managed = true
  #     admin_group_object_ids = [azuread_group.aks_admins.id]
  #   }
  # }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin = "kubenet"
  }

  # azure_active_directory_role_based_access_control {
  #   admin_group_object_ids = [ azuread_group.aks_admins.id ]
  #   azure_rbac_enabled = true
  #   tenant_id = var.ad_tenant_id
    
  # }


  local_account_disabled = true

  # windows_profile {s
  #   admin_password = ""
  #   admin_username = ""
  # }

  # linux_profile {
  #   admin_username = 
  # }


}

# resource "azurerm_role_assignment" "example" {
#   depends_on           = [azurerm_resource_group.aks-rg]
#   scope                = azurerm_resource_group.aks-rg.id
#   role_definition_name = "Azure Kubernetes Service Cluster Admin Role"
#   principal_id         = azuread_group.aks_admins.object_id
# }