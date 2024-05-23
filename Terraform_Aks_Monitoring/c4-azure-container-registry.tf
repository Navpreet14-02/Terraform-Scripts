resource "azurerm_container_registry" "acr"{
    name = "aksAcr${random_string.random.result}"
    resource_group_name = azurerm_resource_group.aks-rg.name
    location = azurerm_resource_group.aks-rg.location
    sku = "Basic"
}

resource "azurerm_role_assignment" "acr-to-aks"{
    principal_id = azurerm_kubernetes_cluster.aks-cluster.kubelet_identity[0].object_id
    role_definition_name = "Acrpull"
    scope =azurerm_container_registry.acr.id
    skip_service_principal_aad_check = true
}
