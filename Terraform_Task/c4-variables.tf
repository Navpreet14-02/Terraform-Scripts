variable "vm_size"{
    type=string
    description = "Size of the VM"
    default = "Standard_DS1_v2"
}

variable "vm_admin_username" {
    type=string
    description = "Admin username for the VM"
    default = "testadmin"
}

variable "vm_admin_password" {
    type=string
    description = "Admin password for the VM"
    default = "Passord1234!"
}

variable "resource_group_name"{
    type = string
    description = "Name of the Resource Group"
}

variable "resource_group_location"{
    type = string
    description = "Location of the Resource Group"
}