resource "azurerm_public_ip" "pubIP"{
  depends_on = [ 
  azurerm_virtual_network.vnet,
  azurerm_subnet.subnet-1
  ]
  name = "publicIP"
  resource_group_name = azurerm_resource_group.myrg.name
  location = azurerm_resource_group.myrg.location
  allocation_method = "Static"
}

resource "azurerm_network_interface" "vnic"{
    name = "vnic"
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
    
    ip_configuration {
        name = "vnic-config"
        subnet_id = azurerm_subnet.subnet-1.id
        private_ip_address_allocation="Dynamic"
        public_ip_address_id = azurerm_public_ip.pubIP.id
    }
}


resource "azurerm_windows_virtual_machine" "vm"{
    name = "winvm"
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
    network_interface_ids = [azurerm_network_interface.vnic.id]

    
    size = var.vm_size
    admin_username=var.vm_admin_username
    admin_password=var.vm_admin_password

    os_disk{
        name = "osdisk"
        caching = "ReadWrite"
        storage_account_type="Standard_LRS"
    }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

