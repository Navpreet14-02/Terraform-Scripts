output "location" {
  value = azurerm_resource_group.aks-rg.location
}

output "resource_group_id" {
  value = azurerm_resource_group.aks-rg.id

}

output "resource_group_name" {
  value = azurerm_resource_group.aks-rg.name

}

output "azure_ad_group_id" {
  value = azuread_group.aks_admins.id
}


output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks-cluster.id

}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks-cluster.name
}

