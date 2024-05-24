variable "ad_tenant_id" {
  type = string
  description = "Azure Entra ID tenant id"
  
}

variable "resource_group_name"{
    type = string
    description = "Name of the Resource Group"
}

variable "resource_group_location"{
    type = string
    description = "Location of the Resource Group"
}