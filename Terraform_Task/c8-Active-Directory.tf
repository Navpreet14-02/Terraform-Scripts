data "azuread_domains" "primaryDomain"{
    only_initial = true
}

data "azurerm_role_definition" "role"{
    name = "Reader"
}

resource "azuread_user" "usera"{
    user_principal_name = "usera@${data.azuread_domains.primaryDomain.domains.0.domain_name}"
    display_name = "usera"
    password = "Cust!2345"
}

resource "azurerm_role_assignment" "roleA"{
    scope = azurerm_resource_group.myrg.id
    role_definition_id = data.azurerm_role_definition.role.id
    principal_id = azuread_user.usera.id
}



