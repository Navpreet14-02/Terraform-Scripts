terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm={
        source = "hashicorp/azurerm"
        version = "3.103.1"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = ">=2.15.0"
    }
  }
}

provider "azurerm" {
    features{
    }
}

provider "azuread"{
  tenant_id ="75f58a10-afdb-426a-a4a8-3f2004e96831"
}

