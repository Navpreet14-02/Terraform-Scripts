resource "azurerm_network_security_group" "nsg"{
    name = "nsg"
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
}

resource "azurerm_network_security_rule" "AllowHTTP"{
    name = "RuleA"
    priority = 100
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range="*"
    destination_port_range="80"
    source_address_prefix = "*"
    destination_address_prefix="*"
    resource_group_name = azurerm_resource_group.myrg.name
    network_security_group_name = azurerm_network_security_group.nsg.name

}

resource "azurerm_network_security_rule" "AllowRDP"{
    name = "RuleB"
    priority = 110
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range="*"
    destination_port_range="3389"
    source_address_prefix  = "*"
    destination_address_prefix="*"
    resource_group_name = azurerm_resource_group.myrg.name
    network_security_group_name = azurerm_network_security_group.nsg.name

}

resource "azurerm_network_interface_security_group_association" "nsgToNic"{
    network_interface_id = azurerm_network_interface.vnic.id
    network_security_group_id = azurerm_network_security_group.nsg.id
}