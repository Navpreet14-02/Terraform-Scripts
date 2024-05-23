resource "azuread_group" "aks_admins"{
    display_name = "${azurerm_resource_group.aks-rg.name}-cluster-admins"
    description = "Azure aks admins for aks cluster"
    security_enabled = true
    
}